//
//  CPProductCategoryList.m
//  CollectionProject
//
//  Created by Vinay on 04/02/15.
//  Copyright (c) 2015 Vinay. All rights reserved.
//

#import "CPProductCategoryList.h"

@interface CPProductCategoryList ()

@end

@implementation CPProductCategoryList

- (void)viewDidLoad {
    [super viewDidLoad];
    
    productListArray = @[@"Apple Products",@"Samsung Products",@"Microsoft Products",@"BlackBerry Products"];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [productListArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"productCell" forIndexPath:indexPath];
    
    cell.textLabel.text = [productListArray objectAtIndex:indexPath.row];
    return cell;
}



@end
