#import "SGAttribute.h"

@implementation SGAttribute
#pragma mark - -----------------标准公式(核心) core formula ----------
- (void)equalTo:(SGAttribute *)attribute multiply:(CGFloat)times offset:(CGFloat)offset{
    
    if (self == nil) return;
    
    //取出添加约束的对象
    UIView *desView = self.relativeView;
    
    //取出参照对象
    UIView *relativeView = attribute.relativeView;
    
    //关闭autoresizing // close autoresizing
    if (desView.translatesAutoresizingMaskIntoConstraints) {
        desView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:desView attribute:self.attribute relatedBy:NSLayoutRelationEqual toItem:relativeView attribute:attribute.attribute multiplier:times constant:offset];
    
    //添加约束
    if (relativeView == nil) {
        [desView addConstraint:constraint];
    }else{//查找最近共同的父控件  //find the latest common superView
        
        //取出共同父控件
        UIView *commonSuperView = nil;
        if(desView.superview == relativeView){
            //若后者是前者的父控件,就不用再找了
            commonSuperView = relativeView;
        }else{
            commonSuperView = [self theCommonSuperViewBetween:desView andSecondView:relativeView];
        }
        
        
        if (commonSuperView != nil) {
            //添加约束
            [commonSuperView addConstraint:constraint];
        }
        
    }
    
}
- (UIView *)theCommonSuperViewBetween:(UIView *)firstView andSecondView:(UIView *)secondView{
    
    //第一个View的父控件集合
    NSMutableArray *superViewsM1 = [self superViews:firstView];
    //第二个View的父控件集合
    NSMutableArray *superViewsM2 = [self superViews:secondView];
    
    UIView *commonSuperView = nil;
    //查找最近的父控件
    for(int i = 0;i < superViewsM1.count;i++){
        for (int j = 0; j < superViewsM2.count; j++) {
            UIView *temp1 = superViewsM1[i];
            UIView *temp2 = superViewsM2[j];
            if (temp1 == temp2) {//找到第一个
                commonSuperView = superViewsM1[i];
                break;
            }
            
        }
    }
    return commonSuperView;
}

//返回控件的父控件集合(包含自己)
- (NSMutableArray *)superViews:(UIView *)view{
    NSMutableArray *superViews = [NSMutableArray array];
    
    //先把自己加进去
    [superViews addObject:view];
    
    UIView *currentView = view;
     //递归查找
    while (currentView.superview) {
        [superViews addObject:currentView.superview];
        UIView *temp = currentView.superview;
        currentView = temp;
    }
    
    return superViews;
}
#pragma mark - -----------------直接赋值 -----------------
- (void)equalToValue:(CGFloat)value;{
    [self equalTo:nil multiply:1 offset:value];
}
//属性相等
- (void)equalTo:(SGAttribute *)attribute{
    [self equalTo:attribute multiply:1 offset:0];
}
//属性带偏移量
- (void)equalTo:(SGAttribute *)attribute offset:(CGFloat)offset{
    [self equalTo:attribute multiply:1 offset:offset];
}
//只有倍数
- (void)equalTo:(SGAttribute *)attribute multiply:(CGFloat)times{
    [self equalTo:attribute multiply:times offset:0];
}
@end
