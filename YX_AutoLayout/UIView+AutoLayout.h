//
//  UIView+AutoLayout.h
//  CNComposition
//
//  Created by yyx on 15/7/26.
//  Copyright (c) 2015年 yyx. All rights reserved.
//
/**
 * 这个框架只是对系统的AutoLayout进行封装,增加使用功能
 * 模拟storyboard中的功能,可以与系统本身的布局混合使用
 *  
 *  
 *
 */
#import <UIKit/UIKit.h>
#import "YXAttribute.h"
#import "UIView+Frame.h"
@interface UIView (AutoLayout)
@property (nonatomic,strong,readonly) YXAttribute *YXEdgeTop;
@property (nonatomic,strong,readonly) YXAttribute *YXEdgeLeft;
@property (nonatomic,strong,readonly) YXAttribute *YXEdgeBottom;
@property (nonatomic,strong,readonly) YXAttribute *YXEdgeRight;
@property (nonatomic,strong,readonly) YXAttribute *YXEdgeLeading;
@property (nonatomic,strong,readonly) YXAttribute *YXEdgeTrailing;
@property (nonatomic,strong,readonly) YXAttribute *YXWidth;
@property (nonatomic,strong,readonly) YXAttribute *YXHeight;
@property (nonatomic,strong,readonly) YXAttribute *YXCenterX;
@property (nonatomic,strong,readonly) YXAttribute *YXCenterY;

#pragma mark - ---与父控件之间关系 relation to super view----------
//与父控件关系,可以设置为0   //margin insuperView ,can be setted 0
- (void)topMarginInsuperView:(CGFloat)margin;
- (void)leftMarginInsuperView:(CGFloat)margin;
- (void)bottomMarginInsuperView:(CGFloat)margin;
- (void)rightMarginInsuperView:(CGFloat)margin;

//同时设置多个方向上的margin,不设值传 0
//marin in every derection,if don't needed in some derecton,set 0
- (void)everyMargininSpuerView:(UIEdgeInsets)offset;
//中心位置 in the center of superview
- (void)inCenterOfsuperView;

//水平中心  centerX in superview
- (void)horizontalCenterInSuperView;
//水平中心偏移  have adistance to supverview's centerX
- (void)horizontalCenterInSuperViewOffset:(CGFloat)offset;
//垂直中心  centerY in superview
- (void)vertialCenterInsuperView;
//垂直中心偏移  have adistance to supverview's centerY
- (void)vertialCenterInsuperViewOffset:(CGFloat)offset;

#pragma mark - 与非父控件之间的联系 
#pragma mark - relation to other view which is not supeview
//与非父控件之间的关系

//中心重合     the same center
- (void)coincideCenterWith:(UIView *)view;
//水平对齐     the same centerX
- (void)standInlineInHorizontalWith:(UIView *)view;
//垂直对齐     the same centerY
- (void)standInlineInVertialWith:(UIView *)view;
//水平偏移     have a distance to centerX
- (void)standInlineInHorizontalWith:(UIView *)view offset:(CGFloat)offset;
//垂直偏移    have a distance to centerY
- (void)standInlineInVertialWith:(UIView *)view offset:(CGFloat)offset;
//等宽  the same width
- (void)equalWidthToView:(UIView *)view;
//等高  the same height
- (void)equalHeightToView:(UIView *)view;

#pragma mark - -----------------多控件管理 -----------------
//多控件管理
//同时中心对齐     all of the views have the same center
- (void)coincideCenterWithViews:(NSArray *)views;
//同时水平对齐     all of the views have the same centerX
- (void)standInlineInHorizontalWithViews:(NSArray *)views;
//同时垂直对齐     all of the views have the same centerY
- (void)standInlineInvertialWithViews:(NSArray *)views;
//同时高度相等     all of the views have the same height
- (void)Views:(NSArray *)views WithTheSameHeight:(CGFloat)height;
//同时宽度相等     all of the views have the same width
- (void)Views:(NSArray *)views WithTheSameWidth:(CGFloat)width;

#pragma mark -有规律递增
//x递增   the left(x) of the views increase regularlly,increase with a static value
- (void)views:(NSArray *)views XIncreaseRegularlyWithDelta:(CGFloat)delta;
//x成倍递增       the left(x) of the views increase regularlly,increase with a static times
- (void)views:(NSArray *)views XIncreaseRegularlyWithTimes:(CGFloat)times;
//y递增          the top....(same with the last line)
- (void)views:(NSArray *)views YIncreaseRegularlyWithDelta:(CGFloat)delta;
//y成倍递增       the top
- (void)views:(NSArray *)views YIncreaseRegularlyWithTimes:(CGFloat)times;
//centerX递增    the centerX
- (void)views:(NSArray *)views CenterXIncreaseRegularlyWithDelta:(CGFloat)delta;
//centerX成倍递增  the centerX
- (void)views:(NSArray *)views CenterXIncreaseRegularlyWithTimes:(CGFloat)times;
//centerY递增     the centerY
- (void)views:(NSArray *)views CenterYIncreaseRegularlyWithDelta:(CGFloat)delta;
//centerY成倍递增  the centerY
- (void)views:(NSArray *)views CenterYIncreaseRegularlyWithTimes:(CGFloat)times;
//宽度递增         the width
- (void)views:(NSArray *)views WidthIncreaseRegularlyWithDelta:(CGFloat)delta;
//宽度成倍递增       the width
- (void)views:(NSArray *)views WidthIncreaseRegularlyWithTimes:(CGFloat)times;
//高度递增          the height
- (void)views:(NSArray *)views HeightIncreaseRegularlyWithDelta:(CGFloat)delta;
//高度成倍递增       the height
- (void)views:(NSArray *)views HeightIncreaseRegularlyWithTimes:(CGFloat)times;

@end
