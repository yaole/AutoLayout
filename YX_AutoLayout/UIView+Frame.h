#import <UIKit/UIKit.h>


@interface UIView (Frame)
//x,y and xy
@property (nonatomic,assign) CGFloat x;
@property (nonatomic,assign) CGFloat y;
@property (nonatomic,assign) CGPoint origin;

//cneterX, centerY
@property (nonatomic,assign) CGFloat centerX;
@property (nonatomic,assign) CGFloat centerY;
//center
@property (nonatomic,assign) CGPoint centerP;

//width,height  size
@property (nonatomic,assign) CGFloat width;
@property (nonatomic,assign) CGFloat height;
@property (nonatomic,assign) CGSize size;
@end
