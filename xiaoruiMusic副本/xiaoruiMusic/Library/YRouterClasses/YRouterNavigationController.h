//
//  YRouterNavigationController.h
//  YRouter
//
//  Created by ysk on 15-5-27.
//  Copyright (c) 2015年 ysk666666. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+YRouterUIViewControllerCategory.h"

@interface YRouterNavigationController : UINavigationController

+ (void)setViewControllerName:(NSString *)className forURL:(NSString *)url;

- (id)initWithRootViewControllerWithURL:(NSURL *)url withTitle:(NSString * )title;

- (UIViewController *)viewControllerForURL:(NSURL *)url withQuery:(NSDictionary *)query;

- (void)openURLString:(NSString *)string withQuery:(NSDictionary *)query;

- (void)openURL:(NSURL *)url withQuery:(NSDictionary *)query;
- (void)openURL:(NSURL *)url withQuery:(NSDictionary *)query animate:(BOOL)animate;

- (void)popToViewControllerWithURL:(NSURL *)url;
- (void)popToViewControllerWithURL:(NSURL *)url animate:(BOOL)animate;

- (void)presentURL:(NSURL *)url withQuery:(NSDictionary *)query;
- (void)presentURL:(NSURL *)url withQuery:(NSDictionary *)query animate:(BOOL)animate;

@end
