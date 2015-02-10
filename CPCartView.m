//
//  CPCartView.m
//  CollectionProject
//
//  Created by Vinay on 05/02/15.
//  Copyright (c) 2015 Vinay. All rights reserved.
//

#import "CPCartView.h"
#import "AppDelegate.h"
#import "CartClass.h"
#import "CartCustomeCell.h"

@implementation CPCartView
@synthesize managedObjectContext;

-(void)viewDidLoad
{
    AppDelegate* appDelegate  = [UIApplication sharedApplication].delegate;
    self.managedObjectContext = appDelegate.managedObjectContext;
    
    textValue = @"";
    cartProductArray = [self cartProducts];
    [_cartTableView reloadData];
}



-(NSArray*)cartProducts
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ProductCart"
                                              inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError* error;
    
    NSArray *fetchedRecords = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    return fetchedRecords;
}

#pragma mark - Table view data source and delegte

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [cartProductArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *simpleTableIdentifier = @"CartCustomeCell";
    
    CartCustomeCell *cell = (CartCustomeCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CartCustomeCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        
    }
       cell.selectionStyle = UITableViewCellSelectionStyleNone;
    CartClass *cart = [cartProductArray objectAtIndex:indexPath.row];
    NSData *data = cart.productImage;
    UIImage *image = [UIImage imageWithData:data];
    cell.imageProduct.image = image;
    cell.productName.text = cart.productName;
    cell.price.text = cart.productPrice;
    cell.quantity.text = cart.quantity;
    cell.parentView = self;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    
}

#pragma Action

- (IBAction)deleteProductsClicked:(id)sender
{
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:_cartTableView];
    NSIndexPath *indexPath = [_cartTableView indexPathForRowAtPoint:buttonPosition];
    [self performSelector:@selector(_deleteProductFromCart:) withObject:indexPath];
}

-(void)_deleteProductFromCart: (NSIndexPath *)indexPath
{
    NSString *idValue = [[cartProductArray objectAtIndex:indexPath.row] idValue];
    NSManagedObjectContext *context = self.managedObjectContext;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:[NSEntityDescription entityForName:@"ProductCart" inManagedObjectContext:context]];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"idValue == %@",idValue]];
    NSError* error = nil;
    NSArray* results = [context executeFetchRequest:fetchRequest error:&error];
    
    for (NSManagedObject *currentObj in results) {
        [context deleteObject:currentObj];
    }
    NSError* error1 = nil;
    [context save:&error1];
    
    if ([context save:&error] == NO) {
        NSAssert(NO, @"Save should not fail\n%@", [error localizedDescription]);
        abort();
    }
    cartProductArray = [self cartProducts];
    
    [UIView transitionWithView: _cartTableView
                      duration: 0.35f
                       options: UIViewAnimationOptionTransitionCrossDissolve
                    animations: ^(void)
     {
         [_cartTableView reloadData];
     }
                    completion: ^(BOOL isFinished)
     {
     }];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    textValue = textField.text;
    
    CGPoint textViewPosition = [textField convertPoint:CGPointZero toView:_cartTableView];
    NSIndexPath *indexPath = [_cartTableView indexPathForRowAtPoint:textViewPosition];
    [self performSelector:@selector(_updateCartProductQuantity:) withObject:indexPath];

    NSLog(@"%ld",indexPath.row);
    
    return YES;
}

-(void)_updateCartProductQuantity: (NSIndexPath *)indexpath
{
   
    NSString *Id = [[cartProductArray objectAtIndex:indexpath.row] idValue];

    
    NSFetchRequest *fetchRequest=[NSFetchRequest fetchRequestWithEntityName:@"ProductCart"];
    NSPredicate *predicate=[NSPredicate predicateWithFormat:@"idValue==%@",Id];
    fetchRequest.predicate=predicate;
    CartClass * cart=[[self.managedObjectContext executeFetchRequest:fetchRequest error:nil] lastObject];
    
    cart.quantity = textValue;

    [self.managedObjectContext save:nil];
}

@end
