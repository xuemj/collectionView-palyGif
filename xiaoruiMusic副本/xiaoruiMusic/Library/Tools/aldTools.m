//
//  aldTools.m
//  aldp2p
//
//  Created by ald on 15/7/29.
//  Copyright (c) 2015年 aldp2p. All rights reserved.
//

#import "aldTools.h"

@implementation aldTools
+ (NSString *)currentDevices{
    NSString *currentDevices = nil;
    
    int currentMode = ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO);
    if (currentMode == 1) {
        currentDevices = @"iPhone6";
        return currentDevices;
    }else{
        currentMode = ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO);
        if (currentMode == 1) {
            currentDevices =  @"iPhone5";
            return currentDevices;
        }else{
            currentMode = ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO);
            if (currentMode == 1) {
                currentDevices = @"iPhone4";
                return currentDevices;
            }else{
                currentMode = ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO);
                if (currentMode == 1) {
                    currentDevices = @"iPhone6P";
                    return currentDevices;
                }
            }
        }
    }
    return currentDevices;
}
//获取文字与字符混合的总字符数
+ (int)convertToInt:(NSString*)strtemp {
    int strlength = 0;
    NSStringEncoding gbkEncoding =CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    char* p = (char*)[strtemp cStringUsingEncoding:gbkEncoding];
    for (int i=0 ; i<[strtemp lengthOfBytesUsingEncoding:gbkEncoding] ;i++) {
        if (p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
    }
    return strlength;
}

//判断手机号
+ (BOOL)checkTel:(NSString *)tel{
    if (tel.length == 0) {//
        
        return NO;
    }
    // @"^((13[0-9])|(147)|(15[^4,\\D])|(18[0,5-9]))\\d{8}$"               ;
    NSString *regex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9])|(17[0-9]))\\d{8}$";
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    
    BOOL isMactch = [pred evaluateWithObject:tel];
    
    if (!isMactch) {
        
        return NO;
    }
    
    return isMactch;
}

//过滤数字
+ (BOOL)validateNumber:(NSString *) textString
{
    NSString* number=@"^[0-9]+$";
    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",number];
    return [numberPre evaluateWithObject:textString];
}

//图片裁剪
+ (UIImage *)croppedImage:(UIImage *)image

{
    if (image)
    {
        float min = MIN(image.size.width,image.size.height);
        CGRect rectMAX = CGRectMake((image.size.width-min)/2, (image.size.height-min)/2, min, min);
        
        CGImageRef subImageRef = CGImageCreateWithImageInRect(image.CGImage, rectMAX);
        
        UIGraphicsBeginImageContext(rectMAX.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextDrawImage(context, CGRectMake(0, 0, min, min), subImageRef);
        UIImage *viewImage = [UIImage imageWithCGImage:subImageRef];
        UIGraphicsEndImageContext();
        CGImageRelease(subImageRef);
        return viewImage;
    }
    
    return nil;
}

//特殊字符
+ (BOOL)specialEnglish:(NSString *)textString allowEnglish:(NSString *)english{
    
    //    NSCharacterSet *cs;
    if ([english isEqualToString:@""]) {//只允许输入英文和数字
        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"] invertedSet];
        NSString *filtered = [[textString componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        
        BOOL basic = [textString isEqualToString:filtered];
        
        return basic;
        
    }else{
        NSString *regex = @"[a-zA-Z0-9\u4e00-\u9fa5][a-zA-Z0-9\u4e00-\u9fa5]*";
        
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        
        return [pred evaluateWithObject:english];
    }
    
}
+(NSString*)zhuanhuan:(NSString*)phone
{
    NSString *s = [phone stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    
    return s;
}
@end
