//
//  CPProductDeatilView.h
//  CollectionProject
//
//  Created by Vinay on 04/02/15.
//  Copyright (c) 2015 Vinay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPProductDeatilView : UIViewController
{
    NSString *productNameId;
}
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property(strong,nonatomic) NSString *productNameId;
@property (weak, nonatomic) IBOutlet UIImageView *productImage;
@property (weak, nonatomic) IBOutlet UILabel *productName;
- (IBAction)AddtoCartClicked:(id)sender;

@end
