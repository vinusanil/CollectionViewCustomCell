//
//  CollectionViewCell.h
//  CollectionProject
//
//  Created by Vinay on 04/02/15.
//  Copyright (c) 2015 Vinay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell
{
    
}
@property (weak, nonatomic) IBOutlet UIImageView *productImage;

@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *price;


@end
