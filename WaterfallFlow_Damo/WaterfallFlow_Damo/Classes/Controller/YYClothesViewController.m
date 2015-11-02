//
//  YYClothesViewController.m
//  WaterfallFlow_Damo
//
//  Created by 杨振 on 15/11/2.
//  Copyright © 2015年 杨振. All rights reserved.
//

#import "YYClothesViewController.h"
#import "YYWaterfallFlowLayout.h"
#import <MJExtension.h>
#import <MJRefresh.h>

#import "YYClothes.h"
#import "YYClothesViewCell.h"

@interface YYClothesViewController ()<YYWaterfallFlowLayoutDelegate>

@property (nonatomic, strong) NSMutableArray *clothes;


@end

@implementation YYClothesViewController
static NSString * const reuseIdentifier = @"ClothesCell";

- (NSMutableArray *)clothes {
    if (!_clothes) {
        _clothes = [[NSMutableArray alloc] init];
    }
    return _clothes;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepareLayout];
    [self uploadData];
    [self refurbishData];
    
}
- (void)prepareLayout {
    YYWaterfallFlowLayout *layout = [[YYWaterfallFlowLayout alloc] init];
    
    layout.delegate = self;
    self.collectionView.collectionViewLayout = layout;
    self.collectionView.backgroundColor = [UIColor whiteColor];
}
- (void)uploadData {
    NSArray *tempArray = [YYClothes objectArrayWithFilename:@"clothes.plist"];
    [self.clothes addObjectsFromArray:tempArray];
}
- (void)refurbishData {
    
}



#pragma mark - <YYWaterfallFlowLayoutDelegate>
- (CGFloat)waterfallLayout:(YYWaterfallFlowLayout *)layout heightForItemAtIndexPath:(NSIndexPath *)indexPath withItemWith:(CGFloat)wight {
    YYClothes *clother = self.clothes[indexPath.item];
    return clother.h * wight / clother.w;
}
- (NSUInteger)columnCountInWaterfallFlowLayout:(YYWaterfallFlowLayout *)layout {
    return 3;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.clothes.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YYClothesViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
   
    cell.clothe = self.clothes[indexPath.item];
    
    return cell;
}

@end
