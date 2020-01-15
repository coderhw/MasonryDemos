//
//  ViewController.m
//  MosonryDemos
//
//  Created by vanke on 2019/12/26.
//  Copyright © 2019 com. All rights reserved.
//

#import "HHMainViewController.h"
#import <Masonry.h>
#import "HHContentCell.h"

//VC
#import "HHCase1ViewController.h"
#import "HHCase2ViewController.h"
#import "HHCase3ViewController.h"
#import "HHCase4ViewController.h"

@interface HHMainViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *datasource1;
@property (nonatomic, strong) NSArray *datasource2;

@end

@implementation HHMainViewController

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
        if(@available(iOS 11.0, *)){
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        } else {
            make.top.equalTo(self.mas_topLayoutGuide);
        }
        
        if(@available(iOS 11.0, *)){
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            
        } else {
            make.bottom.equalTo(self.mas_bottomLayoutGuide);
        }
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
            HHCase1ViewController *case1VC = [[HHCase1ViewController alloc] init];
            [self.navigationController pushViewController:case1VC animated:YES];
        }
            break;
        case 1:
        {
            HHCase2ViewController *case2VC = [[HHCase2ViewController alloc]
                                              initWithNibName:@"HHCase2ViewController" bundle:nil];
            [self.navigationController pushViewController:case2VC animated:YES];
        }
            break;
        case 2:
        {
            HHCase3ViewController *case3VC = [[HHCase3ViewController alloc]
                                              initWithNibName:@"HHCase3ViewController" bundle:nil];
            [self.navigationController pushViewController:case3VC animated:YES];
        }
            break;
        case 3:
        {
            HHCase4ViewController *case4VC = [[HHCase4ViewController alloc]
                                              initWithNibName:@"HHCase4ViewController" bundle:nil];
            [self.navigationController pushViewController:case4VC animated:YES];
        }
            break;
        default:
            break;
    }
    
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
