//
//  YYViewController.m
//  WaterfallFlow_Damo
//
//  Created by 杨振 on 15/11/2.
//  Copyright © 2015年 杨振. All rights reserved.
//

#import "YYViewController.h"
#import "UIImage+Circle.h"
#import "YYViewController.h"

@interface YYViewController ()


@property (weak, nonatomic) IBOutlet UIButton *imageButton;

@end

@implementation YYViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /**
         iv.layer.masksToBounds = true
         iv.layer.cornerRadius = 45
     */
    [self.imageButton setImage:[UIImage circleImageWithName:@"123.png" borderWidth:12.0 borderColor:[UIColor colorWithWhite:1.0 alpha:0.5]] forState:UIControlStateNormal];
    [self startAnimation];
}
- (void)startAnimation {

    CABasicAnimation *animation = [[CABasicAnimation alloc] init];
    animation.keyPath = @"transform.rotation";
    animation.toValue = @(2 * M_PI);
    animation.repeatCount = MAXFLOAT;
    animation.duration = 20.0;
    
    // 动画退到后台，动画不要删除
    // 提示：如果界面上有动画，一定要检测退出到桌面，或者再次进入的时候是否还在
    animation.removedOnCompletion = false;
    
    [self.imageButton.layer addAnimation:animation forKey:nil];
    
}


@end
