//
//  Defines.h
//  xiaoruiMusic
//
//  Created by ald on 15/8/18.
//  Copyright (c) 2015年 xmj. All rights reserved.
//

#ifndef xiaoruiMusic_Defines_h
#define xiaoruiMusic_Defines_h
#define ScreenPointfromPixel(pixel)      ((1 / [UIScreen mainScreen].scale) * pixel)    //把像素数量转换成point
#define WIDTH ([[UIScreen mainScreen] bounds].size.width)    //屏幕的宽
#define HEIGHT ([[UIScreen mainScreen] bounds].size.height)  //屏幕的高

#pragma mark - UI Config
#define Pixel68 [UIFont systemFontOfSize:36]
#define Pixel60 [UIFont systemFontOfSize:32]
#define Pixel48 [UIFont systemFontOfSize:26]
#define Pixel46 [UIFont systemFontOfSize:25]
#define Pixel44 [UIFont systemFontOfSize:24]
#define Pixel42 [UIFont systemFontOfSize:23]
#define Pixel40 [UIFont systemFontOfSize:22]
#define Pixel38 [UIFont systemFontOfSize:21]
#define Pixel36 [UIFont systemFontOfSize:20]
#define Pixel34 [UIFont systemFontOfSize:18]
#define Pixel30 [UIFont systemFontOfSize:17]
#define Pixel28 [UIFont systemFontOfSize:15]
#define Pixel26 [UIFont systemFontOfSize:13]
#define Pixel24 [UIFont systemFontOfSize:12]
#define Pixel22 [UIFont systemFontOfSize:11]
#define Pixel20 [UIFont systemFontOfSize:10]
#define Pixel18 [UIFont systemFontOfSize:9]
#define Pixel16 [UIFont systemFontOfSize:8]
#define Pixel14 [UIFont systemFontOfSize:7]

#define PixelBold60 [UIFont boldSystemFontOfSize:32]
#define PixelBold50 [UIFont boldSystemFontOfSize:27]
#define PixelBold48 [UIFont boldSystemFontOfSize:26]
#define PixelBold46 [UIFont boldSystemFontOfSize:25]
#define PixelBold44 [UIFont boldSystemFontOfSize:24]
#define PixelBold42 [UIFont boldSystemFontOfSize:23]
#define PixelBold36 [UIFont boldSystemFontOfSize:20]
#define PixelBold34 [UIFont boldSystemFontOfSize:18]
#define PixelBold30 [UIFont boldSystemFontOfSize:17]
#define PixelBold28 [UIFont boldSystemFontOfSize:15]
#define PixelBold26 [UIFont boldSystemFontOfSize:13]
#define PixelBold24 [UIFont boldSystemFontOfSize:12]
#define PixelBold22 [UIFont boldSystemFontOfSize:11]
#define PixelBold20 [UIFont boldSystemFontOfSize:10]
#define PixelBold18 [UIFont boldSystemFontOfSize:9]

#pragma mark - color
//#define kTitleColor [UIColor colorWithString:@"#"]
#define kOrangeColor            [UIColor colorWithString:@"#ff6d3a"]    //普通常见的橘色
#define kCommonTextColor        [UIColor colorWithString:@"#666666"]    //普通文字的颜色
#define kCustomRedColor         [UIColor colorWithString:@"#dd2f22"]    //常见的红色
#define kSeprarateLineColor     [UIColor colorWithString:@"#e1e1e1"]    //常见的分割线颜色
#define kBaseBackgroundColor    [UIColor colorWithString:@"#f0f0f0"]    //常见的背景的颜色
#define kButtonBackgroundColor  [UIColor colorWithString:@"#fdc700"]
#define kCommonLightTextColor   [UIColor colorWithString:@"#a1a1a1"]    //比常见的灰色文字浅一个灰度
#endif
