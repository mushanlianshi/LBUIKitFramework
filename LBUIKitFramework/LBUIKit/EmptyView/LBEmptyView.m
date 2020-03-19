//
//  LBEmptyView.m
//  VertifyDemo
//
//  Created by baletu on 2019/3/1.
//  Copyright © 2019 lb. All rights reserved.
//

#import "LBEmptyView.h"

@interface LBEmptyView ()

@property (nonatomic, strong) UIImageView * imageView;

@property (nonatomic, strong) UILabel * titleLab;

@property (nonatomic, strong) UILabel * detailLab;

@property (nonatomic, strong) UIView * contentView;

@property (nonatomic, strong) UIButton * actionBtn;

@end

@implementation LBEmptyView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self didIntitalize];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self didIntitalize];
    }
    return self;
}

/** 初始化一些设置 */
- (void)didIntitalize{
    _contentInset = UIEdgeInsetsMake(0, 20, 0, 20);
    _imageViewEdgeInset = UIEdgeInsetsMake(0, 0, 20, 0);
    _titleLabEdgeInset = UIEdgeInsetsMake(0, 0, 10, 0);
    _detailLabEdgeInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    _contentView = [[UIView alloc] init];
    [self addSubview:_contentView];
    
    _imageView = [[UIImageView alloc] init];
    _imageView.contentMode = UIViewContentModeCenter;
    [self.contentView addSubview:_imageView];
    
    _titleLab = [[UILabel alloc] init];
    _titleLab.textAlignment = NSTextAlignmentCenter;
    _titleLab.numberOfLines = 0;
    [self.contentView addSubview:_titleLab];
    
    _actionBtn = [[UIButton alloc] init];
    [_actionBtn addTarget:self action:@selector(actionButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    _actionBtn.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_actionBtn];
    
    _detailLab = [[UILabel alloc] init];
    _detailLab.textAlignment = NSTextAlignmentCenter;
    _detailLab.numberOfLines = 0;
    [self.contentView addSubview:_detailLab];
}

/** 重新布局 */
- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat contentW = [self sizeToFitContentView].width;
    CGFloat contentH = [self sizeToFitContentView].height;
    self.contentView.frame = CGRectMake(self.contentInset.left, CGRectGetHeight(self.bounds) / 2 - contentH / 2 - self.contentInset.top, contentW, contentH);
    
    CGFloat originalY = 0;
    if (!self.imageView.hidden) {
        [self.imageView sizeToFit];
        self.imageView.frame = CGRectMake(contentW / 2 - CGRectGetWidth(self.imageView.bounds) / 2 + self.imageViewEdgeInset.left, originalY + self.imageViewEdgeInset.top, CGRectGetWidth(self.imageView.bounds), CGRectGetHeight(self.imageView.bounds));
        originalY += self.imageViewEdgeInset.top + CGRectGetHeight(self.imageView.bounds) + self.imageViewEdgeInset.bottom;
    }
    
    if (!self.titleLab.hidden) {
        originalY += self.titleLabEdgeInset.top;
        CGFloat titleW = contentW - self.titleLabEdgeInset.left - self.titleLabEdgeInset.right;
        CGFloat titleH = [self.titleLab sizeThatFits:CGSizeMake(titleW, CGFLOAT_MAX)].height;
        self.titleLab.frame = CGRectMake(self.titleLabEdgeInset.left, originalY, contentW - self.titleLabEdgeInset.left + self.titleLabEdgeInset.right, titleH);
        originalY += titleH + self.titleLabEdgeInset.bottom;
    }
    
    if (!self.detailLab.hidden) {
        originalY += self.detailLabEdgeInset.top;
        CGFloat detailW = contentW - self.detailLabEdgeInset.left - self.titleLabEdgeInset.right;
        CGFloat detailH = [self.detailLab sizeThatFits:CGSizeMake(detailW, CGFLOAT_MAX)].height;
        self.detailLab.frame = CGRectMake(self.detailLabEdgeInset.left, originalY, detailW, detailH);
        originalY += detailH + self.titleLabEdgeInset.bottom;
        
        self.actionBtn.frame = self.detailLab.frame;
    }
}

/** 计算内容的size */
- (CGSize)sizeToFitContentView{
    CGFloat contentWidth = CGRectGetWidth(self.bounds) - self.contentInset.left - self.contentInset.right;
    CGFloat viewH = CGRectGetHeight(self.bounds);
    
    CGFloat contentHeight = 0;
    if (!self.imageView.hidden) {
        CGFloat imageH = [self.imageView sizeThatFits:CGSizeMake(contentWidth, viewH)].height + self.imageViewEdgeInset.top + self.imageViewEdgeInset.bottom;
        contentHeight += imageH;
    }
    
    if (!self.titleLab.hidden) {
        CGFloat titleH = [self.titleLab sizeThatFits:CGSizeMake(contentWidth, CGFLOAT_MAX)].height;
        contentHeight += titleH;
    }
    
    if (!self.detailLab.hidden) {
        CGFloat detailH = [self.detailLab sizeThatFits:CGSizeMake(contentWidth, CGFLOAT_MAX)].height;
        contentHeight += detailH;
    }
    contentHeight += self.contentInset.top - self.contentInset.bottom;
    
    return CGSizeMake(contentWidth, contentHeight);
}


- (void)actionButtonClicked{
    if (self.clickBlock) {
        self.clickBlock();
    }
}

#pragma mark - 设置内间距的
- (void)setImageViewEdgeInset:(UIEdgeInsets)imageViewEdgeInset{
    _imageViewEdgeInset = imageViewEdgeInset;
    [self setNeedsLayout];
}

- (void)setTitleLabEdgeInset:(UIEdgeInsets)titleLabEdgeInset{
    _titleLabEdgeInset = titleLabEdgeInset;
    [self setNeedsLayout];
}

- (void)setDetailLabEdgeInset:(UIEdgeInsets)detailLabEdgeInset{
    _detailLabEdgeInset = detailLabEdgeInset;
    [self setNeedsLayout];
}

- (void)setContentInset:(UIEdgeInsets)contentInset{
    _contentInset = contentInset;
    [self setNeedsLayout];
}

#pragma mark - setter method
- (void)setPleaceHolderImage:(UIImage *)pleaceHolderImage{
    _pleaceHolderImage = pleaceHolderImage;
    self.imageView.image = pleaceHolderImage;
    self.imageView.hidden = !pleaceHolderImage;
    [self setNeedsLayout];
}

- (void)setTipTitle:(NSString *)tipTitle{
    _tipTitle = tipTitle;
    self.titleLab.text = tipTitle;
    self.titleLab.hidden = !tipTitle;
    [self setNeedsLayout];
}

- (void)setTipDetail:(NSString *)tipDetail{
    _tipDetail = tipDetail;
    self.detailLab.text = tipDetail;
    self.detailLab.hidden = !tipDetail;
    [self setNeedsLayout];
}


@end
