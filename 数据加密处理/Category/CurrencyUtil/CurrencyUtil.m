//
//  CurrencyUtil.m
//  数据加密处理
//
//  Created by mybook on 16/9/13.
//  Copyright © 2016年 石塔Mr.GC. All rights reserved.
//

#import "CurrencyUtil.h"
#import "NSString+Verification.h"
#import "StringUtil.h"

/**
 *  转大写金额函数
 *
 *  @param dest 转换结果字符串
 *  @param src  需要被转换的字符串
 *
 *  @return 转换结果字符串
 */
char * chineseFee(char * dest, const char * src)
{
    enum {
        
        START,                 //开始
        MINUS,                 //负号
        ZEROINT,               //0整数
        INTEGER,               //整数
        DECIMAL,               //小数点
        DECIMALfRACTION,       //小数位
        END,                   //结束
        ERROR                  //错误
        
    } status = START;
    
    
    struct {
        int minus;             //0为正，1为负
        int sizeInt;
        int sizeDecimal;
        int integer[10];
        int decimal[10];
    } feeInfo;
    
    
    char * NumberChar[] = { "零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖" };
    char* UnitChar[] = { "整", "圆", "拾", "佰","仟", "万", "拾", "佰", "仟", "亿",
        "拾", "佰", "仟", "万亿", "拾", "佰", "仟", "亿亿",
        "角", "分", "负", "人民币" };
    
    int i, j,size; // 循环变量
    int zeroTag = 0, // 0标志
    decZeroTag = 0;
    
    char * pDest = dest;
    const char * pSrc = src;
    
    int * pInt = feeInfo.integer;
    int * pDec = feeInfo.decimal;
    
    // 初始化
    feeInfo.sizeInt        = 0;
    feeInfo.sizeDecimal    = 0;
    feeInfo.minus          = 0;
    
    // 分析字符串
    while( 1 ) {
        
        switch ( *pSrc ) {
                
            case '-' :
                status = ( status == START ) ? MINUS : ERROR;
                feeInfo.minus = ( status == MINUS ) ? 1 : 0;
                break;
            case '1' :
            case '2' :
            case '3' :
            case '4' :
            case '5' :
            case '6' :
            case '7' :
            case '8' :
            case '9' :
            case '0' :
                //|| status == START ) )
                if (*pSrc == '0' && status == ZEROINT) {
                    
                    status = ERROR;
                    break;
                }
                
                if (status == MINUS || status == START || status == INTEGER) {
                    
                    if (*pSrc == '0' && ( status == MINUS || status == START)) {
                        
                        status = ZEROINT;
                        
                    } else {
                        
                        status = INTEGER;
                    }
                    
                    *pInt = (*pSrc) - 48;
                    ++pInt;
                    ++feeInfo.sizeInt;
                    
                } else if (status == DECIMAL || status == DECIMALfRACTION) {
                    
                    status = DECIMALfRACTION;
                    *pDec = (*pSrc) - 48;
                    ++pDec;
                    ++feeInfo.sizeDecimal;
                    
                } else {
                    
                    status =ERROR;
                }
                break;
                
            case '.' :
                status = (status == INTEGER || status == ZEROINT)
                ? DECIMAL : ERROR;
                break;
                
            case '\0' :
                status = (status == INTEGER || status == DECIMALfRACTION || status == ZEROINT) ? END : ERROR;
                break;
                
            default :
                status = ERROR;
        }
        
        
        if ( status == END ) {
            
            break;
        
        } else if (status == ERROR) {
            
            return NULL;
        }
        
        ++pSrc;
    }
    
    
    // 只有1位小数时，设置百分位为0，使下面代码不需要区分这两种情况
    if (feeInfo.sizeDecimal == 1) {
        
        feeInfo.decimal[ 1 ] = 0;
        ++feeInfo.sizeDecimal;
    }
    
    
    // 判断是否需要打印小数部分，有小数部且十分位和百分位不都为0
    // 需要打印小数部时，zeroTag设为0，否则设为1
    if (feeInfo.sizeDecimal == 0                                 // 没有小数
        || (!feeInfo.decimal[ 0 ] && !feeInfo.decimal[ 1 ]))   // 小数部都为0
        decZeroTag = 1;
    else
        decZeroTag = 0;
    
    //printf( "int size: %d    decimal size: %d\n", feeInfo.sizeInt, feeInfo.sizeDecimal );
    
    //    strcpy( pDest, UnitChar[ 21 ] );                  // 初始化目标字符串-人民币
    pDest[0]=0;
    if ( feeInfo.minus ) strcat( pDest, UnitChar[ 20 ] );    // 负号
    
    //处理整数部分
    size = feeInfo.sizeInt;
    
    for(i = 0; i < size; ++i) {
        
        j = size - i - 1 & 0x3;                              // j = 0时为段尾
        
        if (feeInfo.integer[i] == 0 && j) {               // 处理非段尾0
    
            zeroTag = 1;
            
        } else if (feeInfo.integer[i] == 0 && !j ) {          //处理段尾0
        
            if (feeInfo.sizeInt == 1 && decZeroTag )        //特殊处理个位0
                strcat( pDest, NumberChar[ feeInfo.integer[ i ] ] );
            
            if (feeInfo.sizeInt != 1 || decZeroTag )
                strcat(pDest, UnitChar[size - i] );
            
            zeroTag = 0;
            
        } else {                                                //处理非0

            if (zeroTag) {
                
                strcat(pDest, NumberChar[0] );
                zeroTag = 0;
            }
            
            strcat(pDest, NumberChar[feeInfo.integer[i]]);
            strcat(pDest, UnitChar[size - i]);
            if ( !j ) zeroTag = 0;                      //如果是段尾，设为非标志
        }
    }
    
    
    if (decZeroTag) {
        
        strcat( pDest, UnitChar[0]);//没有小数部，打印"整"字符
        
    } else {
        
        //十分位
        if (feeInfo.decimal[0]) {
            
            strcat(pDest, NumberChar[ feeInfo.decimal[0]] );
            strcat(pDest, UnitChar[ 18 ] );
            
        } else if (feeInfo.sizeInt != 1 || feeInfo.integer[0] ) {
            
            strcat(pDest, NumberChar[ feeInfo.decimal[0] ] );
        }
        
        //百分位不为0时
        if (feeInfo.decimal[1]) {
            
            strcat(pDest, NumberChar[feeInfo.decimal[1]]);
            strcat(pDest, UnitChar[19] );
        }
    }
    
    return dest;
}


