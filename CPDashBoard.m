//
//  CPDashBoard.m
//  CollectionProject
//
//  Created by Vinay on 04/02/15.
//  Copyright (c) 2015 Vinay. All rights reserved.
//

#import "CPDashBoard.h"
#import "CPProducts.h"
#import "Application.h"

@implementation CPDashBoard


-(void)viewDidLoad
{
    [super viewDidLoad];

    dataArray = [CPProducts recentProductDeatils];
    UIImage *image1 = [UIImage imageNamed:@"promo1.png"];
    UIImage *image2 = [UIImage imageNamed:@"promo2.png"];
    UIImage *image3 = [UIImage imageNamed:@"promo3.png"];

    imageArray=[[NSArray alloc]initWithObjects:image1,image2,image3, nil];
    for (int i=0; i<[imageArray count]; i++) {
        UIImageView *img=[[UIImageView alloc]initWithImage:[imageArray objectAtIndex:i]];
        [_promoScrollView addSubview:img];
        [img setFrame:CGRectMake(320*i, 0, 320, 270)];
    }
    
    [_promoScrollView setBackgroundColor:[UIColor clearColor]];
    _promoScrollView.contentSize=CGSizeMake(_promoScrollView.frame.size.width*[imageArray count], 270);
    
    _promoScrollView.scrollEnabled=YES;
    _promoScrollView.pagingEnabled=YES;
 
    _promoScrollView.showsHorizontalScrollIndicator=YES;
    _promoScrollView.showsVerticalScrollIndicator=NO;
    _promoScrollView.bounces=NO; 
    _promoScrollView.alwaysBounceVertical=NO;
    _promoScrollView.alwaysBounceHorizontal=NO;
    
    [_recentCollectionOfProduct reloadData];
    
    [NSTimer scheduledTimerWithTimeInterval:1.5f target:self selector:@selector(_ChaangePromoImage) userInfo:nil repeats:YES];
}

-(void)_ChaangePromoImage
{
    if (currentPositon==0) {
        currentPositon++;
    }else if(currentPositon==[imageArray count]){
        currentPositon=0;
    }
    [_promoScrollView setContentOffset:CGPointMake(320*currentPositon, 0) animated:YES];
    currentPositon++;
}

#pragma CollectionView Datasource and Delegate

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [dataArray count];
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
   static NSString *cellIdentifier = @"Cell";
    UICollectionViewCell *cell = [self.recentCollectionOfProduct dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    CPProducts *product = [dataArray objectAtIndex:indexPath.row];
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:100];
    imageView.image = [UIImage imageNamed:product.productImage];
    cell.layer.borderColor = [[UIColor redColor] CGColor];
    cell.layer.borderWidth = 1;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [Application setProductId:[dataArray objectAtIndex:indexPath.row]];
}



@end
