//
//  ZJNTabBar.m
//  TabbarDemo
//
//  Created by 朱佳男 on 2017/11/2.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import "ZJNTabBar.h"
#import "UIView+Extension.h"
#define ZJNMargin 10
@interface ZJNTabBar()
@property (nonatomic ,strong)UIButton *plusButton;
@end
@implementation ZJNTabBar
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
    if (self.myDelegate && [self.myDelegate respondsToSelector:@selector(tabBarPlusButtonClick:)]) {
        [self.myDelegate tabBarPlusButtonClick:self];
    }
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.plusButton.size = CGSizeMake(self.plusButton.currentBackgroundImage.size.width, self.plusButton.currentBackgroundImage.size.height);
    self.plusButton.x = self.width/2-self.plusButton.width/2;
    self.plusButton.centerY = self.height/2;
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
