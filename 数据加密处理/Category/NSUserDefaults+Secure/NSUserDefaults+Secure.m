//
//  NSUserDefaults+Secure.m
//  数据加密处理
//
//  Created by mybook on 16/9/13.
//  Copyright © 2016年 石塔Mr.GC. All rights reserved.
//

#import "NSUserDefaults+Secure.h"
#import "ThreeDES.h"
#import "GTMBase64.h"


@implementation NSUserDefaults (Secure)

#pragma mark - Read Accessors
- (NSArray *)secureArrayForKey:(NSString *)key
{
    id object = [self secureObjectForKey:key];
    
    if ([object isKindOfClass:[NSArray class]]) {
        
        return object;
    } else {
        
        return nil;
    }
}


- (BOOL)secureBoolForKey:(NSString *)key
{
    id object = [self secureObjectForKey:key];
    
    if ([object respondsToSelector:@selector(boolValue)]) {
        
        return [object boolValue];
        
    } else {
        
        return NO;
    }
}


- (NSData *)secureDataForKey:(NSString *)key
{
    id object = [self secureObjectForKey:key];
    
    if ([object isKindOfClass:[NSData class]]) {
        
        return object;
        
    } else {
        
        return nil;
    }
}


- (NSDictionary *)secureDictionaryForKey:(NSString *)key
{
    id object = [self secureObjectForKey:key];
    
    if ([object isKindOfClass:[NSDictionary class]]) {
        
        return object;
        
    } else {
        
        return nil;
    }
}


- (float)secureFloatForKey:(NSString *)key
{
    id object = [self secureObjectForKey:key];
    
    if ([object respondsToSelector:@selector(floatValue)]) {
        
        return [object floatValue];
        
    } else {
        
        return 0.0f;
    }
}


- (NSInteger)secureIntegerForKey:(NSString *)key
{
    id object = [self secureObjectForKey:key];
    
    if ([object respondsToSelector:@selector(intValue)]) {
        
        return [object intValue];
        
    } else {
        
        return 0;
    }
}


- (id)secureObjectForKey:(NSString *)key
{
    id object = [self _objectForKey:key];
    return object;
}


- (NSArray *)secureStringArrayForKey:(NSString *)key
{
    id object = [self secureObjectForKey:key];
    
    if ([object isKindOfClass:[NSArray class]]) {
        
        for (id child in object) {
            
            if (![child isKindOfClass:[NSString class]]) {
                
                return nil;
            }
        }
        
        return object;
        
    } else {
        
        return nil;
    }
}


- (NSString *)secureStringForKey:(NSString *)key
{
    id object = [self secureObjectForKey:key];
    
    if ([object isKindOfClass:[NSString class]]) {
        
        return object;
        
    } else if ([object respondsToSelector:@selector(stringValue)]) {
        
        return [object stringValue];
        
    } else {
        
        return nil;
    }
}


- (double)secureDoubleForKey:(NSString *)key
{
    id object = [self secureObjectForKey:key];
    
    if ([object respondsToSelector:@selector(doubleValue)]) {
        
        return [object doubleValue];
        
    } else {
        
        return 0.0f;
    }
}


#pragma mark - Write Accessors
- (void)setSecureBool:(BOOL)value forKey:(NSString *)key
{
    [self setSecureObject:[NSNumber numberWithBool:value] forKey:key];
}


- (void)setSecureFloat:(float)value forKey:(NSString *)key
{
    [self setSecureObject:[NSNumber numberWithFloat:value] forKey:key];
}


- (void)setSecureInteger:(NSInteger)value forKey:(NSString *)key
{
    [self setSecureObject:[NSNumber numberWithInteger:value] forKey:key];
}


- (void)setSecureObject:(id)value forKey:(NSString *)key
{
    if (value == nil || key == nil) {
        // Use non-secure method
        [self setObject:value forKey:key];
        
    } else if ([self _isValidPropertyListObject:value]) {
        NSString *hash = [self _encryptObject:value];
        if (hash != nil) {
            [self setObject:hash forKey:key];
        }
    }
}


- (void)setSecureDouble:(double)value forKey:(NSString *)key
{
    [self setSecureObject:[NSNumber numberWithDouble:value] forKey:key];
}


#pragma mark - Private Methods
- (BOOL)_isValidPropertyListObject:(id)object
{
    if ([object isKindOfClass:[NSData class]] || [object isKindOfClass:[NSString class]] ||
        [object isKindOfClass:[NSNumber class]] || [object isKindOfClass:[NSDate class]]) {
        return YES;
    } else if ([object isKindOfClass:[NSDictionary class]]) {
        for (NSString *key in object) {
            if (![self _isValidPropertyListObject:key]) {
                // Abort
                return NO;
            } else {
                id value = [object objectForKey:key];
                if (![self _isValidPropertyListObject:value]) {
                    // Abort
                    return NO;
                }
            }
        }
        return YES;
    } else if ([object isKindOfClass:[NSArray class]]) {
        for (id value in object) {
            if (![self _isValidPropertyListObject:value]) {
                // Abort
                return NO;
            }
        }
        return YES;
    } else if ([object isKindOfClass:[NSSet class]]) {
        
        for (id value in object) {
            if (![self _isValidPropertyListObject:value]) {
                // Abort
                return NO;
            }
        }
        return YES;
    } else {
        static NSString *format = @"*** -[NSUserDefaults setSecureObject:forKey:]: Attempt to insert non-property value '%@' of class '%@'.";
        NSLog(format, object, NSStringFromClass([object class]));
        return NO;
    }
}


- (id)_objectForKey:(NSString *)key
{
    NSString * encrypted = [self objectForKey:key];
    if (!encrypted) {
        return nil;
    }
    NSString * base64EncodeStr = [ThreeDES decryptString:encrypted];
    //NSLog(@"Base64 decrypted result: %@", base64EncodeStr);
    NSData *base64Decoded = [GTMBase64 decodeString:base64EncodeStr];
    id value = [NSKeyedUnarchiver unarchiveObjectWithData:base64Decoded];
    //NSLog(@"decrypted result: %@", value);
    return value;
}


- (NSString *)_encryptObject:(id)object
{
    
    // Copy object to make sure it is immutable
    object = [object copy];
    
    // Archive & Encrypt
    NSData *archivedData = [NSKeyedArchiver archivedDataWithRootObject:object];
    
    NSString *base64EncodeStr = [GTMBase64 stringByEncodingData:archivedData];
    NSString *encrypted = [ThreeDES encryptString:base64EncodeStr];
    return encrypted;
}

@end
