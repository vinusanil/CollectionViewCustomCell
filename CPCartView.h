//
//  CPCartView.h
//  CollectionProject
//
//  Created by Vinay on 05/02/15.
//  Copyright (c) 2015 Vinay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPCartView : UIViewController<UITextFieldDelegate>
{
    NSArray *cartProductArray;
    NSString *textValue;
}
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (weak, nonatomic) IBOutlet UITableView *cartTableView;

@end
