//
//  MD5Controller.m
//  数据加密处理
//
//  Created by mybook on 16/9/13.
//  Copyright © 2016年 石塔Mr.GC. All rights reserved.
//

#import "MD5Controller.h"

//- (NSString *)MD5;    (NSData / NSString)

static NSString *key_string = @"md5String";
@interface MD5Controller ()
@property (weak, nonatomic) IBOutlet UILabel *md5String;
@property (weak, nonatomic) IBOutlet UILabel *originLab;

@end

@implementation MD5Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self makeMd5];
}



/**
 *   MD5加密
 */
- (void)makeMd5
{
    self.originLab.text = key_string;
    
    self.md5String.text = [key_string MD5];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
