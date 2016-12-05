//
//  NSUserDefaultsSecure.m
//  数据加密处理
//
//  Created by mybook on 16/9/13.
//  Copyright © 2016年 石塔Mr.GC. All rights reserved.
//

#import "NSUserDefaultsSecure.h"

@interface NSUserDefaultsSecure ()

@end

@implementation NSUserDefaultsSecure

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"%@",NSHomeDirectory());
    [self initUserDefaults];
}

- (void)initUserDefaults
{
    [self setArray];
    [self setBool];
    [self setFloat];
    [self setDouble];
    [self setInteger];

    [self setData];
    [self setString];
    //    [self setDictionary];  // 报错
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setArray
{
    NSArray *arr = @[@"1111111",@"2222222",@"33333333"];
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    [userdefaults setSecureObject:arr forKey:@"array"];
    NSLog(@"%@",[userdefaults secureArrayForKey:@"array"]);
}

- (void)setBool
{
    BOOL isLogin = NO;
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    [userdefaults setSecureBool:isLogin forKey:@"Login"];
    NSLog(@"%d",[userdefaults secureBoolForKey:@"Login"]);
}

- (void)setFloat
{
    float Float = 100;
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    [userdefaults setSecureFloat:Float forKey:@"Float"];
    NSLog(@"%f",[userdefaults secureFloatForKey:@"Float"]);
}

- (void)setDouble
{
    double Double = 100;
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    [userdefaults setSecureFloat:Double forKey:@"Double"];
    NSLog(@"%lf",[userdefaults secureDoubleForKey:@"Double"]);
}

- (void)setInteger
{
    NSInteger Integer = 100;
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    [userdefaults setSecureInteger:Integer forKey:@"Integer"];
    NSLog(@"%ld",[userdefaults secureIntegerForKey:@"Integer"]);
}

- (void)setDictionary
{
    NSDictionary *dic = [[NSDictionary alloc] init];
    [dic setValue:@"111111" forKeyPath:@"key"];
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    [userdefaults setSecureObject:dic forKey:@"diction"];
//    NSLog(@"%@",[userdefaults secureDictionaryForKey:@"diction"]);
}

- (void)setData
{
    NSData *data = [NSData data];
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    [userdefaults setSecureObject:data forKey:@"data"];
    NSLog(@"%@",[userdefaults secureDataForKey:@"data"]);
}

- (void)setString
{
    NSString *string = @"string";
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    [userdefaults setSecureObject:string forKey:@"string"];
    NSLog(@"%@",[userdefaults secureStringForKey:@"string"]);
}




///**
// * Read data
// */
//- (NSArray *)secureArrayForKey:(NSString *)key;
//- (BOOL)secureBoolForKey:(NSString *)key;
//- (float)secureFloatForKey:(NSString *)key;
//- (double)secureDoubleForKey:(NSString *)key;
//- (NSInteger)secureIntegerForKey:(NSString *)key;
//- (NSDictionary *)secureDictionaryForKey:(NSString *)key;
//- (id)secureObjectForKey:(NSString *)key;
//- (NSData *)secureDataForKey:(NSString *)key;





//- (NSArray *)secureStringArrayForKey:(NSString *)key;

//- (NSString *)secureStringForKey:(NSString *)key;



///**
// * Write data
// */
//- (void)setSecureObject:(id)value forKey:(NSString *)key;
//- (void)setSecureBool:(BOOL)value forKey:(NSString *)key;



//- (void)setSecureFloat:(float)value forKey:(NSString *)key;
//- (void)setSecureInteger:(NSInteger)value forKey:(NSString *)key;
//- (void)setSecureDouble:(double)value forKey:(NSString *)key;

@end
