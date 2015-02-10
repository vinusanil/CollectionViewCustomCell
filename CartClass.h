//
//  CartClass.h
//  CollectionProject
//
//  Created by Vinay on 05/02/15.
//  Copyright (c) 2015 Vinay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CartClass : NSObject
{
    NSString *productId,*produtName,*productPrice,*quantity,*idValue;
    
    NSData *productImage;
}
@property(strong,nonatomic) NSString *productId,*productName,*productPrice,*quantity,*idValue;
@property(strong,nonatomic)NSData *productImage;
@end
