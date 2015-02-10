//
//  ViewController.h
//  CollectionProject
//
//  Created by Vinay on 04/02/15.
//  Copyright (c) 2015 Vinay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSArray *dataArray;
     NSArray *imageArray;
    NSString *expand;
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *expandCollapseBtn;
@property (weak, nonatomic) IBOutlet UICollectionView *catalogCollections;
- (IBAction)expandClicked:(id)sender;

@end

