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
static const CGFloat YYDefaultColMargin = 15;
static const UIEdgeInsets YYDefaultEdginsets = {10, 10, 10, 10};
static const CGFloat YYDefaultColumnCount = 3;

@interface YYWaterfallFlowLayout ()

@property (nonatomic, strong) NSMutableArray *columnMaxYarray;
@property (nonatomic, strong) NSMutableArray *attrsArray;

@end
@implementation YYWaterfallFlowLayout

#pragma mark - lazy
- (NSMutableArray *)columnMaxYarray {
    if (!_columnMaxYarray) {
        _columnMaxYarray = [[NSMutableArray alloc] init];
    }
    return _columnMaxYarray;
}
- (NSMutableArray *)attrsArray {
    if (!_attrsArray) {
        _attrsArray = [[NSMutableArray alloc] init];
    }
    return _attrsArray;
}

#pragma mark - 实现内部方法（重置每一列的最大y坐标）

- (CGSize)collectionViewContentSize {
    CGFloat destColumnMaxY = [self.columnMaxYarray[0] doubleValue];
    for (int i = 0; i< self.columnMaxYarray.count; i ++) {
        CGFloat columnMaxY = [self.columnMaxYarray[i] doubleValue];
        if (columnMaxY > destColumnMaxY) {
            destColumnMaxY = columnMaxY;
        }
    }
    return CGSizeMake(YYCollectionViewWidth, destColumnMaxY + YYDefaultEdginsets.bottom);
}

- (void)prepareLayout {
    [super prepareLayout];
    
    [self.columnMaxYarray removeAllObjects];
    for (int i = 0; i< YYDefaultColumnCount; i ++) {
        [self.columnMaxYarray addObject:@(0)];
    }
    
    // 当有新的Item 出现需要布局layout的时候才会调用一次
    [self.attrsArray removeAllObjects];
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i < count; i ++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attrsArray addObject:attrs];
    }
}
/**
 *  说明所有元素最终显示出来的布局属性
 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
  
    NSMutableArray *arrM = [NSMutableArray array];
    for (int i = 0; i< self.attrsArray.count; i ++) {
       
        UICollectionViewLayoutAttributes *attrs = self.attrsArray[i];
        // 查找屏幕范围内 相交集的Item 才会显示加载其attrs属性
        if (CGRectIntersectsRect(rect, attrs.frame)) {
            [arrM addObject:attrs];
        }
    }
    return arrM;
}
/**
 *  说明indexPath位置cell的布局属性
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    CGFloat destColumnMaxY = [self.columnMaxYarray[0] doubleValue];
    NSInteger destColumnindex = 0;
    for (int i = 0; i< self.columnMaxYarray.count; i ++) {
        CGFloat columnMaxY = [self.columnMaxYarray[i] doubleValue];
        if (columnMaxY < destColumnMaxY) {
            destColumnMaxY = columnMaxY;
            destColumnindex = i;
        }
    }
    CGFloat totalColumnSpacing = (YYDefaultColumnCount - 1) * YYDefaultColMargin;
    CGFloat width = (YYCollectionViewWidth - YYDefaultEdginsets.left - YYDefaultEdginsets.right - totalColumnSpacing) / YYDefaultColumnCount;
#warning TODO tempHeight
    CGFloat height = 50 + arc4random_uniform(150);
    CGFloat x = YYDefaultEdginsets.left + destColumnindex * (width + YYDefaultColMargin);
    CGFloat y = destColumnMaxY + YYDefaultRowMargin;
   
    attrs.frame = CGRectMake(x, y, width, height);
    self.columnMaxYarray[destColumnindex] = @(CGRectGetMaxY(attrs.frame));
    
    return attrs;
}














@end
