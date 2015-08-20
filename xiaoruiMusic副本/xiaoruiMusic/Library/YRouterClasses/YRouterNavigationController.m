//
//  YRouterNavigationController.m
//  YRouter
//
//  Created by ysk on 15-5-27.
//  Copyright (c) 2015年 ysk666666. All rights reserved.
//

#import "YRouterNavigationController.h"

@interface YRouterNavigationController ()

@end

@implementation YRouterNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - init
- (id)initWithRootViewControllerWithURL:(NSURL *)url withTitle:(NSString * )title
{
    self = [super init];
    if (self) {
        UIViewController * rootVC = [self viewControllerForURL:url withQuery:nil];
        rootVC.title = title;
        self = [self initWithRootViewController:rootVC];
    }
    return self;
}

#pragma mark - config
+ (NSMutableDictionary *)config
{
    static NSMutableDictionary *config;
    if (nil == config) {
        config = [[NSMutableDictionary alloc] init];
    }
    return config;
}

+ (void)setViewControllerName:(NSString *)className forURL:(NSString *)url
{
    [[YRouterNavigationController config] setValue:className forKey:url];
}
                                     
- (UIViewController *)viewControllerForURL:(NSURL *)url withQuery:(NSDictionary *)query
{
    NSString * urlStr = [NSString stringWithFormat:@"%@://%@", [url scheme], [url host]];
    Class class = NSClassFromString([[YRouterNavigationController config] objectForKey:urlStr]);
    UIViewController * viewController = (UIViewController *)[[class alloc] initWithURL:url query:query];
    viewController.ynav = self;
    return viewController;
}

- (void)openURLString:(NSString *)string withQuery:(NSDictionary *)query
{
    [self openURL:[NSURL URLWithString:string] withQuery:query animate:YES];
}

- (void)openURL:(NSURL *)url withQuery:(NSDictionary *)query
{
    [self openURL:url withQuery:query animate:YES];
}

- (void)openURL:(NSURL *)url withQuery:(NSDictionary *)query animate:(BOOL)animate
{
    UIViewController * vc = [self viewControllerForURL:url withQuery:query];
    [vc setHidesBottomBarWhenPushed:YES];
    [self pushViewController:vc animated:animate];
}

- (void)popToViewControllerWithURL:(NSURL *)url animate:(BOOL)animate
{
    NSString * urlStr = [NSString stringWithFormat:@"%@://%@", [url scheme], [url host]];
    UIViewController * viewController = nil;
    Class class = NSClassFromString([[YRouterNavigationController config] objectForKey:urlStr]);
    for (UIViewController * vc in self.viewControllers) {
        if ([vc isKindOfClass:class]) {
            viewController = vc;
        }
    }
    if (viewController) {
        [self popToViewController:viewController animated:YES];
    }
}

- (void)popToViewControllerWithURL:(NSURL *)url
{
    [self popToViewControllerWithURL:url animate:YES];
}


- (void)presentURL:(NSURL *)url withQuery:(NSDictionary *)query animate:(BOOL)animate
{
    UIViewController * vc = [self viewControllerForURL:url withQuery:query];
    [self presentViewController:vc animated:animate completion:^{
        ;
    }];
}

- (void)presentURL:(NSURL *)url withQuery:(NSDictionary *)query
{
    [self presentURL:url withQuery:query animate:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
