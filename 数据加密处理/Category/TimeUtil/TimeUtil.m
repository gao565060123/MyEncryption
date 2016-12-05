//
//  TimeUtil.m
//  数据加密处理
//
//  Created by mybook on 16/9/13.
//  Copyright © 2016年 石塔Mr.GC. All rights reserved.
//

#import "TimeUtil.h"

@implementation TimeUtil


#pragma mark - Class Methods
#pragma mark 获取当前时间戳
+ (NSTimeInterval)getCurrentTimeInterval {
    
    return [[NSDate date] timeIntervalSince1970];
}


#pragma mark 将手机当天日期转换为"yyyy-MM-dd"格式的字符串
+ (NSString *)formatCurrentDate {
    
    return [self formatCurrentDate:@"yyyy-MM-dd"];
}


#pragma mark 将手机当天日期转换为formatString指定格式的字符串
+ (NSString *)formatCurrentDate:(NSString *)formatString {
    
    NSDate * date = [NSDate date];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatString];
    
    return [formatter stringFromDate:date];
}


#pragma mark 将NSDate对象转换为"yyyy-MM-dd"格式的字符串
+ (NSString *)formatterDate:(NSDate *)date {
    
    return [self formatterDate:date formatString:@"yyyy-MM-dd"];
}


#pragma mark 将NSDate对象转换为formatString指定格式的字符串
+ (NSString *)formatterDate:(NSDate *)date formatString:(NSString *)formatString {
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatString];
    
    return [formatter stringFromDate:date];
}


#pragma mark 将格式为"yyyyMMdd"的日期字符串转换为NSDate对象
+ (NSDate *)getDateFromDateString:(NSString *)dateString {
    
    if ([dateString length] != [@"yyyyMMdd" length]) {
        
        return nil;
    }
    
    return [self getDateFromDateString:dateString formatString:@"yyyyMMdd"];
}


#pragma mark 将日期字符串根据formatString格式转换为NSDate对象
+ (NSDate *)getDateFromDateString:(NSString *)dateString formatString:(NSString *)formatString {
    
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setLocale:[NSLocale currentLocale]];
    [inputFormatter setDateFormat:formatString];
    
    return [inputFormatter dateFromString:dateString];
}


#pragma mark 将"yyyyMMddHHmmss"格式的字符串转换为"yyyy-MM-dd HH:mm:ss"格式的字符串
+ (NSString *)formatterDateAndTime:(NSString *)timeString {
    
    if ([timeString length] != [@"yyyyMMddHHmmss" length]) {
        
        return nil;
    }
    
    NSDate * date = [self getDateFromDateString:timeString formatString:@"yyyyMMddHHmmss"];
    
    return [self formatterDate:date formatString:@"yyyy-MM-dd HH:mm:ss"];
}


#pragma mark 将"yyyyMMddHHmmss"格式的字符串转换为formatString指定格式的字符串
+ (NSString *)formatterDateAndTime:(NSString *)timeString formatString:(NSString *)formatString {
    
    if ([timeString length] != [@"yyyyMMddHHmmss" length]) {
        
        return nil;
    }
    
    NSDate * date = [self getDateFromDateString:timeString formatString:@"yyyyMMddHHmmss"];
    
    return [self formatterDate:date formatString:formatString];
}


#pragma mark 将格式为"yyyyMMdd"的日期字符串转换为"yyyy-MM-dd"格式的字符串
+ (NSString *)formatterDateString:(NSString *)dateString {
    
    if ([dateString length] != [@"yyyyMMdd" length]) {
        
        return nil;
    }
    
    NSDate * date = [self getDateFromDateString:dateString formatString:@"yyyyMMdd"];
    
    return [self formatterDate:date formatString:@"yyyy-MM-dd"];
}


#pragma mark 将格式为"HHmmss"的时间字符串转换为"HH:mm:ss"格式字符串
+ (NSString *)formatterTimeString:(NSString *)timeString {
    
    if ([timeString length] != [@"HHmmss" length]) {
        
        return nil;
    }
    
    NSDate * date = [self getDateFromDateString:timeString formatString:@"HHmmss"];
    
    return [self formatterDate:date formatString:@"HH:mm:ss"];
}

@end
