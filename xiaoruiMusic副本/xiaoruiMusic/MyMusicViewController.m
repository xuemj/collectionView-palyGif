//
//  MyMusicViewController.m
//  xiaoruiMusic
//
//  Created by ald on 15/8/18.
//  Copyright (c) 2015年 xmj. All rights reserved.
//

#import "MyMusicViewController.h"

@interface MyMusicViewController ()
{
    UITableView *myMusicTV;
}
@end

@implementation MyMusicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    myMusicTV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStyleGrouped];
    myMusicTV.delegate = self;
    myMusicTV.dataSource = self;
    [self.view addSubview:myMusicTV];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else if(section == 1)
    {
        return 3;
    }
    else
    {
        return 3;
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     static NSString *identfier= @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identfier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identfier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = @"全部歌曲";
            cell.detailTextLabel.text = @"280首";
            break;
            case 1:
            if (indexPath.row == 0) {
                cell.textLabel.text = @"我喜欢";
                cell.detailTextLabel.text = @"0首";
            }
            else if(indexPath.row == 1)
            {
                cell.textLabel.text = @"自建歌单";
            }
            else
                cell.textLabel.text = @"点歌记录";
            break;
            case 2:
            if (indexPath.row == 0) {
                cell.textLabel.text = @"下载歌曲";
                cell.detailTextLabel.text = @"1首";
            }
            else if(indexPath.row == 1)
            {
                cell.textLabel.text = @"最近播放";
                cell.detailTextLabel.text = @"30首";
            }
            else
            {
                cell.textLabel.text = @"iPod歌曲";
                cell.detailTextLabel.text = @"66首";
            }
            break;
        default:
            break;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击事件");

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 20.0;
    }
    else
        return 5.0;
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
