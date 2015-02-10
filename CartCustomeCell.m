//
//  CartCustomeCell.m
//  CollectionProject
//
//  Created by Vinay on 05/02/15.
//  Copyright (c) 2015 Vinay. All rights reserved.
//

#import "CartCustomeCell.h"

@implementation CartCustomeCell
@synthesize price,productName,parentView,productImages,quantity,imageProduct;

- (IBAction)deleteProduct:(id)sender {
    
    [parentView performSelector:@selector(deleteProductsClicked:) withObject:self];
}

@end
