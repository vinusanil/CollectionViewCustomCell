//
//  CPProductDeatilView.m
//  CollectionProject
//
//  Created by Vinay on 04/02/15.
//  Copyright (c) 2015 Vinay. All rights reserved.
//

#import "CPProductDeatilView.h"
#import "Application.h"
#import "CartClass.h"
#import "AppDelegate.h"

@implementation CPProductDeatilView
@synthesize productNameId,managedObjectContext;


#pragma ViewController life cycle

-(void)viewDidLoad
{
    [super viewDidLoad];
    AppDelegate* appDelegate  = [UIApplication sharedApplication].delegate;
    self.managedObjectContext = appDelegate.managedObjectContext;
    _productImage.image = [UIImage imageNamed:[[Application productId] productImage]];
    _productName.text = [[Application productId] productName];
    _priceLabel.text = [[Application productId] price];
}

#pragma Action

- (IBAction)AddtoCartClicked:(id)sender {
    NSArray *cartProductArray = [self cartProducts];
    NSInteger cartCount  = 0;
    cartCount = [cartProductArray count] + 1;
    
    //Image conversion.
    
    UIImage *image = [UIImage imageNamed:[[Application productId] productImage]];
    
    NSData *dataImage = [[NSData alloc] init];
    dataImage = UIImagePNGRepresentation(image);
  //  NSString *stringImage = [dataImage base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    CartClass * cart = [NSEntityDescription insertNewObjectForEntityForName:@"ProductCart"
                                                     inManagedObjectContext:self.managedObjectContext];
    cart.idValue = [NSString stringWithFormat:@"%ld",cartCount];
    cart.productImage = dataImage;
    cart.productId = [[Application productId] productId];
    cart.productName = [[Application productId]productName];
    cart.productPrice = [[Application productId] price];
    cart.quantity = @"1";
    NSError *saveError = nil;
    if( ![[self managedObjectContext] save:&saveError] ) {
    }
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

@end