@implementation CurrencyUtil

#pragma mark - Public Methods
#pragma mark 将单位分的字符串转换为单位元
+ (NSString *)fenToYuan:(NSString *)amount {
    
    if (![StringUtil isEmpty:amount] && [amount isPureInt]) {
        
        amount = [NSString stringWithFormat:@"%.2f", [amount longLongValue] / 100.f];
    }
    
    return amount;
}


#pragma mark 将单位元的字符串转换为单位分
+ (NSString *)yuanToFen:(NSString *)amount {
    
    if (![StringUtil isEmpty:amount] && ([amount isPureInt] || [amount isPureFloat])) {
        
        amount = [NSString stringWithFormat:@"%.0f", 100 * [amount doubleValue]];
    }
    
    return amount;
}


#pragma mark UITextField输入金额限制，如果是合法的金额，则允许输入
+ (BOOL)formatCurrency:(NSString *)string range:(NSRange)range textField:(UITextField *)textField {
    
    if (string == nil || string.length == 0) {
        return YES;
    }
    
    NSString * text = textField.text;
    NSUInteger dotLocation = [text rangeOfString:@"."].location;
    
    if ([@"." isEqualToString:string]) {
        
        // 如果输入的是小数点，判断是否是第一位以及是否已经有小数点，如果是的 ，不能输入
        if (0 == text.length || text.length == (kAmountMaxLength - 1)) {
            
            return NO;
        }
        
        if (NSNotFound != dotLocation) {
            
            return NO;
        }
    }
    
    
    if ([@"0" isEqualToString:string]) {
        
        // 如果输入的是0
        if (0 == range.location) {
            
            // 如果是第一位输入，判断第二位是否小数点，如果不是，不能输入
            if (text.length > 0) {
                if (![@"." isEqualToString:[text substringToIndex:1]]) {
                    return NO;
                }
            }
            
        } else if (1 == range.location) {
            
            // 如果是在第二位输入，判断第一位是否0
            if ([@"0" isEqualToString:[text substringToIndex:1]]) {
                return NO;
            }
        }
    }
    
    
    if (1 == range.location && ![@"." isEqualToString:string]) {
        
        // 如果输入的是第二位，切不是小数点，判断第一位是不是0，如果是0，则不能输入
        if ([@"0" isEqualToString:[text substringToIndex:1]]) {
            
            return NO;
        }
    }
    
    
    if (NSNotFound != dotLocation) {
        
        // 如果字符串中已经存在小数点，限制不能超过两位小数
        if (range.location > dotLocation) {
            
            // 如果输入字符在小数点后面
            if (range.location - dotLocation > 2) {
                return NO;
            }
            
        } else {
            
            // 如果输入字符在小数点前面
            if (text.length == (kAmountMaxLength - 1)) {
                
                return NO;
            }
        }
    }
    
    return YES;
}


