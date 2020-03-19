//
//  LBEmptyView.h
//  VertifyDemo
//
//  Created by baletu on 2019/3/1.
//  Copyright © 2019 lb. All rights reserved.
//

#import <UIKit/UIKit.h>
/** 占位图点击的方法 */
typedef void(^EmptyViewClickBlock)(void);

/**
 * 没有数据的占位图
 */
@interface LBEmptyView : UIView

@property (nonatomic, copy) EmptyViewClickBlock clickBlock;

/** 内容的内间距 */
@property (nonatomic, assign) UIEdgeInsets contentInset;

/** 图片的内间距 */
@property (nonatomic, assign) UIEdgeInsets imageViewEdgeInset;

/** 标题的内间距 */
@property (nonatomic, assign) UIEdgeInsets titleLabEdgeInset;

@property (nonatomic, assign) UIEdgeInsets detailLabEdgeInset;

@property (nonatomic, strong) UIImage * pleaceHolderImage;

@property (nonatomic, copy) NSString *tipTitle;

@property (nonatomic, copy) NSString *tipDetail;

/** 根据内容的大小  返回一个合适的size */
- (CGSize)sizeToFitContentView;

@end
