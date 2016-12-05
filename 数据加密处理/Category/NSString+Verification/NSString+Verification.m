//
//  NSString+Verification.m
//  数据加密处理
//
//  Created by mybook on 16/9/13.
//  Copyright © 2016年 石塔Mr.GC. All rights reserved.
//

#import "NSString+Verification.h"

@implementation NSString (Verification)

#pragma mark -
#pragma mark Public Methods
#pragma mark 判断字符串内容是否为整形
- (BOOL)isPureInt {
    
    NSScanner * scan = [NSScanner scannerWithString:self];
    
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}


#pragma mark 判断字符串内容是否为浮点形
- (BOOL)isPureFloat {
    
    NSScanner * scan = [NSScanner scannerWithString:self];
    
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}

@end
