//
//  CPDashBoard.h
//  CollectionProject
//
//  Created by Vinay on 04/02/15.
//  Copyright (c) 2015 Vinay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPDashBoard : UIViewController<UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSArray *imageArray;
    UIImageView *promoImages;
    int currentPositon;
    NSMutableArray *dataArray;
    
}
@property (weak, nonatomic) IBOutlet UIScrollView *promoScrollView;
@property (weak, nonatomic) IBOutlet UICollectionView *recentCollectionOfProduct;

@end
