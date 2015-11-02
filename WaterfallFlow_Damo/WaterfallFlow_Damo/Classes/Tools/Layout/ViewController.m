//
//  ViewController.m
//  02_自定义UICollectionView布局
//
//  Created by apple on 20/6/10.
//  Copyright (c) 2020年 apple. All rights reserved.
//

#import "ViewController.h"
#import "HMImageCell.h"
#import "HMLineLayout.h"
#import "HMCircleLayout.h"
#import "YYClothes.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

// 所有的图片名
@property (nonatomic, strong) NSMutableArray *images;
@property (nonatomic, weak) UICollectionView *collectionView;
@end

@implementation ViewController

static NSString *const ID = @"image";

- (NSMutableArray *)images {
    if (!_images) {
        self.images = [[NSMutableArray alloc] init];
        
        for (int i = 1; i <= 20; i++) {
            [self.images addObject:[NSString stringWithFormat:@"%d", i]];
        }
    }
    
    
    return _images;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat w = self.view.frame.size.width;
    CGRect rect = CGRectMake(0, 100, w, 300);
    
    // UICollectionViewLayout
    // UICollectionViewFlowLayout
    
    // 创建布局
    HMCircleLayout *layout = [[HMCircleLayout alloc] init];
    
    // 创建CollectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:layout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [collectionView registerNib:[UINib nibWithNibName:@"HMImageCell" bundle:nil] forCellWithReuseIdentifier:ID];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    self.collectionView.collectionViewLayout = [[HMLineLayout alloc] init];
    if ([self.collectionView.collectionViewLayout isKindOfClass:[HMLineLayout class]]) {
        [self.collectionView setCollectionViewLayout:[[HMCircleLayout alloc] init] animated:YES];
    } else if ([self.collectionView.collectionViewLayout isKindOfClass:[HMCircleLayout class]]) {
        [self.collectionView setCollectionViewLayout:[[HMLineLayout alloc] init] animated:YES];
    }
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HMImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.image = self.images[indexPath.item];
    return cell;
}

#pragma mark - <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
}

@end
