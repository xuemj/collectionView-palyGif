//
//  DetailViewController.m
//  xiaoruiMusic
//
//  Created by ald on 15/8/18.
//  Copyright (c) 2015年 xmj. All rights reserved.
//

#import "DetailViewController.h"
#import "UIImageView+PlayGIF.h"
@interface DetailViewController ()
{
    UIImageView *bgView;
    UISlider *slider;
    UILabel *label1;
    UILabel *label2;
    UIButton *playBtn;
    UIButton *leftPlayBtn;
    UIButton *rightPlayBtn;

}
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"日韩女歌手";
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0,0,100, 44);
    [rightBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    rightBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [rightBtn setTitle:@"播放列表" forState:UIControlStateNormal ];
    [rightBtn addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    [self playView];
    
}
-(void)add
{

    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提醒" message:@"暂无播放列表" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles: nil];
    [alert show];

}
-(void)playView
{

    bgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT*0.78)];
    bgView.gifPath = [[NSBundle mainBundle]pathForResource:@"huoying.gif" ofType:nil];
    [bgView startGIF];
    [self.view addSubview:bgView];
    slider = [[UISlider alloc]initWithFrame:CGRectMake(20, bgView.bottom, WIDTH-40, HEIGHT*0.02)];
      [slider setThumbImage:[UIImage imageNamed:@"slider"] forState:UIControlStateNormal];
    [self.view addSubview:slider];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0,slider.bottom, WIDTH, HEIGHT*0.2)];
  
    UIImage *image = [UIImage imageNamed:@"bg"];
    view.layer.contents = (__bridge id)(image.CGImage);
    [self.view addSubview:view];
    label1 = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, 50, 20)];
    label1.text = @"00:00";
    [view addSubview:label1];
    label2 = [[UILabel alloc]initWithFrame:CGRectMake(WIDTH-55, 5, 50, 20)];
    label2.text = @"03:52";
    [view addSubview:label2];
    
    playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    playBtn.frame = CGRectMake(WIDTH*0.42,view.height*0.2 ,60, 60);
    [playBtn setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
    [playBtn addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:playBtn];
    leftPlayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftPlayBtn.frame = CGRectMake(WIDTH*0.2, view.height*0.28, 40, 40);
    [leftPlayBtn setImage:[UIImage imageNamed:@"left"] forState:UIControlStateNormal];
    [leftPlayBtn addTarget:self action:@selector(leftclick) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:leftPlayBtn];
    rightPlayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightPlayBtn.frame = CGRectMake(WIDTH*0.68, view.height*0.28, 40, 40);
    [rightPlayBtn setImage:[UIImage imageNamed:@"right"] forState:UIControlStateNormal];
    [rightPlayBtn  addTarget:self action:@selector(rightclick) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:rightPlayBtn];

}
-(void)play
{


}
-(void)leftclick
{

}
-(void)rightclick
{


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
