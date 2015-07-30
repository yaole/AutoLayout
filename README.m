# AutoLayout
pakage of system auotolayout  you can Mixed use it and system's

if you have any questions or suggestions,please send
email to 747616044@qq.com ,thanks;

//demo:blueView.width == redViw.width*0.5
UIView *redview = [[UIView alloc] init];
redview.backgroundColor = [UIColor redColor];
[self.view addSubview:redview];

//set margin in super view
[redview everyMargininSpuerView:UIEdgeInsetsMake(20, 10, 0, -10)];
//set only height
[redview.YXHeight equalToValue:30];

UIView *blueView =  [[UIView alloc] init];
blueView.backgroundColor = [UIColor blueColor];
[self.view addSubview:blueView];
//blueView.right == redView.right
[blueView.YXEdgeRight equalTo:redview.YXEdgeRight];
//buluView.y = redView.y + 30
[blueView.YXEdgeTop equalTo:redview.YXEdgeBottom offset:30];
//blueView.Width = redView.width *0.5
[blueView.YXWidth equalTo:redview.YXWidth times:0.5];
//the same height
[blueView.YXHeight equalTo:redview.YXHeight];
----------------------------------------------------------------
is it very easy ?

#the other function

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
//y递增          the top....(same as the line of 86)
- (void)views:(NSArray *)views YIncreaseRegularlyWithDelta:(CGFloat)delta;
//y成倍递增       the top....(same as the line of 88)
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
