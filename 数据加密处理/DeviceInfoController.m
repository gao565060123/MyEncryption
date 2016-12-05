//
//  DeviceInfoController.m
//  数据加密处理
//
//  Created by mybook on 16/9/13.
//  Copyright © 2016年 石塔Mr.GC. All rights reserved.
//

#import "DeviceInfoController.h"



///**
// *  生成Dictionary格式的设备信息
// *
// *  @return 生成的设备信息
// */
//+ (NSDictionary *)generateDeviceInfo;

//+ (NSString*)getDeviceVersion;

@interface DeviceInfoController ()

@end

@implementation DeviceInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [THDeviceInfo generateDeviceInfo];
    NSLog(@"%@\n\n\n\n\n\n\n",[THDeviceInfo getDeviceVersion]);
    
    
    NSLog(@"%@",[THDeviceInfo generateDeviceInfo]);
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
