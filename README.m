# AutoLayout  
It is a very easy tools;

It is only the pakage of system auotolayout ,so  you can Mixed use it and system's

#remeber the view must have a super view except rootview before you use these codes

#if you have any questions or suggestions,please issue me;

//demo:blueView.width == redView.width*0.5
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


#the other function
#if you want to know about more,please look at  the profile.h





