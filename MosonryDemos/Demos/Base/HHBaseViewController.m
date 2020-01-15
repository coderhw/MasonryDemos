//
//  HHBaseViewController.m
//  MosonryDemos
//
//  Created by vanke on 2019/12/27.
//  Copyright © 2019 com. All rights reserved.
//

#import "HHBaseViewController.h"

@interface HHBaseViewController ()

@end

@implementation HHBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //如果视图里面存在唯一一个UIScrollView或其子类View，那么它会自动设置相应的内边距
    //手动关闭该ScrollView自动调整内边距属性
    self.automaticallyAdjustsScrollViewInsets = NO;

//    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];

}



@end
