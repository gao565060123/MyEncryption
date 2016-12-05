//
//  NSString+Verification.h
//  数据加密处理
//
//  Created by mybook on 16/9/13.
//  Copyright © 2016年 石塔Mr.GC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Verification)


/**
 *  判断字符串内容是否为整形
 *
 *  @return 判断结果
 */
- (BOOL)isPureInt;


/**
 *  判断字符串内容是否为浮点形
 *
 *  @return 判断结果
 */
- (BOOL)isPureFloat;


@end
