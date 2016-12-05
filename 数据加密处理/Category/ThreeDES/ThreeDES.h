//
//  ThreeDES.h
//  数据加密处理
//
//  Created by mybook on 16/9/13.
//  Copyright © 2016年 石塔Mr.GC. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  3DES加密工具
 */
@interface ThreeDES : NSObject


/**
 *  对字符串进行3DES加密
 *
 *  @param string 原文
 *
 *  @return 密文
 */
+ (NSString *)encryptString:(NSString *)string;


/**
 *  对字符串进行3DES解密
 *
 *  @param string 密文
 *
 *  @return 原文
 */
+ (NSString *)decryptString:(NSString *)string;


/**
 *  对字符串进行3DES加密
 *
 *  @param plainText 明文
 *
 *  @return 密文
 */
+ (NSString *)AES128Encrypt:(NSString *)plainText;

/**
 *  对字符串进行3DES解密
 *
 *  @param encryptText 密文
 *
 *  @return 明文
 */
+ (NSString *)AES128Decrypt:(NSString *)encryptText;


@end
