//
//  ZJNTabBar.h
//  TabbarDemo
//
//  Created by 朱佳男 on 2017/11/2.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZJNTabBar;

@protocol ZJNTabBarDelegate<NSObject>

@optional
-(void)tabBarPlusButtonClick:(ZJNTabBar *)tabBar;

@end

@interface ZJNTabBar : UITabBar
@property (nonatomic ,weak)id<ZJNTabBarDelegate>myDelegate;
@end
