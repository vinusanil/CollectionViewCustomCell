//
//  Application.h
//  CollectionProject
//
//  Created by Vinay on 04/02/15.
//  Copyright (c) 2015 Vinay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPProducts.h"

@interface Application : NSObject

+(CPProducts *)productId;

+(void)setProductId: (CPProducts *)product;
@end
