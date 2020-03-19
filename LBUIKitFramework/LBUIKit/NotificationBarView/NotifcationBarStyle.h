//
//  NotifcationBarStyle.h
//  Baletu
//
//  Created by wangwenbo on 2020/2/20.
//  Copyright © 2020 朱 亮亮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger,NotificationContentStyle){
    NotificationContentSingleLineStyle = 0,//单行显示
    NotificationContentMutilLineStyle,// 多行显示
    NotificationContentScrollStyle,//滚动显示
    
};
//渐变色方向
typedef NS_ENUM(NSInteger,GradientLayerDirection){
    GradientLayerDirectionLeftToRight = 0,//左到右
    GradientLayerDirectionTopToBottom,// 上到下
    GradientLayerDirectionInclined,//对角线
    
};
@interface NotifcationBarStyle : NSObject
// 整体的背景颜色
@property(nonatomic,strong)UIColor * barBackGroundColor;
// 整体的背景图片
@property(nonatomic,strong)UIImage * barBackGroundImage;

// 内容的字体
@property(nonatomic,strong)UIFont * contentFont;
// 内容 颜色
@property(nonatomic,strong)UIColor * contentColor;
// 换行  单行 或者 滚动
@property(nonatomic,assign)NSInteger notificationContentStyle;
//
@property(nonatomic,assign)NSTextAlignment textAlignment;
// 处理事件按钮 的字体
@property(nonatomic,strong)UIFont * handleBtnFont;
//字间距
@property(nonatomic,assign)CGFloat contentTextSpace;
//行间距
@property(nonatomic,assign)CGFloat contentLineSpace;
@property(nonatomic,assign)NSLineBreakMode lineBreakMode;
// 按钮 颜色
@property(nonatomic,strong)UIColor * handleBtnTitleColor;
//按钮的背景颜色
@property(nonatomic,strong)UIColor * handleBtnBackGroundColor;
// 按钮的圆角
@property(nonatomic,assign)CGFloat handleBtnCornerRadius;
//
@property(nonatomic,strong)UIColor * handleBtnBorderColor;
// 最右侧的按钮 是否是移除功能 默认是 移除
@property(nonatomic,assign)BOOL rightIsRemove;
// 默认的展示时间
@property(nonatomic,assign)CGFloat defaultShowTime;
@property(nonatomic,assign)BOOL autoDismiss;

@property(nonatomic,assign)CGFloat barCornerRadius;

// 渐变色
@property(nonatomic,strong)UIColor * gradientLayerOriginColor;
@property(nonatomic,strong)UIColor * gradientLayerEndColor;
@property(nonatomic,assign)GradientLayerDirection gradientDirection;
@end

NS_ASSUME_NONNULL_END
