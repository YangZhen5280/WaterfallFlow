//
//  YYClothesViewCell.m
//  WaterfallFlow_Damo
//
//  Created by 杨振 on 15/11/2.
//  Copyright © 2015年 杨振. All rights reserved.
//

#import "YYClothesViewCell.h"
#import <UIImageView+WebCache.h>
#import "YYClothes.h"

@interface YYClothesViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *clothesImage;
@property (weak, nonatomic) IBOutlet UILabel *clothesPrice;

@end
@implementation YYClothesViewCell
- (void)setClothe:(YYClothes *)clothe {
    _clothe = clothe;
    
    // 设置图片
    [self.clothesImage sd_setImageWithURL:[NSURL URLWithString:clothe.img] placeholderImage:[UIImage imageNamed:@"loading.png"]];
    
    // 设置价格
    self.clothesPrice.text = clothe.price;
}

@end
