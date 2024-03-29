
#import "UIView+Frame.h"

@implementation UIView (Extensions)
//x的getter
- (CGFloat)x
{
    return self.frame.origin.x;
}
//x的setter
- (void)setX:(CGFloat)x
{
    CGRect temp = self.frame;
    temp.origin.x = x;
    self.frame = temp;
}

//y的getter
- (CGFloat)y
{
    return self.frame.origin.y;
}
- (void)setY:(CGFloat)y
{
    CGRect temp = self.frame;
    temp.origin.y = y;
    self.frame = temp;
}
//origin   setter and getter
- (CGPoint)origin{
    return self.frame.origin;
}

-(void)setOrigin:(CGPoint)origin{
    CGRect temp = self.frame;
    temp.origin = origin;
    self.frame = temp;
}

//centerX
- (CGFloat)centerX{
    return self.center.x;
}
- (void)setCenterX:(CGFloat)centerX{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
//cnterY
- (CGFloat)centerY{
    return self.centerY;
}
- (void)setCenterY:(CGFloat)centerY{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}
//width
- (CGFloat)width
{
    return self.bounds.size.width;
}
- (void)setWidth:(CGFloat)width
{
    CGRect temp = self.bounds;
    temp.size.width = width;
    self.bounds = temp;
}

//height
- (CGFloat)height
{
    return self.bounds.size.height;
}
- (void)setHeight:(CGFloat)height
{
    CGRect temp = self.bounds;
    temp.size.height = height;
    self.bounds = temp;
}

//size
- (CGSize)size{
    return self.bounds.size;
}

//此处不能用bounds,有bug,y值会自动减半
- (void)setSize:(CGSize)size{
    CGRect temp = self.frame;
    
    temp.size = size;
    
    self.frame = temp;
   
}
@end
