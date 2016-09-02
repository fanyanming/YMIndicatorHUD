//
//  YMIndicatorHUD.h
//  YMIndicatorHUD
//
//  Created by 彦明 on 16/9/1.
//  Copyright © 2016年 Yanming. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface YMIndicatorHUD : NSObject
+ (void)showSuccess;
+ (void)showMessage:(NSString *)message;
+ (void)showLoadingHUD;// cover the screen, stop touch events
+ (void)hide;

// Please set color before you show the view
+ (void)setBackgroundColor:(UIColor *)color;// Default is rgb: 74/255.0 74/255.0 74/255.0. Only effect on info icon view
+ (void)setForegroundColor:(UIColor *)color;// Default is rgb: 74/255.0 74/255.0 74/255.0. Only effect on info icon view
@end
