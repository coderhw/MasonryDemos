//
//  HHContentCell.m
//  MosonryDemos
//
//  Created by vanke on 2019/12/26.
//  Copyright © 2019 com. All rights reserved.
//

#import "HHContentCell.h"
#import <Masonry.h>

@interface HHContentCell ()


@end

@implementation HHContentCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self initView];
        [self addConstraints];
    }
    return self;
}

- (void)initView {
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.contentLabel];
}

- (void)addConstraints {
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.mas_equalTo(self.contentView).offset(16);
        make.top.mas_equalTo(self.contentView).offset(12);

    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.mas_equalTo(self.contentView).offset(16);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(8);

    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


- (UILabel *)titleLabel {
    if(!_titleLabel){
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    if(!_contentLabel){
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _contentLabel.font = [UIFont systemFontOfSize:12];
    }
    return _contentLabel;
}


@end
