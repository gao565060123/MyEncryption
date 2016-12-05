//
//  StringUtil.h
//  数据加密处理
//
//  Created by mybook on 16/9/13.
//  Copyright © 2016年 石塔Mr.GC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringUtil : NSObject


/**
 *  判断字符串是否为空
 *
 *  @param string 判断的字符串
 *
 *  @return 判断结果
 */
+ (BOOL)isEmpty:(NSString *)string;

//
///**
// *  判断字符串是否是手机号码
// *
// *  @param mobileNumber 判断的字符串
// *
// *  @return 判断结果
// */
//+ (BOOL)checkMobileNumber:(NSString *)mobileNumber;


/**
 *  判断字符串是否是电话号码
 *
 *  @param telephoneNumber 判断的字符串
 *
 *  @return 判断结果
 */
+ (BOOL)checkTelephoneNumber:(NSString *)telephoneNumber;




/**
 *  检测是否是验证码
 *
 *  @param astr 验证码字符串
 *
 *  @return
 */
+ (BOOL)checkCode:(NSString *)astr;



/**
 *  检测是秘密
 *
 *  @param aStr 密码字符串
 *
 *  @return
 */
+ (BOOL)checkPwd:(NSString *)aStr;


/**
 *  检测是否是身份证号
 *
 *  @param IDCard 身份证号字符串
 *
 *  @return
 */
+ (BOOL)isValidateIDCard:(NSString *)IDCard;

/**
 *  浮点型数据四舍五入
 *
 *  @param format 保留两位小数  传入@"0.00";
 *  @param floatV 字符数据
 *
 *  @return 四舍五入保留两位后的字符串
 */
+(NSString *) decimalwithFormat:(NSString *)format  floatV:(float)floatV;


/**
 *  处理投资金额
 *
 *  @param amount 投资金额
 *
 *  @return 传出带单位的金额字符串(元，千，万)
 */
+(NSString *)dealInvestAmount:(double)amount;


/**
 *  处理投资份额
 *
 *  @param amount 投资金额
 *
 *  @return 传出带单位的金额字符串(元，千，万)
 */
+(NSString *)dealCreditorAmount:(NSInteger)amount;



/**
 *  格式化所有带标签的文本
 *
 *  @param html 带标签的字符串
 *
 *  @return 处理完成后不带标签的字符串
 */
+(NSString *)filterHTML:(NSString *)html;


@end
