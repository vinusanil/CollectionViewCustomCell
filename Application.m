//
//  Application.m
//  CollectionProject
//
//  Created by Vinay on 04/02/15.
//  Copyright (c) 2015 Vinay. All rights reserved.
//

#import "Application.h"
static CPProducts* productId;

@implementation Application

+(CPProducts *)productId
{
    return productId;
}

+(void)setProductId: (CPProducts *)product
{
    productId = product;
}

@end
