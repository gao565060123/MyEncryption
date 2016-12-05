//
//  AESUtil.m
//  数据加密处理
//
//  Created by mybook on 16/9/13.
//  Copyright © 2016年 石塔Mr.GC. All rights reserved.
//

#import "AESUtil.h"
#import <CommonCrypto/CommonCryptor.h>
#import "GTMBase64.h"
#import "NSData+AES.h"


#define Iv          @"1234567890123456" //偏移量,可自行修改
#define KEY         @"NSUTF8StringEnco" //key，可自行修改

@implementation AESUtil


#pragma mark - base64
+ (NSString*)encodeBase64String:(NSString * )input {
    NSData *data = [input dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    data = [GTMBase64 encodeData:data];
    NSString *base64String = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return base64String;
    
}

+ (NSString*)decodeBase64String:(NSString * )input {
    NSData *data = [input dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    data = [GTMBase64 decodeData:data];
    NSString *base64String = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return base64String;
}

+ (NSString*)encodeBase64Data:(NSData *)data {
    data = [GTMBase64 encodeData:data];
    NSString *base64String = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return base64String;
}

+ (NSString*)decodeBase64Data:(NSData *)data {
    data = [GTMBase64 decodeData:data];
    NSString *base64String = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return base64String;
}


#pragma mark - AES加密
//将string转成带密码的data
+(NSString*)AES128Encrypt:(NSString*)string
{
    //将nsstring转化为nsdata
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    //使用密码对nsdata进行加密
    NSData *encryptedData = [data AES128EncryptWithKey:KEY gIv:Iv];
    //返回进行base64进行转码的加密字符串
    return [self encodeBase64Data:encryptedData];
}


#pragma mark - AES解密
//将带密码的data转成string
+(NSString*)AES128Decrypt:(NSString *)string
{
    //base64解密
    NSData *decodeBase64Data=[GTMBase64 decodeString:string];
    //使用密码对data进行解密
    NSData *decryData = [decodeBase64Data AES128DecryptWithKey:KEY gIv:Iv];
    //将解了密码的nsdata转化为nsstring
    NSString *str = [[NSString alloc] initWithData:decryData encoding:NSUTF8StringEncoding];
    return str;
}


@end
