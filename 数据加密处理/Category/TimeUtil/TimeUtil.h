//
//  TimeUtil.h
//  数据加密处理
//
//  Created by mybook on 16/9/13.
//  Copyright © 2016年 石塔Mr.GC. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  时间日期格式化工具类
 */
@interface TimeUtil : NSObject


/**
 *  获取当前时间戳
 *
 *  @return 当前时间戳
 */
+ (NSTimeInterval)getCurrentTimeInterval;


/**
 *  将手机当天日期转换为"yyyy-MM-dd"格式的字符串
 *
 *  @return 格式化后的字符串
 */
+ (NSString *)formatCurrentDate;


/**
 *  将手机当天日期转换为formatString指定格式的字符串
 *
 *  @param formatString 日期格式，如"yyyy-MM-dd"
 *
 *  @return 格式化后的字符串
 */
+ (NSString *)formatCurrentDate:(NSString *)formatString;


/**
 *  将NSDate对象转换为"yyyy-MM-dd"格式的字符串
 *
 *  @param date NSDate对象
 *
 *  @return 格式化后的字符串
 */
+ (NSString *)formatterDate:(NSDate *)date;


/**
 *  将NSDate对象转换为formatString指定格式的字符串
 *
 *  @param date         NSDate对象
 *  @param formatString 日期格式，如"yyyy-MM-dd"
 *
 *  @return 格式化后的字符串
 */
+ (NSString *)formatterDate:(NSDate *)date formatString:(NSString *)formatString;


/**
 *  将格式为"yyyyMMdd"的日期字符串转换为NSDate对象
 *
 *  @param dateString  8位日期字符串，格式必须为"yyyyMMdd"
 *
 *  @return NSDate对象
 */
+ (NSDate *)getDateFromDateString:(NSString *)dateString;


/**
 *  将日期字符串根据formatString格式转换为NSDate对象
 *
 *  @param dateString   日期字符串
 *  @param formatString dateString的日期格式，如"yyyyMMdd"
 *
 *  @return NSDate对象
 */
+ (NSDate *)getDateFromDateString:(NSString *)dateString formatString:(NSString *)formatString;


/**
 *  将"yyyyMMddHHmmss"格式的字符串转换为"yyyy-MM-dd HH:mm:ss"格式的字符串
 *
 *  @param time 格式为"yyyyMMddHHmmss"的字符串
 *
 *  @return 格式化后的字符串
 */
+ (NSString *)formatterDateAndTime:(NSString *)timeString;


/**
 *  将"yyyyMMddHHmmss"格式的字符串转换为formatString指定格式的字符串
 *
 *  @param time         格式为"yyyyMMddHHmmss"的字符串
 *  @param formatString 日期格式，如"yyyy年MM月dd日 HH:mm:ss"
 *
 *  @return 格式化后的字符串
 */
+ (NSString *)formatterDateAndTime:(NSString *)timeString formatString:(NSString *)formatString;


/**
 *  将格式为"yyyyMMdd"的日期字符串转换为"yyyy-MM-dd"格式的字符串
 *
 *  @param dateString 格式为"yyyyMMdd"的日期字符串
 *
 *  @return 格式化后的字符串
 */
+ (NSString *)formatterDateString:(NSString *)dateString;


/**
 *  将格式为"HHmmss"的时间字符串转换为"HH:mm:ss"格式字符串
 *
 *  @param time 6位的时间字符串，格式必须为"HHmmss"
 *
 *  @return 格式化后的字符串
 */
+ (NSString *)formatterTimeString:(NSString *)timeString;


@end
