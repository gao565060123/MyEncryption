//
//  NSUserDefaults+Secure.h
//  数据加密处理
//
//  Created by mybook on 16/9/13.
//  Copyright © 2016年 石塔Mr.GC. All rights reserved.
//  对NSUserDefaults存储的数据进行加密保存

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Secure)

/**
 * Read data from user defaults. If key doesn't exist, valid is YES and the function mimics
 * the return behavior of the respective non-secure method. Please note that the methods below
 * will always return the result, even if it is *NOT* secure. This is a change from previous versions
 * of Secure-NSUserDefaults. It is therefore necessary to check to figure out an appropriate consequence
 * for invalid defaults.
 */
- (NSArray *)secureArrayForKey:(NSString *)key;
- (BOOL)secureBoolForKey:(NSString *)key;
- (NSData *)secureDataForKey:(NSString *)key;
- (NSDictionary *)secureDictionaryForKey:(NSString *)key;
- (float)secureFloatForKey:(NSString *)key;
- (NSInteger)secureIntegerForKey:(NSString *)key;
- (id)secureObjectForKey:(NSString *)key;
- (NSArray *)secureStringArrayForKey:(NSString *)key;
- (NSString *)secureStringForKey:(NSString *)key;
- (double)secureDoubleForKey:(NSString *)key;

/**
 * Write data to user defaults. Only property list objects (NSData, NSString, NSNumber, NSDate, NSArray, NSDictionary)
 * are supported. Passing nil as either the value or key mimics the behavior of the non-secure method.
 */
- (void)setSecureBool:(BOOL)value forKey:(NSString *)key;
- (void)setSecureFloat:(float)value forKey:(NSString *)key;
- (void)setSecureInteger:(NSInteger)value forKey:(NSString *)key;
- (void)setSecureObject:(id)value forKey:(NSString *)key;
- (void)setSecureDouble:(double)value forKey:(NSString *)key;

@end
