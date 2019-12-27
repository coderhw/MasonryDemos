//
//  HHCaseViewController.m
//  MosonryDemos
//
//  Created by vanke on 2019/12/27.
//  Copyright © 2019 com. All rights reserved.
//

#import "HHCase1ViewController.h"
#import <Masonry.h>

@interface HHCase1ViewController ()

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;

@property (nonatomic, strong) UIStepper *stepper1;
@property (nonatomic, strong) UIStepper *stepper2;

@end

@implementation HHCase1ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addsubViews];
    [self addConstrains];
}


- (void)addsubViews {
    
    [self.view addSubview:self.titleLabel];
    self.titleLabel.text = @"并排两个Label, 整体靠左边，宽度随内容增长，左边的Label'优先级更高'";
    
    
    [self.view addSubview:self.contentView];

    [self.contentView addSubview:self.label1];
    [self.contentView addSubview:self.label2];
    
    
    [self.view addSubview:self.stepper1];
    [self.view addSubview:self.stepper2];

}

- (void)addConstrains {
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.mas_topLayoutGuide).offset(16);
        make.left.equalTo(self.view.mas_left).offset(16);
        make.right.equalTo(self.view.mas_right).offset(-16);
    }];
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.titleLabel.mas_bottom).offset(80);
        make.height.equalTo(@64);
        make.left.equalTo(self.view.mas_left).offset(16);
        make.right.equalTo(self.view.mas_right).offset(-16);
    }];
    
    [self.label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        //固定高度
        make.top.equalTo(self.contentView.mas_top).offset(5);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
        //固定左边距
        make.left.equalTo(self.contentView.mas_left).offset(5);

    }];
    
    [self.label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        //左边贴这Label1
        make.left.equalTo(self.label1.mas_right).offset(2);
        //固定高度
        make.top.equalTo(self.label1);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
        
        //右边距
        make.right.lessThanOrEqualTo(self->_contentView.mas_right).offset(-5);
        
        
    }];
    
    
    [self.stepper1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView);
        make.top.equalTo(self.contentView.mas_bottom).offset(16);
        make.height.equalTo(@24);
        make.width.equalTo(@100);
    }];
    
    [self.stepper2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.contentView);
        make.top.equalTo(self.contentView.mas_bottom).offset(16);
        make.height.equalTo(@24);
        make.width.equalTo(@100);
    }];
    
    
    //这样Label2就会被Label1挤出去
    
    //设置label1的content hugging 为1000  抗拉伸优先级
    [_label1 setContentHuggingPriority:UILayoutPriorityRequired
                               forAxis:UILayoutConstraintAxisHorizontal];
    
    //设置label1的content compression 为1000 防压缩优先级
    [_label1 setContentCompressionResistancePriority:UILayoutPriorityRequired
                                             forAxis:UILayoutConstraintAxisHorizontal];
    
    //设置右边的label2的content hugging 为1000
    [_label2 setContentHuggingPriority:UILayoutPriorityRequired
                               forAxis:UILayoutConstraintAxisHorizontal];
    
    //设置右边的label2的content compression 为250
    [_label2 setContentCompressionResistancePriority:UILayoutPriorityRequired
                                             forAxis:UILayoutConstraintAxisHorizontal];

    
}


#pragma mark - Action
- (void)stepValueChanged:(UIStepper *)stepper {
    
    switch (stepper.tag - 100) {
        case 0:
        {
            _label1.text = [self getLabelContentWithCount:(NSUInteger)stepper.value];

        }
            break;
        case 1:
        {
            _label2.text = [self getLabelContentWithCount:(NSUInteger)stepper.value];

        }
            break;
        default:
            break;
    }
}

- (NSString *)getLabelContentWithCount:(NSUInteger)count {
    
    NSMutableString *tempStr = [NSMutableString new];
    for (NSUInteger i = 0; i <= count; i++) {
        [tempStr appendString:@"label,"];
    }
    
    return tempStr.copy;
}


#pragma mark - Getter Methods
- (UIView *)contentView {
    if(!_contentView){
        _contentView = [[UIView alloc] initWithFrame:CGRectZero];
        _contentView.backgroundColor = [UIColor darkGrayColor];
    }
    return _contentView;
}

- (UILabel *)label1 {
    if(!_label1){
        _label1 = [[UILabel alloc] initWithFrame:CGRectZero];
        _label1.backgroundColor = [UIColor yellowColor];
        _label1.text = @"label,";

    }
    return _label1;
}

- (UILabel *)label2 {
    if(!_label2){
        _label2 = [[UILabel alloc] initWithFrame:CGRectZero];
        _label2.backgroundColor = [UIColor greenColor];
        _label2.text = @"labe2,";

    }
    return _label2;
}

- (UILabel *)titleLabel {
    if(!_titleLabel){
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.numberOfLines = 0;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UIStepper *)stepper1 {
    
    if(!_stepper1){
        _stepper1 = [[UIStepper alloc] initWithFrame:CGRectZero];
        _stepper1.tag = 100;
        [_stepper1 addTarget:self action:@selector(stepValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _stepper1;
}

- (UIStepper *)stepper2 {
    
    if(!_stepper2){
        _stepper2 = [[UIStepper alloc] initWithFrame:CGRectZero];
        _stepper2.tag = 101;
        [_stepper2 addTarget:self action:@selector(stepValueChanged:) forControlEvents:UIControlEventValueChanged];

    }
    return _stepper2;
}


@end
