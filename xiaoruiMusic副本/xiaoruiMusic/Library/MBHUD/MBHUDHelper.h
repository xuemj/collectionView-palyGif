//
//  MBHUDHelper.h
//  
//
//  Created by ysk on 15/7/25.
//
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD.h>

@interface MBHUDHelper : NSObject

+ (void)showWarningWithText:(NSString *)text;
+ (void)showWarningWithText:(NSString *)text delegate:(id<MBProgressHUDDelegate>)delegate;

+ (void)showLoadingHUDView:(UIView*)view;
+ (void)showLoadingHUDView:(UIView*)view withText:(NSString *)text;
+ (void)showLoadingHUDView:(UIView *)view OnlyWithText:(NSString *)text;
+ (void)hideHUDView;

@end
