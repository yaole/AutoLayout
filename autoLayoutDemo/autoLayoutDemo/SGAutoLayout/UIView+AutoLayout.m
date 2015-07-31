#import "UIView+AutoLayout.h"

@implementation UIView (AutoLayout)
#pragma mark - -----------------与父控件关系 -----------------
//与父控件关系,可以设置为0
- (void)topMarginToSuperView:(CGFloat)margin{
    [self.SGEdgeTop equalTo:self.superview.SGEdgeTop multiply:1 offset:margin];
}
- (void)leftMarginToSuperView:(CGFloat)margin{
    [self.SGEdgeLeft equalTo:self.superview.SGEdgeLeft multiply:1 offset:margin];
}
- (void)bottomMarginToSuperView:(CGFloat)margin{
    [self.SGEdgeBottom equalTo:self.superview.SGEdgeBottom multiply:1 offset:margin];}
- (void)rightMarginToSuperView:(CGFloat)margin{
    [self.SGEdgeRight equalTo:self.superview.SGEdgeRight multiply:1 offset:margin];
}

//同时设置多个方向上的margin,不设值传 0
- (void)everyMarginToSpuerView:(UIEdgeInsets)offset{
    if (offset.top) {
        [self topMarginToSuperView:offset.top];
    }
    if (offset.left) {
        [self leftMarginToSuperView:offset.left];
    }
    if (offset.bottom) {
        [self bottomMarginToSuperView:offset.bottom];
    }
    if (offset.right) {
        [self rightMarginToSuperView:offset.right];
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
    [self.SGCenterX equalTo:view.SGCenterX multiply:1 offset:offset];
}
//垂直偏移
- (void)standInlineInVertialWith:(UIView *)view offset:(CGFloat)offset{
    [self.SGCenterY equalTo:view.SGCenterY multiply:1 offset:offset];
}
//等宽
- (void)equalWidthToView:(UIView *)view{
    [self.SGWidth equalTo:view.SGWidth];
}
//等高
- (void)equalHeightToView:(UIView *)view{
    [self.SGHeight equalTo:view.SGHeight];
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
            [view2.SGEdgeLeft equalTo:view1.SGEdgeLeft offset:delta];
        }
    }
}
//x成倍递增
- (void)views:(NSArray *)views XIncreaseRegularlyWithTimes:(CGFloat)times{
    if (views.count) {
        for (int i = 0; i < views.count - 1; i++) {
            UIView *view1 = views[i];
            UIView *view2 = views[i + 1];
            [view2.SGEdgeLeft equalTo:view1.SGEdgeLeft multiply:times];
        }
    }
}
//y递增
- (void)views:(NSArray *)views YIncreaseRegularlyWithDelta:(CGFloat)delta{
    if (views.count) {
        for (int i = 0; i < views.count - 1; i++) {
            UIView *view1 = views[i];
            UIView *view2 = views[i + 1];
            [view2.SGEdgeTop equalTo:view1.SGEdgeTop offset:delta];
        }
    }
}
//y成倍递增
- (void)views:(NSArray *)views YIncreaseRegularlyWithTimes:(CGFloat)times{
    if (views.count) {
        for (int i = 0; i < views.count - 1; i++) {
            UIView *view1 = views[i];
            UIView *view2 = views[i + 1];
            [view2.SGEdgeRight equalTo:view1.SGEdgeRight multiply:times];
        }
    }
}
//centerX递增
- (void)views:(NSArray *)views CenterXIncreaseRegularlyWithDelta:(CGFloat)delta{
    if (views.count) {
        for (int i = 0; i < views.count - 1; i++) {
            UIView *view1 = views[i];
            UIView *view2 = views[i + 1];
            [view2.SGCenterX equalTo:view1.SGCenterX offset:delta];
        }
    }
}
//centerX成倍递增
- (void)views:(NSArray *)views CenterXIncreaseRegularlyWithTimes:(CGFloat)times{
    if (views.count) {
        for (int i = 0; i < views.count - 1; i++) {
            UIView *view1 = views[i];
            UIView *view2 = views[i + 1];
            [view2.SGCenterX equalTo:view1.SGCenterX multiply:times];
        }
    }
}
//centerY递增
- (void)views:(NSArray *)views CenterYIncreaseRegularlyWithDelta:(CGFloat)delta{
    if (views.count) {
        for (int i = 0; i < views.count - 1; i++) {
            UIView *view1 = views[i];
            UIView *view2 = views[i + 1];
            [view2.SGCenterY equalTo:view1.SGCenterY offset:delta];
        }
    }
}
//centerY成倍递增
- (void)views:(NSArray *)views CenterYIncreaseRegularlyWithTimes:(CGFloat)times{
    if (views.count) {
        for (int i = 0; i < views.count - 1; i++) {
            UIView *view1 = views[i];
            UIView *view2 = views[i + 1];
            [view2.SGCenterY equalTo:view1.SGCenterY multiply:times];
        }
    }
}
//宽度递增
- (void)views:(NSArray *)views WidthIncreaseRegularlyWithDelta:(CGFloat)delta{
    if (views.count) {
        for (int i = 0; i < views.count - 1; i++) {
            UIView *view1 = views[i];
            UIView *view2 = views[i + 1];
            [view2.SGWidth equalTo:view1.SGWidth offset:delta];
        }
    }
}
//宽度成倍递增
- (void)views:(NSArray *)views WidthIncreaseRegularlyWithTimes:(CGFloat)times{
    if (views.count) {
        for (int i = 0; i < views.count - 1; i++) {
            UIView *view1 = views[i];
            UIView *view2 = views[i + 1];
            [view2.SGWidth equalTo:view1.SGWidth multiply:times];
        }
    }
}
//高度递增
- (void)views:(NSArray *)views HeightIncreaseRegularlyWithDelta:(CGFloat)delta{
    if (views.count) {
        for (int i = 0; i < views.count - 1; i++) {
            UIView *view1 = views[i];
            UIView *view2 = views[i + 1];
            [view2.SGHeight equalTo:view1.SGHeight offset:delta];
        }
    }
}
//高度成倍递增
- (void)views:(NSArray *)views HeightIncreaseRegularlyWithTimes:(CGFloat)times{
    if (views.count) {
        for (int i = 0; i < views.count - 1; i++) {
            UIView *view1 = views[i];
            UIView *view2 = views[i + 1];
            [view2.SGHeight equalTo:view1.SGHeight multiply:times];
        }
    }
}
#pragma mark - -----------------属性反向赋值 -----------------
//将调用者的保存到自己的属性中
- (SGAttribute *)SGEdgeTop{
    SGAttribute *top = [[SGAttribute alloc] init];
    top.relativeView = self;
    top.attribute = NSLayoutAttributeTop;
    return top;
}
- (SGAttribute *)SGEdgeLeft{
    SGAttribute *left = [[SGAttribute alloc] init];
    left.relativeView = self;
    left.attribute = NSLayoutAttributeLeft;
    return left;
}
- (SGAttribute *)SGEdgeBottom{
    SGAttribute *bottom = [[SGAttribute alloc] init];
    bottom.relativeView = self;
    bottom.attribute = NSLayoutAttributeBottom;
    return bottom;
}
- (SGAttribute *)SGEdgeRight{
    SGAttribute *right = [[SGAttribute alloc] init];
    right.relativeView = self;
    right.attribute = NSLayoutAttributeRight;
    return right;
}
- (SGAttribute *)SGEdgeLeading{
    SGAttribute *leading = [[SGAttribute alloc] init];
    leading.relativeView = self;
    leading.attribute = NSLayoutAttributeLeading;
    return leading;
}
- (SGAttribute *)SGEdgeTrailing{
    SGAttribute *trailing = [[SGAttribute alloc] init];
    trailing.relativeView = self;
    trailing.attribute = NSLayoutAttributeTrailing;
    return trailing;
}
- (SGAttribute *)SGWidth{
    SGAttribute *width = [[SGAttribute alloc] init];
    width.relativeView = self;
    width.attribute = NSLayoutAttributeWidth;
    return width;
}
- (SGAttribute *)SGHeight{
    SGAttribute *height = [[SGAttribute alloc] init];
    height.relativeView = self;
    height.attribute = NSLayoutAttributeHeight;
    return height;
}

- (SGAttribute *)SGCenterX{
    SGAttribute *centerX = [[SGAttribute alloc] init];
    centerX.relativeView = self;
    centerX.attribute = NSLayoutAttributeCenterX;
    return centerX;
}
- (SGAttribute *)SGCenterY{
    SGAttribute *centerY = [[SGAttribute alloc] init];
    centerY.relativeView = self;
    centerY.attribute = NSLayoutAttributeCenterY;
    return centerY;
}

@end
