//
//  CartCustomeCell.h
//  CollectionProject
//
//  Created by Vinay on 05/02/15.
//  Copyright (c) 2015 Vinay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CartCustomeCell : UITableViewCell
{
    
}
@property(strong,nonatomic)UIViewController *parentView;
@property (strong, nonatomic) IBOutlet UIImageView *productImages;
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UITextField *quantity;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UIImageView *imageProduct;
- (IBAction)deleteProduct:(id)sender;

@end
