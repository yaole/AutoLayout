//
//  UIView+AutoLayout.m
//  CNComposition
//
//  Created by yyx on 15/7/26.
//  Copyright (c) 2015年 yyx. All rights reserved.
//

#import "UIView+AutoLayout.h"

@implementation UIView (AutoLayout)
#pragma mark - -----------------与父控件关系 -----------------
//与父控件关系,可以设置为0
- (void)topMarginInsuperView:(CGFloat)margin{
    [self.YXEdgeTop equalTo:self.superview.YXEdgeTop times:1 offset:margin];
}
- (void)leftMarginInsuperView:(CGFloat)margin{
    [self.YXEdgeLeft equalTo:self.superview.YXEdgeLeft times:1 offset:margin];
}
- (void)bottomMarginInsuperView:(CGFloat)margin{
    [self.YXEdgeBottom equalTo:self.superview.YXEdgeBottom times:1 offset:margin];}
- (void)rightMarginInsuperView:(CGFloat)margin{
    [self.YXEdgeRight equalTo:self.superview.YXEdgeRight times:1 offset:margin];
}

//同时设置多个方向上的margin,不设值传 0
- (void)everyMargininSpuerView:(UIEdgeInsets)offset{
    if (offset.top) {
        [self topMarginInsuperView:offset.top];
    }
    if (offset.left) {
        [self leftMarginInsuperView:offset.left];
    }
    if (offset.bottom) {
        [self bottomMarginInsuperView:offset.bottom];
    }
    if (offset.right) {
        [self rightMarginInsuperView:offset.right];
    }
}
//中心位置
- (void)inCenterOfsuperView{
    [self coincideCenterWith:self.superview];
}

//水平中心
- (void)horizontalCenterInSuperView{
    [self standInlineInHorizontalWith:self.superview];
}
//水平中心偏移
- (void)horizontalCenterInSuperViewOffset:(CGFloat)offset{
    [self standInlineInHorizontalWith:self.superview offset:offset];
}
//垂直中心
- (void)vertialCenterInsuperView{
    [self standInlineInVertialWith:self.superview];
}
//垂直中心偏移
- (void)vertialCenterInsuperViewOffset:(CGFloat)offset{
    [self standInlineInVertialWith:self.superview offset:offset];
}

#pragma mark - -----------------与非父控件之间的联系 -----------------
//与非父控件之间的关系

//中心重合
- (void)coincideCenterWith:(UIView *)view{
    [self standInlineInVertialWith:view];
    [self standInlineInHorizontalWith:view];
}
//水平对齐
- (void)standInlineInHorizontalWith:(UIView *)view{
    [self standInlineInHorizontalWith:view offset:0];
}
//垂直对齐
- (void)standInlineInVertialWith:(UIView *)view{
    [self standInlineInHorizontalWith:view offset:0];
}
//水平偏移
- (void)standInlineInHorizontalWith:(UIView *)view offset:(CGFloat)offset{
    [self.YXCenterX equalTo:view.YXCenterX times:1 offset:offset];
}
//垂直偏移
- (void)standInlineInVertialWith:(UIView *)view offset:(CGFloat)offset{
    [self.YXCenterY equalTo:view.YXCenterY times:1 offset:offset];
}
//等宽
- (void)equalWidthToView:(UIView *)view{
    [self.YXWidth equalTo:view.YXWidth];
}
//等高
- (void)equalHeightToView:(UIView *)view{
    [self.YXHeight equalTo:view.YXHeight];
}

