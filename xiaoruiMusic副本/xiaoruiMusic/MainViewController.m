//
//  MainViewController.m
//  xiaoruiMusic
//
//  Created by ald on 15/8/18.
//  Copyright (c) 2015年 xmj. All rights reserved.
//

#import "MainViewController.h"
#import "BaseNagationViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BaseNagationViewController * myMusic = [[BaseNagationViewController alloc] initWithRootViewControllerWithURL:[NSURL URLWithString:@"xiaorui://MyMusicViewController"] withTitle:@"我的音乐"];

    
    BaseNagationViewController * select = [[BaseNagationViewController alloc] initWithRootViewControllerWithURL:[NSURL URLWithString:@"xiaorui://SelectViewController"] withTitle:@"精选"];
    
    
    BaseNagationViewController * music = [[BaseNagationViewController alloc] initWithRootViewControllerWithURL:[NSURL URLWithString:@"xiaorui://MusicViewController"] withTitle:@"乐库"];
   
    BaseNagationViewController * more = [[BaseNagationViewController alloc] initWithRootViewControllerWithURL:[NSURL URLWithString:@"xiaorui://MoreViewController"] withTitle:@"更多"];
    myMusic.tabBarItem.image = [UIImage imageNamed:@"myMusic"];
    myMusic.tabBarItem.selectedImage = [UIImage imageNamed:@"music_selected"];
    select.tabBarItem.image = [UIImage imageNamed:@"selected"];
    select.tabBarItem.selectedImage = [UIImage imageNamed:@"selected_selected"];
    music.tabBarItem.image = [UIImage imageNamed:@"store"];
    music.tabBarItem.selectedImage = [UIImage imageNamed:@"store_selected"];
    more.tabBarItem.image = [UIImage imageNamed:@"more"];
    more.tabBarItem.selectedImage = [UIImage imageNamed:@"more_selected"];
    self.viewControllers = @[myMusic,select,music,more];
    UITabBar * tabbar = self.tabBar;
    tabbar.tintColor = [UIColor whiteColor];
    tabbar.selectionIndicatorImage = [UIImage imageWithColor:[UIColor redColor] size:CGSizeMake(WIDTH/4,50)];
   
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12],NSForegroundColorAttributeName: kCommonTextColor} forState:UIControlStateNormal];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
