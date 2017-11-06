//
//  ZJNSecondTabBar.m
//  TabbarDemo
//
//  Created by 朱佳男 on 2017/11/2.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import "ZJNSecondTabBar.h"
#import "UIView+Extension.h"
#define ZJNMargin 10
@interface ZJNSecondTabBar()
@property (nonatomic ,strong)UIButton *plusButton;
@end
@implementation ZJNSecondTabBar
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.translucent = NO;
        UIButton *plusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
        self.plusButton = plusBtn;
        [plusBtn addTarget:self action:@selector(tabBarPlusButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.plusButton];
    }
    return self;
}
-(void)tabBarPlusButtonClick:(UIButton *)button{
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.plusButton.size = CGSizeMake(self.plusButton.currentBackgroundImage.size.width, self.plusButton.currentBackgroundImage.size.height);
    self.plusButton.x = self.width/2-self.plusButton.width/2;
    self.plusButton.centerY = self.height/2;
    Class class = NSClassFromString(@"UITabBarButton");
    int btnIndex = 0;
    for (UIView *btn in self.subviews) {//遍历tabbar的子控件
        if ([btn isKindOfClass:class]) {//如果是系统的UITabBarButton，那么就调整子控件位置，空出中间位置
            //每一个按钮的宽度==tabbar的五分之一
            btn.width = self.width / 5;
    
            btn.x = btn.width * btnIndex;
    
            btnIndex++;
            //如果是索引是2(从0开始的)，直接让索引++，目的就是让消息按钮的位置向右移动，空出来发布按钮的位置
            if (btnIndex == 2) {
                btnIndex++;
            }
        }
    }
    [self bringSubviewToFront:self.plusButton];
}
//重写hittest方法
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    if (self.isHidden == NO) {
        CGPoint nowP = [self convertPoint:point toView:self.plusButton];
        if ([self.plusButton pointInside:nowP withEvent:event]) {
            return self.plusButton;
        }else{
            return [super hitTest:point withEvent:event];
        }
        
    }else{
        return [super hitTest:point withEvent:event];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
