//
//  ThreeDESController.m
//  数据加密处理
//
//  Created by mybook on 16/9/13.
//  Copyright © 2016年 石塔Mr.GC. All rights reserved.
//

#import "ThreeDESController.h"

static NSString *key_string = @"ThreeDESControllerString";

@interface ThreeDESController ()
/**
 *  密文
 */
@property (weak, nonatomic) IBOutlet UILabel *encryptString;
@property (weak, nonatomic) IBOutlet UILabel *decryptString;

/**
 *  明文
 */
@property (weak, nonatomic) IBOutlet UILabel *AES128Encrypt;
@property (weak, nonatomic) IBOutlet UILabel *AES128Decrypt;

@end

@implementation ThreeDESController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self darkEncryptString];
    [self darkDecryptString];
    [self lightAES128Encrypt];
    [self lightAES128Decrypt];
}

/**
 *  密文  加密
 */
- (void)darkEncryptString
{
    self.encryptString.text = [ThreeDES encryptString:key_string];
}
/**
 *  密文  解密 (返回明文)
 */
- (void)darkDecryptString
{
    self.decryptString.text = [ThreeDES decryptString:self.encryptString.text];
}

/**
 *  明文 加密
 */
- (void)lightAES128Encrypt
{
    self.AES128Encrypt.text = [ThreeDES AES128Encrypt:key_string];
}
/**
 *  明文 解密 (返回明文)
 */
- (void)lightAES128Decrypt
{
    self.AES128Decrypt.text = [ThreeDES AES128Decrypt:self.AES128Encrypt.text];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end

//     ThreeDES
//
//   3DES加密工具
//
///**
// *  对字符串进行3DES加密
// *
// *  @param string 原文
// *
// *  @return 密文
// */
//+ (NSString *)encryptString:(NSString *)string;
//
//
///**
// *  对字符串进行3DES解密
// *
// *  @param string 密文
// *
// *  @return 原文
// */
//+ (NSString *)decryptString:(NSString *)string;
//
//
///**
// *  对字符串进行3DES加密
// *
// *  @param plainText 明文
// *
// *  @return 密文
// */
//+ (NSString *)AES128Encrypt:(NSString *)plainText;
//
///**
// *  对字符串进行3DES解密
// *
// *  @param encryptText 密文
// *
// *  @return 明文
// */
//+ (NSString *)AES128Decrypt:(NSString *)encryptText;

