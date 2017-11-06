//
//  ZJNTabBarViewController.m
//  TabbarDemo
//
//  Created by 朱佳男 on 2017/11/2.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import "ZJNTabBarViewController.h"
#import "ZJNTabBar.h"
@interface ZJNTabBarViewController ()<ZJNTabBarDelegate>

@end

@implementation ZJNTabBarViewController
+(void)initialize{
    UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    NSMutableDictionary *normalDic = [NSMutableDictionary dictionary];
    NSMutableDictionary *selectedDic = [NSMutableDictionary dictionary];
    normalDic[NSForegroundColorAttributeName] = [UIColor whiteColor];
    normalDic[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    
    selectedDic[NSForegroundColorAttributeName] = [UIColor redColor];
    selectedDic[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    
    [tabBarItem setTitleTextAttributes:normalDic forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:selectedDic forState:UIControlStateSelected];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpAllChildView];
    //创建自己的tabbar 然后利用kvc将自己的tabbar和系统的tabbar替换一下
    ZJNTabBar *tabBar = [[ZJNTabBar alloc]init];
    tabBar.myDelegate = self;
    [self setValue:tabBar forKey:@"tabBar"];
    // Do any additional setup after loading the view.
}
-(void)setUpAllChildView{
    //楼盘
    UIViewController *premisesVC = [[UIViewController alloc] init];
    [self addChildViewController:premisesVC andTitle:@"楼盘" andImageName:@"lp_h" andSelectedImage:@"lp_l"];
    
    //供求
    UIViewController *demandVC = [[UIViewController alloc] init];
    [self addChildViewController:demandVC andTitle:@"需求" andImageName:@"xq_h" andSelectedImage:@"xq_l"];
    
    UIViewController *releaseVC = [[UIViewController alloc]init];
    [self addChildViewController:releaseVC andTitle:@"" andImageName:@"" andSelectedImage:@""];
    //消息
    UIViewController *messageVC = [[UIViewController alloc] init];
    [self addChildViewController:messageVC andTitle:@"消息" andImageName:@"xx_h" andSelectedImage:@"xx_l"];
    
    //我的
    UIViewController *mineVC = [[UIViewController alloc] init];
    [self addChildViewController:mineVC andTitle:@"我的" andImageName:@"wd_h" andSelectedImage:@"wd_l"];
}
//添加自控制器，设置标题，图片，和被选图片
-(void)addChildViewController:(UIViewController *)childViewController andTitle:(NSString *)title andImageName:(NSString *)imageName andSelectedImage:(NSString *)selectedImageName{
    
    childViewController.view.backgroundColor = [self randomColor];
    childViewController.tabBarItem.title = title;
    
    childViewController.tabBarItem.image = [[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    childViewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [self addChildViewController:childViewController];
    
}
-(void)tabBarPlusButtonClick:(ZJNTabBar *)tabBar{
    self.selectedIndex = 2;
}
- (UIColor *)randomColor
{
    CGFloat r = arc4random_uniform(256);
    CGFloat g = arc4random_uniform(256);
    CGFloat b = arc4random_uniform(256);
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
    
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
