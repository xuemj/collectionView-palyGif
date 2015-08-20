//
//  UIViewController+YRouterUIViewControllerCategory.m
//  YRouter
//
//  Created by ysk on 15-5-27.
//  Copyright (c) 2015年 ysk666666. All rights reserved.
//

#import "UIViewController+YRouterUIViewControllerCategory.h"


@interface UIViewController ()

//@property(nonatomic,strong)UIBarButtonItem * backBarButton;

@end

@implementation UIViewController (YRouterUIViewControllerCategory)

static char kAssociatedQueryObjectKey;
static char kAssociatedYNavObjectKey;
static char kAssociatedURLObjectKey;

- (void)setQuery:(NSDictionary *)query
{
    objc_setAssociatedObject(self, &kAssociatedQueryObjectKey, query, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSDictionary *)query
{
    return objc_getAssociatedObject(self, &kAssociatedQueryObjectKey);
}

- (void)setYnav:(YRouterNavigationController *)ynav
{
    objc_setAssociatedObject(self, &kAssociatedYNavObjectKey, ynav, OBJC_ASSOCIATION_ASSIGN);
}

- (YRouterNavigationController *)ynav
{
    return objc_getAssociatedObject(self, &kAssociatedYNavObjectKey);
}

- (void)setUrl:(NSURL *)url
{
    objc_setAssociatedObject(self, &kAssociatedURLObjectKey, url, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSURL *)url
{
    return objc_getAssociatedObject(self, &kAssociatedURLObjectKey);
}


- (id)initWithURL:(NSURL *)url query:(NSDictionary *)aQuery
{
    self = [self initWithNibName:nil bundle:nil];
    if (self) {
        self.url = url;
        self.query = aQuery;
//        UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
//        [btn setBackgroundImage:[UIImage imageNamed:@"navigationbarBack.png"] forState:UIControlStateNormal];
//        [btn addTarget:self action:@selector(popToPreviousController) forControlEvents:UIControlEventTouchUpInside];
//        UIBarButtonItem * barBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
//        self.navigationItem.leftBarButtonItem = barBtn;
        
    }
    return self;
}

-(void)popToPreviousController
{

}

@end
