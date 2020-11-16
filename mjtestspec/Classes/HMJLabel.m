//
//  HMJLabel.m
//  mjtestspec_Example
//
//  Created by scmios on 2020/11/13.
//  Copyright © 2020 MJHee. All rights reserved.
//

#import "HMJLabel.h"

@interface HMJLabel ()<CAAnimationDelegate>
{
    CAKeyframeAnimation * animation;
}
@property (nonatomic, strong) UILabel * label;

@property (nonatomic, strong) CAGradientLayer * gradientLayer;

@end

@implementation HMJLabel

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self createContent];
    }
    return self;
}
- (instancetype)init {
    if (self = [super init]) {
        [self createContent];
    }
    return self;
}
- (void)createContent {
    self.animationDuration = .2;
    
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    [self addSubview:self.label];
    
    self.gradientLayer = [CAGradientLayer layer];
    [self.layer addSublayer:self.gradientLayer];
    self.gradientLayer.colors = @[(__bridge id)[[UIColor redColor] CGColor], (__bridge id)[[UIColor lightGrayColor] CGColor]];
    self.gradientLayer.startPoint = CGPointMake(0, 0);
    self.gradientLayer.endPoint = CGPointMake(1, 1);
    self.gradientLayer.name = @"gradientLayer";
    self.gradientLayer.mask = self.label.layer;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    self.gradientLayer.frame = self.bounds;
    self.label.frame = self.gradientLayer.bounds;
    [self gradientLayerAddAnimation];
}
- (void)gradientLayerAddAnimation {
    animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"colors";
    animation.duration = self.animationDuration;
    animation.values = self.colors;
    animation.keyTimes = self.keyTimes;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.delegate = self;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [self.gradientLayer addAnimation:animation forKey:@"gradientLayerAddAnimation"];
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    CAAnimation *animation = [self.gradientLayer animationForKey:@"gradientLayerAddAnimation"];
    if ([anim isEqual:animation]) {
        [self.gradientLayer removeAnimationForKey:@"gradientLayerAddAnimation"];
    }
    if (flag && self.isRepeat) {
        [self gradientLayerAddAnimation];
    }
}
- (void)setText:(NSString *)text {
    self.label.text = text;
}
- (void)setTextAlignment:(NSTextAlignment)textAlignment {
    self.label.textAlignment = textAlignment;
}
- (void)setFont:(UIFont *)font {
    self.label.font = font;
}
- (void)setNumberOfLines:(NSInteger)numberOfLines {
    self.label.numberOfLines = numberOfLines;
}
- (void)setColors:(NSArray *)colors {
    self.gradientLayer.colors = colors;
}
@end
