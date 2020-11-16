//
//  HMJLabel.h
//  mjtestspec_Example
//
//  Created by scmios on 2020/11/13.
//  Copyright © 2020 MJHee. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HMJLabel : UILabel

@property (nonatomic, strong) NSArray * colors;

/**
 示例：@[@(0.0), @(0.2), @(0.5), @(0.7), @(0.9), @(1.0)];
 */
@property (nonatomic, strong) NSArray * keyTimes;
/// 动画时间
@property (nonatomic, assign) NSTimeInterval animationDuration;

/**
 是否重复，默认是NO
 */
@property (nonatomic, assign) BOOL isRepeat;
@end

NS_ASSUME_NONNULL_END
