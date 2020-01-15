//
//  HHCase3ViewController.m
//  MosonryDemos
//
//  Created by vanke on 2020/1/15.
//  Copyright © 2020 com. All rights reserved.
//

#import "HHCase3ViewController.h"
#import <Masonry.h>


@interface HHCase3ViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (assign, nonatomic) CGFloat maxWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerViewWidthConstraint;

@end

@implementation HHCase3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //保存最大宽度
    _maxWidth = _containerViewWidthConstraint.constant;
    [self initView];
}

- (IBAction)changeContainerViewWidth:(UISlider *)sender {
    if (sender.value) {
        //改变containerView的宽度
        _containerViewWidthConstraint.constant = sender.value * _maxWidth;
    }
}


- (void)initView {
    
    UIView *subView = [UIView new];
    subView.backgroundColor = [UIColor redColor];
    
    [_containerView addSubview:subView];
    
    __weak typeof(self) welfSelf = self;
    [subView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(welfSelf.containerView.mas_left);
        make.top.equalTo(welfSelf.containerView.mas_top);
        make.bottom.equalTo(welfSelf.containerView.mas_bottom);
        
        //宽度为父类的宽度一半
        make.width.equalTo(welfSelf.containerView.mas_width).multipliedBy(0.5);
    }];
    
}

@end
