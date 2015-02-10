//
//  ViewController.m
//  CollectionProject
//
//  Created by Vinay on 04/02/15.
//  Copyright (c) 2015 Vinay. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
#import <QuartzCore/QuartzCore.h>
#import "CPProducts.h"
#import "CPProductDeatilView.h"
#import "Application.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_expandCollapseBtn setImage:[UIImage imageNamed:@"expand"]];
    dataArray = [CPProducts AppleProductDeatils];
    
    expand = @"NO";
    [_catalogCollections registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cvCell"];
    [_catalogCollections reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma CollectionView Datasource and Delegate

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [dataArray count];
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *cellIdentifier = @"cvCell";
    
    CPProducts *product = [dataArray objectAtIndex:indexPath.row];
    
    CollectionViewCell *cell = (CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    [cell.productName setText:product.productName];
    cell.productImage.image = [UIImage imageNamed:product.productImage];
    cell.price.text = product.price;
    cell.layer.borderColor = [[UIColor redColor] CGColor];
    cell.layer.borderWidth = 1;
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    [Application setProductId:[dataArray objectAtIndex:indexPath.row]];
    
    [self performSegueWithIdentifier:@"productDetail" sender:self];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if([expand isEqualToString:@"YES"])
    {
        return CGSizeMake(300, 250);
    }
    else
    {
        
        return CGSizeMake(180, 250);
    }
    return CGSizeMake(180, 250);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionView *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


#pragma Action

- (IBAction)expandClicked:(id)sender {
    
    if([expand isEqualToString:@"NO"])
    {
        [_expandCollapseBtn setImage:[UIImage imageNamed:@"collapse"]];
        expand = @"YES";
    }
    else if ([expand isEqualToString:@"YES"])
    {
        [_expandCollapseBtn setImage:[UIImage imageNamed:@"expand"]];
        expand = @"NO";
    }
    
    [_catalogCollections performBatchUpdates:^{
        [_catalogCollections reloadData];
    } completion:^(BOOL finished) {}];
}

@end