#pragma mark - -----------------多控件管理 -----------------
//多控件管理
//同时中心对齐
- (void)coincideCenterWithViews:(NSArray *)views{
    if (views.count) {
        for (int i = 0; i < views.count - 1; i++) {
            UIView *view1 = views[i];
            UIView *view2 = views[i + 1];
            [view1 coincideCenterWith:view2];
        }
    }
}
//同时水平对齐
- (void)standInlineInHorizontalWithViews:(NSArray *)views{
    if (views.count) {
        for (int i = 0; i < views.count - 1; i++) {
            UIView *view1 = views[i];
            UIView *view2 = views[i + 1];
            [view1 standInlineInHorizontalWith:view2];
        }
    }
}
//同时垂直对齐
- (void)standInlineInvertialWithViews:(NSArray *)views{
    if (views.count) {
        for (int i = 0; i < views.count - 1; i++) {
            UIView *view1 = views[i];
            UIView *view2 = views[i + 1];
            [view1 standInlineInVertialWith:view2];
        }
    }
}
//同时高度相等
- (void)Views:(NSArray *)views WithTheSameHeight:(CGFloat)height{
    if (views.count) {
        for (int i = 0; i < views.count - 1; i++) {
            UIView *view1 = views[i];
            UIView *view2 = views[i + 1];
            [view1 equalHeightToView:view2];
        }
    }
}
//同时宽度相等
- (void)Views:(NSArray *)views WithTheSameWidth:(CGFloat)width{
    if (views.count) {
        for (int i = 0; i < views.count - 1; i++) {
            UIView *view1 = views[i];
            UIView *view2 = views[i + 1];
            [view1 equalWidthToView:view2];
        }
    }
}

