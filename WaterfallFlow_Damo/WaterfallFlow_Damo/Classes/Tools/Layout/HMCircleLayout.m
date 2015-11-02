//
//  HMCircleLayout.m
//  02_自定义UICollectionView布局
//
//  Created by apple on 20/6/10.
//  Copyright (c) 2020年 apple. All rights reserved.
//

#import "HMCircleLayout.h"

@implementation HMCircleLayout


/**
 *  决定cell如何排布
 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSMutableArray *array = [NSMutableArray array];
    NSUInteger count = [self.collectionView numberOfItemsInSection:0];
    
    for (int i = 0; i < count; i++) {
        // 创建i位置cell对应的IndexPath
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        // 创建i位置cell对应的布局属性
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        
        // 添加布局属性
        [array addObject:attrs];
    }
    
    return array;
}

/**
 *  返回indexPath对应cell的布局属性
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger count = [self.collectionView numberOfItemsInSection:indexPath.section];
    
    // 半径
    CGFloat radius = 100;
    // 圆心坐标
    CGFloat centerX = self.collectionView.frame.size.width * 0.5;
    CGFloat centerY = self.collectionView.frame.size.height * 0.5;
    // 角度增量
    CGFloat deltaAngle = 2 * M_PI / count;
    
    
    // 创建i位置cell对应的布局属性
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    // 旋转角度
    CGFloat angle = indexPath.item * deltaAngle;
    // cell中心点坐标
    CGFloat attrsCenterX = centerX + radius * cos(angle);
    CGFloat attrsCenterY = centerY + radius * sin(angle);
    
    attrs.center = CGPointMake(attrsCenterX, attrsCenterY);
    attrs.size = CGSizeMake(50, 50);
//    // 用来控制cell的层叠顺序，zIndex越大，cell越在上面
//    attrs.zIndex = 100;
    
    return attrs;
}

@end