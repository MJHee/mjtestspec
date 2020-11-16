//
//  HMJViewController.m
//  mjtestspec
//
//  Created by MJHee on 11/13/2020.
//  Copyright (c) 2020 MJHee. All rights reserved.
//

#import "HMJViewController.h"
#import <mjtestspec/HMJLabel.h>

@interface HMJViewController ()

@end

@implementation HMJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //使用类方法创建
    CALayer *item = [CALayer layer];
    //使用对象方法创建
    //CALayer *item = [[CALayer alloc]init];
    item.frame = CGRectMake(40, 100, 100, 100);
    item.backgroundColor = [UIColor yellowColor].CGColor;
    [self.view.layer addSublayer:item];
    
    HMJLabel *label = [[HMJLabel alloc] initWithFrame:CGRectMake(15, 250, [UIScreen mainScreen].bounds.size.width - 30, 100)];
    label.animationDuration = .2;
    label.colors = @[(__bridge id)[[UIColor orangeColor] CGColor],(__bridge id)[[UIColor yellowColor] CGColor],(__bridge id)[[UIColor greenColor] CGColor], (__bridge id)[[UIColor blueColor] CGColor]];
    label.isRepeat = YES;
    label.keyTimes = @[@(0.0), @(0.2), @(0.4), @(0.6), @(0.8), @(1.0)];
    label.text = @"渐变色的文字文案展示，快来呀，我们的祖国是花园，花园的花朵真鲜艳！渐变色的文字文案展示，快来呀，我们的祖国是花园，花园的花朵真鲜艳！";
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
