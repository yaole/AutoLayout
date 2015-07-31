

#import "ViewController.h"
#import "UIView+AutoLayout.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#warning 必须先添加控件,再添加约束
#warning must have a superView except rootView
//domo1:蓝色是红色宽度的一半
    UIView *redview = [[UIView alloc] init];
    redview.backgroundColor = [UIColor redColor];
    [self.view addSubview:redview];
    
    [redview everyMarginToSpuerView:UIEdgeInsetsMake(20, 10, 0, -10)];
    [redview.SGHeight equalToValue:30];

    UIView *blueView =  [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    [blueView.SGEdgeRight equalTo:redview.SGEdgeRight];
    [blueView.SGEdgeTop equalTo:redview.SGEdgeBottom offset:30];
    [blueView.SGWidth equalTo:redview.SGWidth multiply:0.5];
    [blueView.SGHeight equalTo:redview.SGHeight];
   
//demo2:柱状图,x递增,高度递

    NSMutableArray *views = [NSMutableArray array];
    
    //创建8个view
    for (int i = 0; i < 8; i++) {
        //创建view
        UIView *view= [[UIView alloc] init];
        view.backgroundColor = [UIColor orangeColor];
        [self.view addSubview:view];
        [views addObject:view];
        
        [view bottomMarginToSuperView:0];//与底部固定
        [view.SGWidth equalToValue:30];//指定固定宽度为30
        
        if (0 == i) {
            [view leftMarginToSuperView:0];
            [view.SGHeight equalToValue:60];
        }
        
    }
    //x递增20  30是自身的宽度
    [self.view views:views XIncreaseRegularlyWithDelta:30 + 20];
    //高度递增40
    [self.view views:views HeightIncreaseRegularlyWithDelta:40];
}


@end
