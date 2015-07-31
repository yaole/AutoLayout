


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SGAttribute : NSObject

/** relativeView 比较对象 */ /** weak防止循环引用 */
@property (nonatomic,weak) UIView *relativeView;

/** LayoutAttribute 约束属性 */
@property (nonatomic,assign) NSLayoutAttribute attribute;

/**the most useful 万能公式*/
- (void)equalTo:(SGAttribute *)attribute multiply:(CGFloat)times offset:(CGFloat)offset;

//直接赋值 
- (void)equalToValue:(CGFloat)value;
//属性相等 equal attribute
- (void)equalTo:(SGAttribute *)attribute;
//属性带偏移量  equal attribute and have a distance
- (void)equalTo:(SGAttribute *)attribute offset:(CGFloat)offset;
//只有倍数    attribute of the view is times of other's 
- (void)equalTo:(SGAttribute *)attribute multiply:(CGFloat)times;
@end
