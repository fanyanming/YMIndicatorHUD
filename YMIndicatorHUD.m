//
//  YMIndicatorHUD.m
//  YMIndicatorHUD
//
//  Created by 彦明 on 16/9/1.
//  Copyright © 2016年 Yanming. All rights reserved.
//

#define DEFAULT_COLOR_BACKGROUND [UIColor colorWithRed:74/255.0 green:74/255.0 blue:74/255.0 alpha:1.0]
#define DEFAULT_COLOR_FOREGROUND [UIColor lightTextColor]

#import "YMIndicatorHUD.h"
#import "YMAnimationView.h"

@interface YMIndicatorHUD()
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIColor *foregroundColor;


@end
@implementation YMIndicatorHUD
UIView *_HUD = nil;
UIView *_successHUD = nil;
UIView *_infoHUD = nil;
UIView *_loadingHUD = nil;
UIColor *_backgroundColor = nil;
UIColor *_foregroundColor = nil;

+ (void)showLoadingHUD {
    CGRect frame = [UIScreen mainScreen].bounds;
    
    UIView *hudView = [[UIView alloc] initWithFrame:frame];
    hudView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
    [[UIApplication sharedApplication].keyWindow addSubview:hudView];
    _loadingHUD = hudView;
    
    // 添加菊花
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleWhiteLarge)];
    activityView.center = CGPointMake(frame.size.width * 0.5, frame.size.height * 0.5);
    activityView.color = [UIColor blackColor];
    [hudView addSubview:activityView];
    [activityView startAnimating];
    
}

+ (void)showSuccess {
    CGRect frame = [UIScreen mainScreen].bounds;
    UIView *HUDView = [[UIView alloc] initWithFrame:CGRectMake((frame.size.width - 80)/2.0, (frame.size.height - 80)/2.0, 80, 80)];
    HUDView.layer.cornerRadius = 5;
    HUDView.backgroundColor = [self backgroundColor];
    YMAnimationView *animationView = [[YMAnimationView alloc] initWithSuccessIconWithFrame:CGRectMake(15, 15, 50, 50)];
    [HUDView addSubview:animationView];
    [[UIApplication sharedApplication].keyWindow addSubview:HUDView];
    _successHUD = HUDView;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.5 animations:^{
            HUDView.alpha = 0;
        }];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [HUDView removeFromSuperview];
        });
        
    });
}

+ (void)showMessage:(NSString *)message {
    
    if (message.length == 0) {
        message = @"未知错误";
    }
    
    // 计算message的宽高
    CGRect messageFrame = [message boundingRectWithSize:CGSizeMake(MAXFLOAT, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil];
    CGFloat messageWidth = messageFrame.size.width;
    
    if (messageWidth + 6 < 100) {
        messageWidth = 100;
    }
    
    // hud container
    CGRect frame = [UIScreen mainScreen].bounds;
    UIView *HUDView = [[UIView alloc] initWithFrame:CGRectMake((frame.size.width - messageWidth - 6)/2.0, (frame.size.height - 100)/2.0, messageWidth + 6, 100)];
    HUDView.layer.cornerRadius = 5;
    HUDView.backgroundColor = [self backgroundColor];
    
    // content view
    YMAnimationView *animationView = [[YMAnimationView alloc] initWithInfoIconWithFrame:CGRectMake((messageWidth + 6 - 50)/2.0, 15, 50, 50) foregroundColor:[self foregroundColor]];
    [HUDView addSubview:animationView];
    [[UIApplication sharedApplication].keyWindow addSubview:HUDView];
    _infoHUD = HUDView;
    
    // 文字
    UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(3, CGRectGetMaxY(animationView.frame) + 5, messageWidth, 20)];
    messageLabel.textAlignment = NSTextAlignmentCenter;
    messageLabel.text = message;
    messageLabel.textColor = [self foregroundColor];
    messageLabel.font = [UIFont systemFontOfSize:14];
    [HUDView addSubview:messageLabel];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.5 animations:^{
            HUDView.alpha = 0;
        }];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [HUDView removeFromSuperview];
        });
        
    });
}

// lazy load
+ (UIColor *)backgroundColor {
    if (_backgroundColor == nil) {
        _backgroundColor = DEFAULT_COLOR_BACKGROUND;
    }
    return _backgroundColor;
}

+ (UIColor *)foregroundColor {
    if (_foregroundColor == nil) {
        _foregroundColor = DEFAULT_COLOR_FOREGROUND;
    }
    return _foregroundColor;
}

+ (void)hide {
    [UIView animateWithDuration:0.5 animations:^{
        _successHUD.alpha = 0;
        _loadingHUD.alpha = 0;
        _infoHUD.alpha = 0;
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_successHUD removeFromSuperview];
        [_infoHUD removeFromSuperview];
        [_loadingHUD removeFromSuperview];
    });
    
}

+ (void)setBackgroundColor:(UIColor *)color {
    _backgroundColor = color;
}

+ (void)setForegroundColor:(UIColor *)color {
    _foregroundColor = color;
}
@end
