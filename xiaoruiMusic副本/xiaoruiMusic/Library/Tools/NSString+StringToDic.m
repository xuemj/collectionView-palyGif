//
//  NSString+StringToDic.m
//  aldp2p
//
//  Created by ysk on 15/7/31.
//  Copyright (c) 2015年 aldp2p. All rights reserved.
//

#import "NSString+StringToDic.h"

@implementation NSString (StringToDic)
-(NSDictionary *)dictionaryFromJsonString {
    if (self == nil) {
        return nil;
    }
    
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

@end
