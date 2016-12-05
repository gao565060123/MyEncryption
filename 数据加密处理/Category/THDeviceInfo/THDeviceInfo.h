//
//  THDeviceInfo.h
//  数据加密处理
//
//  Created by mybook on 16/9/13.
//  Copyright © 2016年 石塔Mr.GC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface THDeviceInfo : NSObject

/**
 *  生成Dictionary格式的设备信息
 *
 *  @return 生成的设备信息
 */
+ (NSDictionary *)generateDeviceInfo;


+ (NSString*)getDeviceVersion;

@end
