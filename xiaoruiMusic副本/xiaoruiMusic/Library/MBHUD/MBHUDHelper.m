//
//  MBHUDHelper.m
//  
//
//  Created by ysk on 15/7/25.
//
//

#import "MBHUDHelper.h"

static MBProgressHUD* HUDView;

@implementation MBHUDHelper

+ (void)showWarningWithText:(NSString *)text
{
    [MBHUDHelper showWarningWithText:text delegate:nil];
}

+ (void)showWarningWithText:(NSString *)text delegate:(id<MBProgressHUDDelegate>)delegate
{
    UIWindow *window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    hud.delegate = delegate;
    hud.labelText = text;
    hud.mode = MBProgressHUDModeText;
    hud.dimBackground = NO;
    hud.margin = 12.f;
    [hud hide:YES afterDelay:2.0];
}

+ (void)showLoadingHUDView:(UIView*)view
{
    HUDView = [MBProgressHUD showHUDAddedTo:view animated:YES];
    HUDView.mode = MBProgressHUDModeIndeterminate;
    HUDView.margin = 18.f;
    HUDView.opacity = 0.55;
    HUDView.dimBackground = YES;
    HUDView.labelText = @"努力加载中";
    HUDView.minShowTime = 0.3;
    HUDView.labelFont = [UIFont boldSystemFontOfSize:14];
}

+ (void)showLoadingHUDView:(UIView*)view withText:(NSString *)text {
    HUDView = [MBProgressHUD showHUDAddedTo:view animated:YES];
    HUDView.mode = MBProgressHUDModeIndeterminate;
    HUDView.margin = 18.f;
    HUDView.opacity = 0.55;
    HUDView.dimBackground = YES;
    HUDView.labelText = text;
    HUDView.minShowTime = 0.3;
    HUDView.labelFont = [UIFont boldSystemFontOfSize:14];
}

+ (void)showLoadingHUDView:(UIView *)view OnlyWithText:(NSString *)text
{
    HUDView = [MBProgressHUD showHUDAddedTo:view animated:YES];
    HUDView.mode = MBProgressHUDModeText;
    HUDView.margin = 12.f;
    HUDView.opacity = 0.55;
    HUDView.dimBackground = NO;
    HUDView.labelText = text;
    HUDView.minShowTime = 0.3;
    HUDView.labelFont = [UIFont boldSystemFontOfSize:14];
    
}

+ (void)hideHUDView
{
    [HUDView hide:YES];
}


@end
