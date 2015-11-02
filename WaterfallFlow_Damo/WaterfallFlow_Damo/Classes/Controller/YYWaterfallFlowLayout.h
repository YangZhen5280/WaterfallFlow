//
//  YYWaterfallFlowLayout.h
//  WaterfallFlow_Damo
//
//  Created by 杨振 on 15/11/2.
//  Copyright © 2015年 杨振. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YYWaterfallFlowLayout;
@protocol YYWaterfallFlowLayoutDelegate <NSObject>

@required
/**
 *  返回indexPath位置cell的高度
 */
- (CGFloat)waterfallLayout:(YYWaterfallFlowLayout *)layout heightForItemAtIndexPath:(NSIndexPath *)indexPath withItemWith:(CGFloat) wight;

@optional
/**
 *  返回布局的行间距
 */
- (CGFloat)rowSpacingInWaterfallFlowLayout:(YYWaterfallFlowLayout *)layout;

/**
 *  返回布局的列间距
 */
- (CGFloat)columnSpacingInWaterfallFlowLayout:(YYWaterfallFlowLayout *)layout;

/**
 *  返回布局的边距
 */
- (UIEdgeInsets)edgeInsetsInWaterfallFlowLayout:(YYWaterfallFlowLayout *)layout;

/**
 *  返回布局的列数
 */
- (NSUInteger)columnCountInWaterfallFlowLayout:(YYWaterfallFlowLayout *)layout;

@end

@interface YYWaterfallFlowLayout : UICollectionViewLayout

@property (nonatomic, weak) id<YYWaterfallFlowLayoutDelegate> delegate;

@end
