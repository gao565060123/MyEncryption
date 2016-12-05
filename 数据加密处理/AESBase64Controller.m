//
//  AESBase64Controller.m
//  数据加密处理
//
//  Created by mybook on 16/9/13.
//  Copyright © 2016年 石塔Mr.GC. All rights reserved.
//

#import "AESBase64Controller.h"


#define KEYSTRING @"AESBase64ControllerString"

//#define Iv          @"1234567890123456" //偏移量,可自行修改

//#define KEY         @"NSUTF8StringEnco" //key，可自行修改

@interface AESBase64Controller ()

@property (weak, nonatomic) IBOutlet UILabel *encryptLab;
@property (weak, nonatomic) IBOutlet UILabel *decryptLab;

@end

@implementation AESBase64Controller

/**
 #pragma mark - base64
 
 + (NSString*)encodeBase64String:(NSString *)input;
 + (NSString*)decodeBase64String:(NSString *)input;
 
 
 + (NSString*)encodeBase64Data:(NSData *)data;
 + (NSString*)decodeBase64Data:(NSData *)data;
 
 
 #pragma mark - AES加密
 
 + (NSString*)AES128Encrypt:(NSString *)plainText;
 + (NSString*)AES128Decrypt:(NSString *)encryptText;
 */



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self encrypString];
    [self decryptstring];
}
/**
 *  AES+Base64加密
 */
- (void)encrypString
{
    self.encryptLab.text = [AESUtil AES128Encrypt:KEYSTRING];
}
/**
 *  AES+Base64解密
 */
- (void)decryptstring
{
    self.decryptLab.text = [AESUtil AES128Decrypt:self.encryptLab.text];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
