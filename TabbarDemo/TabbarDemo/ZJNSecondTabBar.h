//
//  ZJNSecondTabBar.h
//  TabbarDemo
//
//  Created by 朱佳男 on 2017/11/2.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ZJNSecondTabBarDelegate<NSObject>

@optional
-(void)secondTabbarPlusButtonClick;
@end
@interface ZJNSecondTabBar : UITabBar
@property (nonatomic ,weak)id<ZJNSecondTabBarDelegate>mySecondDelegate;
@end
