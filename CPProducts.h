//
//  CPProducts.h
//  CollectionProject
//
//  Created by Vinay on 04/02/15.
//  Copyright (c) 2015 Vinay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPProducts : NSObject
{
    
}
@property(strong,nonatomic)NSString *productName;
@property(strong,nonatomic)NSString *productImage;
@property(strong,nonatomic)NSString *productId;
@property(strong,nonatomic)NSString *price;

+(NSMutableArray *)AppleProductDeatils;
+(NSMutableArray *)recentProductDeatils;

@end
