//
//  CurrencyUtil.h
//  数据加密处理
//
//  Created by mybook on 16/9/13.
//  Copyright © 2016年 石塔Mr.GC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


/**
 *  金额的最大长度
 */
#define kAmountMaxLength 10


/**
 *  金额格式化工具类
 */
@interface CurrencyUtil : NSObject

/**
 *  将单位分的字符串转换为单位元
 *
 *  @param amount 单位为分的数字字符串，字符串中只能包含数字
 *
 *  @return 单位元的字符串
 */
+ (NSString *)fenToYuan:(NSString *)amount;


/**
 *  将单位元的字符串转换为单位分
 *
 *  @param amount 单位为元的数字字符串，字符串中可以包含数字和小数点
 *
 *  @return 单位分的字符串
 */
+ (NSString *)yuanToFen:(NSString *)amount;


/**
 *  UITextField输入金额限制，如果是合法的金额，则允许输入
 *  合法规则：
 *  1、首位不能输入小数点；
 *  2、只能输入一个小数点；
 *  3、如果第二位是小数点，则第一位可以是0，否则不允许第一位为0；
 *  4、前两位不能都是0；
 *  5、小数点后只能输入两位；
 *  6、最后一位不能是小数点；
 *  7、输入长度不能超过kAmountMaxLength
 *
 *  @param string    输入的字符串
 *  @param range     输入字符串在原字符串中的位置
 *  @param textField UITextField实例
 *
 *  @return 输入合法则返回YES，否则返回NO
 */
+ (BOOL)formatCurrency:(NSString *)string range:(NSRange)range textField:(UITextField *)textField;


/**
 *  将数字转换为每三位用','分隔的字符串，精确到小数点后2位
 *
 *  @param number 输入的数字
 *
 *  @return 格式化后的字符串
 */
+ (NSString *)formatNumber:(double)number;


/**
 *  根据formatterStyle格式化字符串
 *
 *  @param number         输入的数字
 *  @param formatterStyle 格式化类型
 *
 *  @return 格式化后的字符串
 */
+ (NSString *)formatNumber:(double)number formatterStyle:(NSNumberFormatterStyle)formatterStyle;



/**
 *  将数字转换为每三位用','分隔的字符串，精确到小数点后2位
 *
 *  @param numberObject 输入的数字字符串或者数字对象
 *
 *  @return 格式化后的字符串
 */
+ (NSString *)formatNumberObject:(id)numberObject;


/**
 *  根据formatterStyle格式化字符串
 *
 *  @param numberObject   输入的数字
 *  @param formatterStyle 格式化类型
 *
 *  @return 格式化后的字符串
 */
+ (NSString *)formatNumberObject:(id)numberObject formatterStyle:(NSNumberFormatterStyle)formatterStyle;



/**
 *  金额转成中文大写
 *
 *  @param number 输入的数字字符串
 *
 *  @return 中文大写金额字符串
 */
+ (NSString *)convertToChineseNumber:(NSString *)number;


@end