#pragma mark -有规律递增
//x递增
- (void)views:(NSArray *)views XIncreaseRegularlyWithDelta:(CGFloat)delta{
    if (views.count) {
        for (int i = 0; i < views.count - 1; i++) {
            UIView *view1 = views[i];
            UIView *view2 = views[i + 1];
            [view2.YXEdgeLeft equalTo:view1.YXEdgeLeft offset:delta];
        }
    }
}
//x成倍递增
- (void)views:(NSArray *)views XIncreaseRegularlyWithTimes:(CGFloat)times{
    if (views.count) {
        for (int i = 0; i < views.count - 1; i++) {
            UIView *view1 = views[i];
            UIView *view2 = views[i + 1];
            [view2.YXEdgeLeft equalTo:view1.YXEdgeLeft times:times];
        }
    }
}
//y递增
- (void)views:(NSArray *)views YIncreaseRegularlyWithDelta:(CGFloat)delta{
    if (views.count) {
        for (int i = 0; i < views.count - 1; i++) {
            UIView *view1 = views[i];
            UIView *view2 = views[i + 1];
            [view2.YXEdgeTop equalTo:view1.YXEdgeTop offset:delta];
        }
    }
}
//y成倍递增
- (void)views:(NSArray *)views YIncreaseRegularlyWithTimes:(CGFloat)times{
    if (views.count) {
        for (int i = 0; i < views.count - 1; i++) {
            UIView *view1 = views[i];
            UIView *view2 = views[i + 1];
            [view2.YXEdgeRight equalTo:view1.YXEdgeRight times:times];
        }
    }
}
//centerX递增
- (void)views:(NSArray *)views CenterXIncreaseRegularlyWithDelta:(CGFloat)delta{
    if (views.count) {
        for (int i = 0; i < views.count - 1; i++) {
            UIView *view1 = views[i];
            UIView *view2 = views[i + 1];
            [view2.YXCenterX equalTo:view1.YXCenterX offset:delta];
        }
    }
}
//centerX成倍递增
- (void)views:(NSArray *)views CenterXIncreaseRegularlyWithTimes:(CGFloat)times{
    if (views.count) {
        for (int i = 0; i < views.count - 1; i++) {
            UIView *view1 = views[i];
            UIView *view2 = views[i + 1];
            [view2.YXCenterX equalTo:view1.YXCenterX times:times];
        }
    }
}
//centerY递增
- (void)views:(NSArray *)views CenterYIncreaseRegularlyWithDelta:(CGFloat)delta{
    if (views.count) {
        for (int i = 0; i < views.count - 1; i++) {
            UIView *view1 = views[i];
            UIView *view2 = views[i + 1];
            [view2.YXCenterY equalTo:view1.YXCenterY offset:delta];
        }
    }
}
//centerY成倍递增
- (void)views:(NSArray *)views CenterYIncreaseRegularlyWithTimes:(CGFloat)times{
    if (views.count) {
        for (int i = 0; i < views.count - 1; i++) {
            UIView *view1 = views[i];
            UIView *view2 = views[i + 1];
            [view2.YXCenterY equalTo:view1.YXCenterY times:times];
        }
    }
}
//宽度递增
- (void)views:(NSArray *)views WidthIncreaseRegularlyWithDelta:(CGFloat)delta{
    if (views.count) {
        for (int i = 0; i < views.count - 1; i++) {
            UIView *view1 = views[i];
            UIView *view2 = views[i + 1];
            [view2.YXWidth equalTo:view1.YXWidth offset:delta];
        }
    }
}
//宽度成倍递增
- (void)views:(NSArray *)views WidthIncreaseRegularlyWithTimes:(CGFloat)times{
    if (views.count) {
        for (int i = 0; i < views.count - 1; i++) {
            UIView *view1 = views[i];
            UIView *view2 = views[i + 1];
            [view2.YXWidth equalTo:view1.YXWidth times:times];
        }
    }
}
//高度递增
- (void)views:(NSArray *)views HeightIncreaseRegularlyWithDelta:(CGFloat)delta{
    if (views.count) {
        for (int i = 0; i < views.count - 1; i++) {
            UIView *view1 = views[i];
            UIView *view2 = views[i + 1];
            [view2.YXHeight equalTo:view1.YXHeight offset:delta];
        }
    }
}
//高度成倍递增
- (void)views:(NSArray *)views HeightIncreaseRegularlyWithTimes:(CGFloat)times{
    if (views.count) {
        for (int i = 0; i < views.count - 1; i++) {
            UIView *view1 = views[i];
            UIView *view2 = views[i + 1];
            [view2.YXHeight equalTo:view1.YXHeight times:times];
        }
    }
}
#pragma mark - -----------------属性反向赋值 -----------------
//将调用者的保存到自己的属性中
- (YXAttribute *)YXEdgeTop{
    YXAttribute *top = [[YXAttribute alloc] init];
    top.sourceView = self;
    top.attribute = NSLayoutAttributeTop;
    return top;
}
- (YXAttribute *)YXEdgeLeft{
    YXAttribute *left = [[YXAttribute alloc] init];
    left.sourceView = self;
    left.attribute = NSLayoutAttributeLeft;
    return left;
}
- (YXAttribute *)YXEdgeBottom{
    YXAttribute *bottom = [[YXAttribute alloc] init];
    bottom.sourceView = self;
    bottom.attribute = NSLayoutAttributeBottom;
    return bottom;
}
- (YXAttribute *)YXEdgeRight{
    YXAttribute *right = [[YXAttribute alloc] init];
    right.sourceView = self;
    right.attribute = NSLayoutAttributeRight;
    return right;
}
- (YXAttribute *)YXEdgeLeading{
    YXAttribute *leading = [[YXAttribute alloc] init];
    leading.sourceView = self;
    leading.attribute = NSLayoutAttributeLeading;
    return leading;
}
- (YXAttribute *)YXEdgeTrailing{
    YXAttribute *trailing = [[YXAttribute alloc] init];
    trailing.sourceView = self;
    trailing.attribute = NSLayoutAttributeTrailing;
    return trailing;
}
- (YXAttribute *)YXWidth{
    YXAttribute *width = [[YXAttribute alloc] init];
    width.sourceView = self;
    width.attribute = NSLayoutAttributeWidth;
    return width;
}
- (YXAttribute *)YXHeight{
    YXAttribute *height = [[YXAttribute alloc] init];
    height.sourceView = self;
    height.attribute = NSLayoutAttributeHeight;
    return height;
}

- (YXAttribute *)YXCenterX{
    YXAttribute *centerX = [[YXAttribute alloc] init];
    centerX.sourceView = self;
    centerX.attribute = NSLayoutAttributeCenterX;
    return centerX;
}
- (YXAttribute *)YXCenterY{
    YXAttribute *centerY = [[YXAttribute alloc] init];
    centerY.sourceView = self;
    centerY.attribute = NSLayoutAttributeCenterY;
    return centerY;
}

@end
