//
//  ViewController.m
//  数据加密处理
//
//  Created by mybook on 16/9/13.
//  Copyright © 2016年 石塔Mr.GC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@end

@implementation ViewController
{
    NSTimer *timer;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initAll];
    
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerFireMeThod) userInfo:nil repeats:YES];
}

- (void)timerFireMeThod
{
    NSLog(@"1111111111");
}


- (void)initAll
{
    [self initData];
    [self initView];
}
- (void)initView
{
    self.navigationItem.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}
- (void)initData
{
    NSArray *arr = @[
                     @"AESBase64Controller",
                     @"MD5Controller",
                     @"ThreeDESController",
                     @"NSUserDefaultsSecure",
                     @"DeviceInfoController"
                     ];
    self.dataArr = [NSMutableArray arrayWithArray:arr];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Class targetClass = NSClassFromString(self.dataArr[indexPath.row]);
    id target = [[targetClass alloc] init];
    [self.navigationController pushViewController:target animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
