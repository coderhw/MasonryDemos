//
//  ViewController.m
//  MosonryDemos
//
//  Created by vanke on 2019/12/26.
//  Copyright © 2019 com. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "HHContentCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *datasource1;
@property (nonatomic, strong) NSArray *datasource2;

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    self.navigationItem.title = @"Masonry";
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[HHContentCell class] forCellReuseIdentifier:@"HHContentCellID"];
    
    [self addConstrains];
    
    self.datasource1 = @[@"Case1",@"Case2",@"Case3",@"Case4",@"Case5",@"Case6",
                        @"Case7",@"Case8",@"Case9",@"Case10",@"Case11",@"Case12",
                        @"Case13",@"Case14",@"Case15"];
    
    self.datasource2 = @[@"并排Label",@"动态居中",@"百分比宽度",@"变高UITableViewCell",@"top(bottom)GuildView",
                         @"自定义BaseLine",@"Parallax Header",@"动态展开UITableViewCell",
                         @"两种方式实现等间距",@"用优先级保证内容可见",@"AutoLayout动态绑定特性",@"利用LayoutIfNeed控制约束生效时机",
                         @"Cell中并排多个变高Label",@"自定义View的intrinsicContentSize",@"同一个属性可以添加多个约束"];

}


- (void)addConstrains {
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide);
        make.bottom.equalTo(self.mas_bottomLayoutGuide);
        make.left.and.right.equalTo(self.view);
    }];
}

#pragma mark -  UITableView Delegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HHContentCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"HHContentCellID"];
    
    cell.titleLabel.text = self.datasource1[indexPath.row];
    cell.contentLabel.text = self.datasource2[indexPath.row];

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datasource1.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

#pragma mark - Getter Methods
- (UITableView *)tableView {
    
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}



@end
