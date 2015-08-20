//
//  MusicViewController.m
//  xiaoruiMusic
//
//  Created by ald on 15/8/18.
//  Copyright (c) 2015年 xmj. All rights reserved.
//

#import "MusicViewController.h"
#import "DetailViewController.h"
@interface MusicViewController ()
{
    UITableView *musicerTV;
    
}
@end

@implementation MusicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    musicerTV = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStyleGrouped];
    musicerTV.delegate = self;
    musicerTV.dataSource = self;
    [self.view addSubview:musicerTV];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 2;
    }
    else if(section == 1)
    {
        return 3;
    }
    else if(section == 2)
    {
        return 3;
    }
    else
        return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString*identifer = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0) {
                cell.textLabel.text = @"陈哲逗比";
            }
            else
                cell.textLabel.text = @"华语组合";
            break;
            case 1:
            if (indexPath.row == 0) {
                cell.textLabel.text = @"日韩男歌手";
            }
            else if(indexPath.row == 1)
            {
                cell.textLabel.text = @"日韩女歌手";
            }
            else
            {
                cell.textLabel.text = @"日韩组合";
            }
            break;
            case 2:
            if (indexPath.row == 0) {
                cell.textLabel.text = @"欧美男歌手";
            }
            else if(indexPath.row == 1)
            {
               cell.textLabel.text = @"欧美女歌手";
            }
            else
            {
               cell.textLabel.text = @"欧美组合";
            }
            break;
            case 3:
               cell.textLabel.text = @"其他";
            break;
        default:
            break;
    }
    return  cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        if (indexPath.row == 1) {
            DetailViewController *DVC = [[DetailViewController alloc]init];
            [DVC setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:DVC animated:YES];
        
        }
    }

}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5.0;
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
