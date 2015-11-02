//
//  YYWaterfallFlowLayout.m
//  WaterfallFlow_Damo
//
//  Created by 杨振 on 15/11/2.
//  Copyright © 2015年 杨振. All rights reserved.
//

#import "YYWaterfallFlowLayout.h"

#define YYCollectionViewWidth self.collectionView.frame.size.width

static const CGFloat YYDefaultRowMargin = 10;
static const CGFloat YYDefaultColMargin = 20;
static const UIEdgeInsets YYDefaultEdginsets = {10, 10, 10, 10};
static const CGFloat YYDefaultColumnCount = 3;

@interface YYWaterfallFlowLayout ()

@property (nonatomic, strong) NSMutableArray *columnMaxYarray;

@end
@implementation YYWaterfallFlowLayout

#pragma mark - lazy
- (NSMutableArray *)columnMaxYarray {
    if (!_columnMaxYarray) {
        _columnMaxYarray = [[NSMutableArray alloc] init];
    }
    return _columnMaxYarray;
}

#pragma mark - 实现内部方法
- (void)prepareLayout {
    [super prepareLayout];
    [self.columnMaxYarray removeAllObjects];
    for (int i = 0; i< YYDefaultColumnCount; i ++) {
        [self.columnMaxYarray addObject:@(0)];
    }

}

/**
 *  说明所有元素最终显示出来的布局属性
 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSMutableArray *arrM = [NSMutableArray array];
    
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i< count; i ++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        
        [arrM addObject:attrs];
    }
    return arrM;
}
/**
 *  说明indexPath位置cell的布局属性
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    
    attrs.center = CGPointMake(100, 100);
    attrs.size = CGSizeMake(100, 150);
    
    return attrs;
}














@end
