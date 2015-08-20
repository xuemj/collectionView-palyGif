//
//  UIViewController+YRouterUIViewControllerCategory.h
//  YRouter
//
//  Created by ysk on 15-5-27.
//  Copyright (c) 2015年 ysk666666. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@class YRouterNavigationController;

@interface UIViewController (YRouterUIViewControllerCategory)

@property (strong, nonatomic) NSURL * url;
@property (unsafe_unretained, nonatomic) YRouterNavigationController * ynav;
@property (strong, nonatomic) NSDictionary * query;

- (id)initWithURL:(NSURL *)url query:(NSDictionary *)aQuery;

@end
