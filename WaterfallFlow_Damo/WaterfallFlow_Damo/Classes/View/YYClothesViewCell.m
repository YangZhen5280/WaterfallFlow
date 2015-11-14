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
@property (nonatomic, assign) NSInteger dataLength;

@end
@implementation YYClothesViewCell
- (void)setClothe:(YYClothes *)clothe {
    _clothe = clothe;
    
   
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    // 设置图片
    [self.clothesImage sd_setImageWithURL:[NSURL URLWithString:clothe.img] placeholderImage:[UIImage imageNamed:@"loading.png"]];
    
    // 将图像转换成二进制数据
    NSData *data = UIImagePNGRepresentation(self.clothesImage.image);
    self.dataLength += data.length;

    dispatch_group_leave(group);
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"缓存图片大小是：%ld K", self.dataLength / 1024);
    });
    
    // 设置价格
    self.clothesPrice.text = clothe.price;
}

@end
