//
//  YXAttribute.h
//  CNComposition
//
//  Created by yyx on 15/7/26.
//  Copyright (c) 2015年 yyx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface YXAttribute : NSObject

/** parameter 参数,传递的参数 */

/** sourceView 比较对象 */ /** weak防止循环引用 */
@property (nonatomic,weak) UIView *sourceView;

/** LayoutAttribute 约束属性 */
@property (nonatomic,assign) NSLayoutAttribute attribute;

/**core formula  万能公式*/
- (void)equalTo:(YXAttribute *)attribute times:(CGFloat)times offset:(CGFloat)offset;

//直接赋值
- (void)equalToValue:(CGFloat)value;
//属性相等 equal attribute
- (void)equalTo:(YXAttribute *)attribute;
//属性带偏移量  equal attribute and have a distance
- (void)equalTo:(YXAttribute *)attribute offset:(CGFloat)offset;
//只有倍数    attribute of the view is times of other's 
- (void)equalTo:(YXAttribute *)attribute times:(CGFloat)times;
@end
