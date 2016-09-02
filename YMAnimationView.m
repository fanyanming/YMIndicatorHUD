//
//  YMAnimationView.m
//  YMIndicatorHUD
//
//  Created by 彦明 on 16/9/1.
//  Copyright © 2016年 Yanming. All rights reserved.
//

#import "YMAnimationView.h"
@interface YMAnimationView()

@end
@implementation YMAnimationView

#pragma mark - info icon
- (instancetype)initWithInfoIconWithFrame:(CGRect)frame foregroundColor:(UIColor *)color{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        UIBezierPath *infoPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(25, 25) radius:25 startAngle:-M_PI_2 endAngle:M_PI_2 * 3 clockwise:YES];
        [infoPath moveToPoint:CGPointMake(25, 10)];
        [infoPath addLineToPoint:CGPointMake(25, 15)];
        
        [infoPath moveToPoint:CGPointMake(25, 21)];
        [infoPath addLineToPoint:CGPointMake(25, 41)];
        
        //
        CAShapeLayer *animationLayer = [CAShapeLayer layer];
        animationLayer.fillColor = [UIColor clearColor].CGColor;
        animationLayer.path = infoPath.CGPath;
        animationLayer.lineWidth = 3;
        animationLayer.strokeColor = color.CGColor;
        animationLayer.lineJoin = @"round";
        animationLayer.lineCap = @"round";
        [self.layer addSublayer:animationLayer];
        
        CABasicAnimation *basicAniamtion = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        basicAniamtion.duration = 0.75;
        basicAniamtion.fromValue = [NSNumber numberWithInteger:0];
        basicAniamtion.toValue = [NSNumber numberWithInteger:1];
        
        
        CAKeyframeAnimation *shakeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
        shakeAnimation.repeatCount = 2;
        shakeAnimation.values = @[@(-5),@(0),@(5),@(0)];
        shakeAnimation.duration = 0.25;
        shakeAnimation.beginTime = 0.75;
        shakeAnimation.speed = 1.5;
        CAAnimationGroup *animationGroup= [CAAnimationGroup animation];
        animationGroup.animations = @[basicAniamtion, shakeAnimation];
        animationGroup.duration = 0.75 + 0.34;
        [animationLayer addAnimation:animationGroup forKey:@"key"];
        
    }
    return self;

}

#pragma mark - success icon
- (instancetype)initWithSuccessIconWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        UIBezierPath *checkPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(25, 25) radius:25 startAngle:-M_PI endAngle:M_PI * 2 clockwise:YES];
        [checkPath moveToPoint:CGPointMake(8.79, 25.05)];
        [checkPath addLineToPoint:CGPointMake(19.19, 35)];
        [checkPath addLineToPoint:CGPointMake(40, 15)];

        
        CAShapeLayer *animationLayer = [CAShapeLayer layer];
        animationLayer.fillColor = [UIColor clearColor].CGColor;
        animationLayer.path = checkPath.CGPath;
        animationLayer.lineWidth = 3;
        animationLayer.strokeColor = [UIColor colorWithRed:65/255.0 green:178/255.0 blue:5/255.0 alpha:1.0].CGColor;
        animationLayer.lineJoin = @"round";
        animationLayer.lineCap = @"round";
        [self.layer addSublayer:animationLayer];
        
        CABasicAnimation *basicAniamtion = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        basicAniamtion.duration = 0.75;
        basicAniamtion.fromValue = [NSNumber numberWithInteger:0];
        basicAniamtion.toValue = [NSNumber numberWithInteger:1];
        [animationLayer addAnimation:basicAniamtion forKey:@"key"];

    }
    return self;
}



@end
