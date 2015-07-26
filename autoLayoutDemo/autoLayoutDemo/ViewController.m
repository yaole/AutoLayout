//
//  ViewController.m
//  CNComposition
//
//  Created by yyx on 15/7/25.
//  Copyright (c) 2015年 yyx. All rights reserved.
//

#import "ViewController.h"
#import "UIView+AutoLayout.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#warning 必须先添加控件,再添加约束
//domo1:蓝色是红色宽度的一半
    UIView *redview = [[UIView alloc] init];
    redview.backgroundColor = [UIColor redColor];
    [self.view addSubview:redview];
    
    [redview everyMargininSpuerView:UIEdgeInsetsMake(20, 10, 0, -10)];
    [redview.YXHeight equalToValue:30];

    UIView *blueView =  [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    [blueView.YXEdgeRight equalTo:redview.YXEdgeRight];
    [blueView.YXEdgeTop equalTo:redview.YXEdgeBottom offset:30];
    [blueView.YXWidth equalTo:redview.YXWidth times:0.5];
    [blueView.YXHeight equalTo:redview.YXHeight];
   
//demo2:柱状图,x递增,高度递

    NSMutableArray *views = [NSMutableArray array];
    
    //创建8个view
    for (int i = 0; i < 8; i++) {
        //创建view
        UIView *view= [[UIView alloc] init];
        view.backgroundColor = [UIColor orangeColor];
        [self.view addSubview:view];
        [views addObject:view];
        
        [view bottomMarginInsuperView:0];//与底部固定
        [view.YXWidth equalToValue:30];//指定固定宽度为30
        
        if (0 == i) {
            [view leftMarginInsuperView:0];
            [view.YXHeight equalToValue:60];
        }
        
    }
    //x递增20  30是自身的宽度
    [self.view views:views XIncreaseRegularlyWithDelta:30 + 20];
    //高度递增40
    [self.view views:views HeightIncreaseRegularlyWithDelta:40];
}


@end
