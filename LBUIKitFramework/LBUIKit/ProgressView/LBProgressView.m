//
//  LBProgressView.m
//  VertifyDemo
//
//  Created by liu bin on 2020/2/24.
//  Copyright © 2020 lb. All rights reserved.
//

#import "LBProgressView.h"


@interface LBProgressViewLayer : CALayer

@property (nonatomic, strong) UIColor *fillColor;

@property (nonatomic, assign) CGFloat progress;

@property (nonatomic, assign) NSTimeInterval animationDuration;

@property (nonatomic, assign) BOOL shouldChangeProgressWithAnimation;

@property (nonatomic, assign) CGFloat borderFillOffset;

@end


@implementation LBProgressViewLayer

//加dynamic才能让自定义的属性支持动画
@dynamic fillColor;
@dynamic progress;
//加dynamic 防止动画中为0
@dynamic borderFillOffset;
- (instancetype)init{
    self = [super init];
    if (self) {
        self.shouldChangeProgressWithAnimation = YES;
    }
    return self;
}

/** 是否自动调用drawInContext方法的 */
+ (BOOL)needsDisplayForKey:(NSString *)key{
    if ([key isEqualToString:@"progress"]) {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

- (id<CAAction>)actionForKey:(NSString *)event{
    if ([event isEqualToString:@"progress"] && self.shouldChangeProgressWithAnimation) {
        //获取一个西东progress的动画  当然我们也可以使用透明度  等等的动画opacity
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:event];
        animation.fromValue = [self.presentationLayer valueForKey:event];
        animation.duration = self.animationDuration;
        return animation;
    }
    return [super actionForKey:event];
}

- (void)drawInContext:(CGContextRef)ctx{
    if (CGRectEqualToRect(self.bounds, CGRectZero)) {
        return;
    }
    CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    CGFloat raduis = MIN(center.x, center.y) - self.borderWidth - self.borderFillOffset;
    CGFloat startAngle = -M_PI_2;
    //防止只画最近的 导致画返的
    CGFloat endAngle = M_PI * 2 * self.progress + startAngle;
    CGContextSetFillColorWithColor(ctx, self.fillColor.CGColor);
    CGContextMoveToPoint(ctx, center.x, center.y);
    CGContextAddArc(ctx, center.x, center.y, raduis, startAngle, endAngle, 0);
    CGContextClosePath(ctx);
    CGContextFillPath(ctx);
    [super drawInContext:ctx];
}

- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    self.cornerRadius = CGRectGetHeight(self.bounds) / 2;
}

@end


static LBProgressView * progressViewAppearance;

@implementation LBProgressView (Appearance)

+ (void)initialize{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self appearance];
    });
}

+ (instancetype)appearance{
    if (!progressViewAppearance) {
        [self initAppearance];
    }
    return progressViewAppearance;
}

+ (void)initAppearance{
    progressViewAppearance = [[LBProgressView alloc] init];
    progressViewAppearance.tintColor = [UIColor blueColor];
    progressViewAppearance.backgroundColor = [UIColor clearColor];
    progressViewAppearance.progress = 0;
    progressViewAppearance.borderWidth = 1;
    progressViewAppearance.borderFillOffset = 0;
    progressViewAppearance.animationDuration = 0.3;
}

@end


@implementation LBProgressView

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self didInitialize];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self didInitialize];
        //处理IB设置不会触发tintColorDidChange  手动调用
        [self tintColorDidChange];
    }
    return self;
}

- (void)didInitialize{
    self.tintColor = progressViewAppearance.tintColor;
    self.backgroundColor = progressViewAppearance.backgroundColor;
    self.progress = progressViewAppearance.progress;
    self.animationDuration = progressViewAppearance.animationDuration;
    self.borderFillOffset = progressViewAppearance.borderFillOffset;
    self.borderWidth = progressViewAppearance.borderWidth;
    
    [self.layer setNeedsDisplay];
}

+ (Class)layerClass{
    return [LBProgressViewLayer class];
}



#pragma mark - set method
-(void)setProgress:(CGFloat)progress{
    [self setProgress:progress animated:NO];
}
- (void)setProgress:(CGFloat)progress animated:(BOOL)animated{
    _progress = fmin(progress, 1);
    _progress = fmax(0, _progress);
    self.progressLayer.shouldChangeProgressWithAnimation = animated;
    self.progressLayer.progress = progress;
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (void)setAnimationDuration:(CGFloat)animationDuration{
    _animationDuration = animationDuration;
    self.progressLayer.animationDuration = animationDuration;
}

- (void)setBorderWidth:(CGFloat)borderWidth{
    _borderWidth = borderWidth;
    self.progressLayer.borderWidth = borderWidth;
}

- (void)setBorderFillOffset:(CGFloat)borderFillOffset{
    _borderFillOffset = borderFillOffset;
    self.progressLayer.borderFillOffset = borderFillOffset;
}


- (void)tintColorDidChange{
    [super tintColorDidChange];
    self.progressLayer.borderColor = self.tintColor.CGColor;
    self.progressLayer.fillColor = self.tintColor;
}

- (LBProgressViewLayer *)progressLayer{
    return (LBProgressViewLayer *)self.layer;
}


@end




