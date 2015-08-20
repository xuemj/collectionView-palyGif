//
//  MoreViewController.m
//  xiaoruiMusic
//
//  Created by ald on 15/8/18.
//  Copyright (c) 2015年 xmj. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()
{
    UITableView *moreTV;
}
@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    moreTV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStyleGrouped];
    moreTV.dataSource = self;
    moreTV.delegate = self;
    [self headerView];
    [self.view addSubview:moreTV];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
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
    else if(section == 2)
    {
        return 1;
    }
    else
        return 5;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifer = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifer];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = @"登陆TT";
            break;
        case 1:
            if (indexPath.row == 0) {
                cell.textLabel.text = @"偏好设置";
            }
            if (indexPath.row == 1) {
                cell.textLabel.text = @"TPlay";
            }
            else
            {
               cell.textLabel.text = @"定时开关";
            }
            break;
        case 2:
            cell.textLabel.text = @"更多精彩应用";
            break;
        case 3:
            if (indexPath.row == 0) {
                cell.textLabel.text = @"TMusic专属流量包";
                cell.detailTextLabel.text = @"超值特惠，从此放心听歌";
            }
            if (indexPath.row == 1) {
                cell.textLabel.text = @"邀请好友";
            }
            if (indexPath.row == 2) {
                cell.textLabel.text = @"给软件评分";
            }
            if (indexPath.row == 3) {
                cell.textLabel.text = @"占用空间大小";
            }
            if (indexPath.row == 4) {
                cell.textLabel.text = @"关于TMusic";
            }
            break;
        default:
            break;
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    else
        return 10;

}
-(void)headerView
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 80)];
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(40, 30, 100, 30);
    [btn1 setTitle:@"听歌识曲" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [view addSubview:btn1];
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(btn1.right+70, 30, 100, 30);
    [btn2 setTitle:@"笛音传歌" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [view addSubview:btn2];
    moreTV.tableHeaderView = view;
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
