//
//  MD5.h
//  数据加密处理
//
//  Created by mybook on 16/9/13.
//  Copyright © 2016年 石塔Mr.GC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MD5_Extensions)

- (NSString *)MD5;

@end

@interface NSData (MD5_Extensions)

- (NSString *)MD5;

@end

