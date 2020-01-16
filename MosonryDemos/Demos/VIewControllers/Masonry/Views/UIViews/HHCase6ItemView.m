//
//  Case6ItemView.m
//  MasonryExample
//
//  Created by zorro on 15/8/2.
//  Copyright (c) 2015年 tutuge. All rights reserved.
//

#import "HHCase6ItemView.h"
#import "Masonry.h"

@interface HHCase6ItemView ()
@property (strong, nonatomic) UIView *baseView;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *text;
@end

@implementation HHCase6ItemView

+ (instancetype)newItemWithImage:(UIImage *)image text:(NSString *)text {
    HHCase6ItemView *item = [HHCase6ItemView new];
    item.image = image;
    item.text = text;
    [item initView];
    
    return item;
}

#pragma mark - Private methods

- (void)initView {
    self.backgroundColor = [UIColor lightGrayColor];

    // ImageView
    UIImageView *imageView = [[UIImageView alloc] initWithImage:_image];
    self.baseView = imageView;

    // Label
    UILabel *label = [UILabel new];
    label.numberOfLines = 0;
    label.text = _text;
    label.textColor = [UIColor whiteColor];

    [self addSubview:imageView];
    [self addSubview:label];

    // ImageView
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(4);
        make.top.equalTo(self.mas_top).with.offset(4);
        make.right.equalTo(self.mas_right).with.offset(-4);
    }];
    
    //以ImageView作为Baseline 设置抗拉伸属性
    [imageView setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [imageView setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];

    // Label
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(imageView.mas_width);
        make.left.equalTo(imageView.mas_left);
        make.top.equalTo(imageView.mas_bottom).with.offset(4);
        make.bottom.equalTo(self.mas_bottom).with.offset(-4);
    }];
    [label setContentHuggingPriority:UILayoutPriorityRequired-1 forAxis:UILayoutConstraintAxisVertical];
}

#pragma mark - Override

//// 返回自定义的baseline的view
//- (UIView *)viewForBaselineLayout {
//    return _baseView;
//}

// 返回自定义的baseline的view
- (UIView *)viewForFirstBaselineLayout {
    return _baseView;
}

@end