#pragma mark 将数字中每三位用','分隔
+ (NSString *)formatNumber:(double)number {
    
    return [CurrencyUtil formatNumber:number formatterStyle:NSNumberFormatterCurrencyStyle];
}


#pragma mark 根据formatterStyle格式化字符串
+ (NSString *)formatNumber:(double)number formatterStyle:(NSNumberFormatterStyle)formatterStyle {

    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle: formatterStyle];
    [numberFormatter setCurrencySymbol:@""];
    
    NSString * numberAsString = [numberFormatter stringFromNumber:[NSNumber numberWithDouble:number]];
    
    return numberAsString;
    
}



#pragma mark 将数字中每三位用','分隔
+ (NSString *)formatNumberObject:(id)numberObject {
    
    return [self formatNumberObject:numberObject formatterStyle:NSNumberFormatterCurrencyStyle];
}


#pragma mark 根据formatterStyle格式化字符串
+ (NSString *)formatNumberObject:(id)numberObject formatterStyle:(NSNumberFormatterStyle)formatterStyle {
    
    if (![numberObject isKindOfClass:[NSString class]] && (![numberObject isKindOfClass:[NSNumber class]])) {
        
        return @"";
    }
    
    NSString * stringValue = nil;
    
    if ([numberObject isKindOfClass:[NSNumber class]]) {
        
        stringValue = [numberObject stringValue];
        
    } else {
        
        stringValue = (NSString *)numberObject;
    }
    
    if (![stringValue isPureFloat]) {
        return @"";
    }
    
    
    double amount = [stringValue doubleValue];
    
    return [self formatNumber:amount formatterStyle:formatterStyle];
}



#pragma mark 金额转成中文大写
+ (NSString *)convertToChineseNumber:(NSString *)number {
    
    if ([StringUtil isEmpty:number]) {
        
        return nil;
    }
    
    if (![number isPureFloat]) {
        return nil;
    }
    
    
    const char * src = [number cStringUsingEncoding:NSASCIIStringEncoding];
    char * dest= malloc(256);
    dest = chineseFee(dest, src);
    
    NSString * result = nil;
    
    if (dest != nil) {
        
        size_t length = strlen(dest);
        
        if (length < 256) {
            dest[length] = 0;
        }
        
        result = [NSString stringWithCString:dest encoding:NSUTF8StringEncoding];
        
    }
    
    free(dest);
    return result;
}

@end
