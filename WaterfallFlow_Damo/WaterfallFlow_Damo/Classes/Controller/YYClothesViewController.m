//
//  YYClothesViewController.m
//  WaterfallFlow_Damo
//
//  Created by 杨振 on 15/11/2.
//  Copyright © 2015年 杨振. All rights reserved.
//

#import "YYClothesViewController.h"
#import "YYWaterfallFlowLayout.h"

@interface YYClothesViewController ()

@end

@implementation YYClothesViewController

static NSString * const reuseIdentifier = @"ClothesCell";

- (void)viewDidLoad {
    [super viewDidLoad];

    YYWaterfallFlowLayout *layout = [[YYWaterfallFlowLayout alloc] init];
    self.collectionView.collectionViewLayout = layout;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    return cell;
}

@end
