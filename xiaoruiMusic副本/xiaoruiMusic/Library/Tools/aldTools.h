//
//  aldTools.h
//  aldp2p
//
//  Created by ald on 15/7/29.
//  Copyright (c) 2015年 aldp2p. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface aldTools : NSObject
//获取文字与字符混合的总字符数
+ (int)convertToInt:(NSString*)strtemp;

//判断手机号
+ (BOOL)checkTel:(NSString *)tel;

//过滤数字
+ (BOOL)validateNumber:(NSString *) textString;

//图片裁剪
+ (UIImage *)croppedImage:(UIImage *)image;

//输入英文
+ (BOOL)specialEnglish:(NSString *)textString allowEnglish:(NSString *)english;
//判断手机型号
+(NSString*)currentDevices;
//手机号转换
+(NSString*)zhuanhuan:(NSString*)phone;
@end
