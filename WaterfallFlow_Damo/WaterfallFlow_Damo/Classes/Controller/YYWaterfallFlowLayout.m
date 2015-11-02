//
//  YYWaterfallFlowLayout.m
//  WaterfallFlow_Damo
//
//  Created by 杨振 on 15/11/2.
//  Copyright © 2015年 杨振. All rights reserved.
//

#import "YYWaterfallFlowLayout.h"

@implementation YYWaterfallFlowLayout

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
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    attrs.center = CGPointMake(100, 100);
    attrs.size = CGSizeMake(100, 150);
    
    return attrs;
}














@end
