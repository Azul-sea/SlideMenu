//
//  LeftSortsViewController.m
//  LGDeckViewController
//
//  Created by jamie on 15/3/31.
//  Copyright (c) 2015年 Jamie-Ling. All rights reserved.
//
#define kScreenWidth          [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight         [[UIScreen mainScreen] bounds].size.height


#import "LeftSortsViewController.h"
#import "AppDelegate.h"
#import "otherViewController.h"

@interface LeftSortsViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableview;

@end

@implementation LeftSortsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageview.image = [UIImage imageNamed:@"leftbackiamge"];
    [self.view addSubview:imageview];
    
    

    UITableView *tableview = [[UITableView alloc] init];
    self.tableview = tableview;
    tableview.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
//    tableview.frame = self.view.bounds;
    tableview.dataSource = self;
    tableview.delegate  = self;
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identifier = @"Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont systemFontOfSize:20.0f];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"收藏";
        cell.textLabel.font = [UIFont systemFontOfSize:15];
    } else if (indexPath.row == 1) {
        cell.textLabel.text = @"意见";
        cell.textLabel.font = [UIFont systemFontOfSize:15];
    } else if (indexPath.row == 2) {
        cell.textLabel.text = @"关于";
        cell.textLabel.font = [UIFont systemFontOfSize:15];
    }
    
    UILabel *laben = [[UILabel alloc] initWithFrame:CGRectMake(15, 38, kScreenWidth, 1)];
    laben.backgroundColor = [UIColor colorWithWhite:0.3 alpha:1];
    [cell.contentView addSubview:laben];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    otherViewController *vc = [[otherViewController alloc] init];
    [tempAppDelegate.LeftSlideVC closeLeftView];//关闭左侧抽屉
    
//    [self.navigationController pushViewController:vc animated:YES];
    [tempAppDelegate.mainNavigationController pushViewController:vc animated:NO];

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 250;
}

//返回显示头像和用户名的视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableview.frame.size.width, 180)];
    view.backgroundColor = [UIColor clearColor];
    
    UIImageView *imageview2 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 60, 110, 110)];
    imageview2.layer.cornerRadius = 55;//设置那个圆角的有多圆    0000
    imageview2.layer.borderWidth = 2;//设置边框的宽度，当然可以不要
    imageview2.layer.borderColor = [[UIColor redColor] CGColor];//设置边框的颜色
    imageview2.layer.masksToBounds = YES;
    imageview2.image = [UIImage imageNamed:@"1.jpg"];
    [view addSubview:imageview2];
    
    return view;
}
@end
