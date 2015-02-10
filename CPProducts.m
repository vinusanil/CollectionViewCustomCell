//
//  CPProducts.m
//  CollectionProject
//
//  Created by Vinay on 04/02/15.
//  Copyright (c) 2015 Vinay. All rights reserved.
//

#import "CPProducts.h"

@implementation CPProducts
@synthesize productImage,productName;

+(NSMutableArray *)AppleProductDeatils
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    
    CPProducts *product1 = [[CPProducts alloc] init];
    product1.productId = @"1";
    product1.productName = @"iPhone";
    product1.productImage = @"iPhone";
    product1.price = @"$ 700";
    
    CPProducts *product2 = [[CPProducts alloc] init];
    product2.productId = @"2";
    product2.productName = @"iPad";
    product2.productImage = @"iPad";
    product2.price = @"$ 400";
    
    
    CPProducts *product3 = [[CPProducts alloc] init];
    product3.productId = @"3";
    product3.productName = @"iPod";
    product3.productImage = @"iPod";
    product3.price = @"$ 200";
    
    CPProducts *product4 = [[CPProducts alloc] init];
    product4.productId = @"4";
    product4.productName = @"Apple Watch";
    product4.productImage = @"watch";
    product4.price = @"$ 500";
    
    CPProducts *product5 = [[CPProducts alloc] init];
    product5.productId = @"5";
    product5.productName = @"Apple TV";
    product5.productImage = @"tv";
     product5.price = @"$ 600";
    
    CPProducts *product6 = [[CPProducts alloc] init];
    product6.productId = @"6";
    product6.productName = @"iMac";
    product6.productImage = @"iMac";
     product6.price = @"$ 900";
    
    CPProducts *product7 = [[CPProducts alloc] init];
    product7.productId = @"7";
    product7.productName = @"Mac mini";
    product7.productImage = @"mini";
     product7.price = @"$ 800";
    
    
    [array addObject:product1];
    [array addObject:product2];
    [array addObject:product3];
    [array addObject:product4];
    [array addObject:product5];
    [array addObject:product6];
    [array addObject:product7];
    
    return array;
    
}

+(NSMutableArray *)recentProductDeatils
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    CPProducts *product1 = [[CPProducts alloc] init];
    product1.productId = @"1";
    product1.productName = @"iPhone";
    product1.productImage = @"iPhone";
    product1.price = @"$ 700";
    
    CPProducts *product2 = [[CPProducts alloc] init];
    product2.productId = @"2";
    product2.productName = @"iPad";
    product2.productImage = @"iPad";
    product2.price = @"$ 400";
    
    
    CPProducts *product3 = [[CPProducts alloc] init];
    product3.productId = @"3";
    product3.productName = @"iPod";
    product3.productImage = @"iPod";
     product3.price = @"$ 200";
    
    CPProducts *product4 = [[CPProducts alloc] init];
    product4.productId = @"4";
    product4.productName = @"Apple Watch";
    product4.productImage = @"watch";
    product4.price = @"$ 500";
    
    [array addObject:product1];
    [array addObject:product2];
    [array addObject:product3];
    [array addObject:product4];
    
    return array;
    
}



@end
