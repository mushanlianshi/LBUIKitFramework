//
//  LBProgressView.h
//  VertifyDemo
//
//  Created by liu bin on 2020/2/24.
//  Copyright © 2020 lb. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 * 继承UIControl是为了progress改变我们可以发送valueChange event （UIControlEventValueChanged）
 * tintcolor来设置边框和c填充的颜色
 * backgroundColor 圆形的背景色
 */
@interface LBProgressView : UIControl

@property (nonatomic, assign) CGFloat progress;

/** 动画的时长  默认0.5秒 */
@property (nonatomic, assign) CGFloat animationDuration;

/** 边框 默认1 */
@property (nonatomic, assign) CGFloat borderWidth;

/** 边框和填充的内边距的间隔 默认0 */
@property (nonatomic, assign) CGFloat borderFillOffset;

/** 是否使用动画的 */
- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;

@end


@interface LBProgressView (Appearance)

+ (instancetype)appearance;

@end

