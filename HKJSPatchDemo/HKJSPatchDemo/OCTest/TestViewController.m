//
//  TestViewController.m
//  HKJSPatchDemo
//
//  Created by hukaiyin on 16/9/23.
//  Copyright © 2016年 HKY. All rights reserved.
//

#import "TestViewController.h"
#import "TestTableViewCell.h"

@interface TestViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<TestModel *> *data;
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSStringFromClass([self class]);
    [self tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cell";
    TestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[TestTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    [cell updateWithModel:[self.data objectAtIndex:indexPath.row]];
    return cell;
}

#pragma mark - Getters & Setters

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc]init];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSMutableArray<TestModel *> *)data {
    if (!_data) {
        NSArray *arr = @[
              @{@"imgName":@"SANJI",@"detail":@"点按 cell 显示 HUD"},
              @{@"imgName":@"ZORO",@"detail":@"关闭 switch，再按 cell，不显示 HUD"},
              @{@"imgName":@"NAMI",@"detail":@"长按 cell 有弹框"},
              @{@"imgName":@"ACE",@"detail":@"123"},
              @{@"imgName":@"BEPO",@"detail":@"324"},
              @{@"imgName":@"FRANKY",@"detail":@"999"}];
        _data = [TestModel arrayOfModelsFromDictionaries:arr error:nil];
    }
    return _data;
}

@end
