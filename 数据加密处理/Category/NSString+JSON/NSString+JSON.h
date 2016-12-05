//
//  NSString+JSON.h
//  数据加密处理
//
//  Created by mybook on 16/9/13.
//  Copyright © 2016年 石塔Mr.GC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JSON)

/**
 *  把格式化的JSON格式的字符串转换成字典
 *
 *  @return 解析结果字典
 */
- (NSDictionary *)dictionaryWithJsonString;

@end
