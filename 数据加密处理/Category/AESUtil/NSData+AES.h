//
//  NSData+AES.h
//  数据加密处理
//
//  Created by mybook on 16/9/13.
//  Copyright © 2016年 石塔Mr.GC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NSString;

@interface NSData (Encryption)

- (NSData *)AES128EncryptWithKey:(NSString *)key gIv:(NSString *)Iv;   //加密
- (NSData *)AES128DecryptWithKey:(NSString *)key gIv:(NSString *)Iv;   //解密

@end
