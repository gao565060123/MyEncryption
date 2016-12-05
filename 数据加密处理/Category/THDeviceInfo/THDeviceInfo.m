//
//  THDeviceInfo.m
//  数据加密处理
//
//  Created by mybook on 16/9/13.
//  Copyright © 2016年 石塔Mr.GC. All rights reserved.
//

#import "THDeviceInfo.h"
#import <UIKit/UIKit.h>
#import "sys/utsname.h"

@implementation THDeviceInfo

+ (NSDictionary *)generateDeviceInfo {
    
    int scale = [[UIScreen mainScreen] scale];
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    
    NSMutableDictionary * deviceInfo = [[NSMutableDictionary alloc] init];
    
    // 屏幕高度
    [deviceInfo setValue:[NSString stringWithFormat:@"%d", (int)(screenSize.height * scale)] forKey:@"screenheight"];
    
    // 屏幕宽度
    [deviceInfo setValue:[NSString stringWithFormat:@"%d", (int)(screenSize.width * scale)] forKey:@"screenwidth"];
    
    // 操作系统类型
    [deviceInfo setValue:@"I" forKey:@"ostype"];
    
    // 操作系统版本
    [deviceInfo setValue:[[UIDevice currentDevice] systemVersion] forKey:@"osversion"];
    
    // 手机厂商
    [deviceInfo setValue:@"Apple" forKey:@"mobilefac"];
    
    // 手机机型
    [deviceInfo setValue:[[UIDevice currentDevice] model] forKey:@"mobilemod"];
    
    NSString * appVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];
    // 版本信息
    [deviceInfo setValue:appVersion forKey:@"versions-info"];
    
    // 手机唯一标识码
//    [deviceInfo setValue:[[[UIDevice currentDevice] identifierForVendor] UUIDString] forKey:@"uniquecode"];   // 废弃
    
    [deviceInfo setValue:@"0" forKey:@"version-state"];

    return deviceInfo;
}


+ (NSString*)getDeviceVersion
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    return deviceString;
}

@end
