//
//  LBViewController.m
//  LBUIKitFramework
//
//  Created by mushanlianshi on 03/19/2020.
//  Copyright (c) 2020 mushanlianshi. All rights reserved.
//

#import "LBViewController.h"
#import "BLTUI.h"

@interface LBViewController ()

@end

@implementation LBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
        
        UIButton *normalButton = [[UIButton alloc] initWithFrame:CGRectMake(80, 100, 230, 60)];
        [normalButton setTitle:@"快速初始化一个弹框" forState:UIControlStateNormal];
        normalButton.backgroundColor = [UIColor lightGrayColor];
        [normalButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [normalButton addTarget:self action:@selector(normalButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:normalButton];
        
        
        UIButton *textFieldButton = [[UIButton alloc] initWithFrame:CGRectMake(80, 200, 230, 60)];
        [textFieldButton setTitle:@"输入框的弹框" forState:UIControlStateNormal];
        textFieldButton.backgroundColor = [UIColor lightGrayColor];
        [textFieldButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [textFieldButton addTarget:self action:@selector(textFieldButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:textFieldButton];
        
        UIButton *customButton = [[UIButton alloc] initWithFrame:CGRectMake(80, 300, 230, 60)];
        [customButton setTitle:@"自定义view的feed样式弹框" forState:UIControlStateNormal];
        customButton.backgroundColor = [UIColor lightGrayColor];
        [customButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [customButton addTarget:self action:@selector(customButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:customButton];
        
        UIButton *moreButton = [[UIButton alloc] initWithFrame:CGRectMake(80, 400, 230, 60)];
        [moreButton setTitle:@"富文本可点击弹框" forState:UIControlStateNormal];
        moreButton.backgroundColor = [UIColor lightGrayColor];
        [moreButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [moreButton addTarget:self action:@selector(attributeContentClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:moreButton];
        
        UIButton *actionSheet = [[UIButton alloc] initWithFrame:CGRectMake(80, 500, 230, 60)];
        [actionSheet setTitle:@"actionSheet" forState:UIControlStateNormal];
        actionSheet.backgroundColor = [UIColor lightGrayColor];
        [actionSheet setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [actionSheet addTarget:self action:@selector(actionSheetButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:actionSheet];
        
        UIButton *systemButton = [[UIButton alloc] initWithFrame:CGRectMake(80, 600, 230, 60)];
        [systemButton setTitle:@"系统的弹框" forState:UIControlStateNormal];
        systemButton.backgroundColor = [UIColor lightGrayColor];
        [systemButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [systemButton addTarget:self action:@selector(systemButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:systemButton];
    
    [self testProgressView];
}

- (void)testProgressView{
    [LBProgressView appearance].tintColor = [UIColor grayColor];
       LBProgressView *progressView = [[LBProgressView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
       progressView.progress = 0;
       progressView.tag = 1000;
       progressView.borderFillOffset = 15;
       [self.view addSubview:progressView];
       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
           LBProgressView *progressView = [self.view viewWithTag:1000];
           [progressView setProgress:progressView.progress + 0.8 animated:YES];
       });
}

- (void)normalButtonClicked{
    BLTAlertController *alertView = [[BLTAlertController alloc] initWithTitle:@"标题" mesage:@"说明当前状态、提示用户解决方案，两行居中，超过两行文字左对齐" style:BLTAlertControllerStyleAlert cancelTitle:@"取消" cancelBlock:^(BLTAlertAction *cancelAction) {
        NSLog(@"LBLog cancel button clicked ======== %@", cancelAction.title);
    } sureTitle:@"确定" sureBlock:^(BLTAlertAction *sureAction) {
        NSLog(@"LBLog sure button clicked ======== %@ ", sureAction.title);
    }];
    [alertView showWithAnimated:YES];
}

- (void)textFieldButtonClicked{
    BLTAlertController *alertView = [BLTAlertController alertControllerWithTitle:@"标题单行" mesage:@"说明当前状态、提示用户解决方案，两行居中，超过两行文字左对齐" style:BLTAlertControllerStyleAlert];
    [alertView addTextFieldWithConfigurationHandler:^(BLTTextFieldView * _Nonnull textView) {
        textView.layer.cornerRadius = 5;
        textView.clipsToBounds = YES;
        textView.placeHolder = @"输入价格/其他";
        textView.frame = CGRectMake(CGRectGetMinX(textView.frame), CGRectGetMinY(textView.frame), CGRectGetWidth(textView.frame), 60);
        textView.tipTitle = @"请输入";
        textView.unitString = @"元";
    }];
    BLTAlertAction *cancelAction = [BLTAlertAction actionWithTitle:@"取消" style:BLTAlertActionStyleCancel handler:^(BLTAlertAction * _Nonnull action) {
        NSLog(@"LBLog alert action click %@", action.title);
    }];
    BLTAlertAction *sureAction = [BLTAlertAction actionWithTitle:@"确定" style:BLTAlertActionStyleDestructive handler:^(BLTAlertAction * _Nonnull action) {
        NSLog(@"LBLog alert action click %@", action.title);
    }];
    [alertView addRightTopCloseButtonHandler:^{
        
    }];
    [alertView addTitleImage:[UIImage imageNamed:@"titleImageIcon"]];
    [alertView addAction:cancelAction];
    [alertView addAction:sureAction];
    [alertView showWithAnimated:YES];
}

- (void)customButtonClicked{
    BLTAlertController *alertView = [BLTAlertController alertControllerWithTitle:@"标题单行" mesage:@"说明当前状态、提示用户解决方案，两行居中，超过两行文字左对齐 三行居左显示  三行居左显示三行居左显示 " style:BLTAlertControllerStyleFeedAlert];
    UIProgressView *progressView = [[UIProgressView alloc] init];
    progressView.frame = CGRectMake(0, 0, 200, 30);
    progressView.tintColor = [UIColor blueColor];
    progressView.trackTintColor = [UIColor lightGrayColor];
    progressView.progress = 0.6;
    [alertView addCustomView:progressView];
    
    BLTAlertAction *cancelAction = [BLTAlertAction actionWithTitle:@"取消" style:BLTAlertActionStyleDefault handler:^(BLTAlertAction * _Nonnull action) {
        NSLog(@"LBLog alert action click %@", action.title);
    }];
    BLTAlertAction *cancelAction2 = [BLTAlertAction actionWithTitle:@"取消2" style:BLTAlertActionStyleDefault handler:^(BLTAlertAction * _Nonnull action) {
        NSLog(@"LBLog alert action click %@", action.title);
    }];
    BLTAlertAction *sureAction = [BLTAlertAction actionWithTitle:@"确定" style:BLTAlertActionStyleDestructive handler:^(BLTAlertAction * _Nonnull action) {
        NSLog(@"LBLog alert action click %@", action.title);
    }];
    [alertView addTitleImage:[UIImage imageNamed:@"titleImage"]];
    [alertView addAction:cancelAction];
    [alertView addAction:cancelAction2];
    [alertView addAction:sureAction];
    [alertView addRightTopCloseButtonHandler:^{
        
    }];
    [alertView showWithAnimated:YES];
}

- (void)attributeContentClicked{
    
    BLTAlertController *alertView = [BLTAlertController alertControllerWithTitle:@"标题单行" mesage:@"说明当前状态、提示用户解决方案，两行居中，超过两行文字左对齐" style:BLTAlertControllerStyleAlert];
    BLTAlertAction *cancelAction = [BLTAlertAction actionWithTitle:@"取消" style:BLTAlertActionStyleCancel handler:^(BLTAlertAction * _Nonnull action) {
        NSLog(@"LBLog alert action click %@", action.title);
    }];
    BLTAlertAction *sureAction = [BLTAlertAction actionWithTitle:@"确定" style:BLTAlertActionStyleDestructive handler:^(BLTAlertAction * _Nonnull action) {
        NSLog(@"LBLog alert action click %@", action.title);
    }];
    NSString *str1 = @"可点击哦";
    NSString *str2 = @"测试可不可以点击服务费访问违法";
    NSString *str3 = @"点这里试试";
    NSString *str = [NSString stringWithFormat:@"%@%@%@",str1,str2,str3];
    NSRange range1 = [str rangeOfString:str1];
    NSRange range2 = [str rangeOfString:str2];
    NSRange range3 = [str rangeOfString:str3];
    
    NSMutableAttributedString *mastring = [[NSMutableAttributedString alloc] initWithString:str attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18.0f]}];
    [mastring addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:range1];
    [mastring addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:range2];
    [mastring addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:range3];
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSTextAlignmentCenter;
    [mastring addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(0, str.length)];
    alertView.alertContentAttributeString = mastring;
    __weak typeof (&*alertView)weakAlertView = alertView;
    [alertView addContentAttributeTapActionWithStrings:@[@"可点击哦",@"点这里试试"] tapHandler:^(NSString * _Nonnull string, NSRange range, NSInteger index) {
        NSLog(@"LBLog ---- alertView %@  %zd",string, index);
        [weakAlertView dismissWithAnimated:YES];
        [self attributeContentClicked];
    }];
    [alertView addAction:cancelAction];
    [alertView addAction:sureAction];
    [alertView showWithAnimated:YES];
    
}

- (void)actionSheetButtonClicked{
    BLTAlertController *alertView = [BLTAlertController alertControllerWithTitle:@"" mesage:@"" style:BLTAlertControllerStyleActionSheet];
    NSArray *titles = @[@"按钮1", @"按钮2", @"按钮3", @"按钮4"];
    for (NSString *title in titles) {
        BLTAlertAction *action = [BLTAlertAction actionWithTitle:title style:BLTAlertActionStyleDefault handler:^(BLTAlertAction * _Nonnull action) {
            NSLog(@"LBLog ---- alertView %@  ",action.title);
        }];
        [alertView addAction:action];
    }
    BLTAlertAction *cancelAction = [BLTAlertAction actionWithTitle:@"取消" style:BLTAlertActionStyleCancel handler:^(BLTAlertAction * _Nonnull action) {
        NSLog(@"LBLog ---- alertView %@  ",action.title);
    }];
    [alertView addAction:cancelAction];
    [alertView showWithAnimated:YES];
}

- (void)systemButtonClicked{
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"系统弹框" message:@"说明当前状态、提示用户解决方案，两行居中，超过两行文字左对齐" preferredStyle:UIAlertControllerStyleAlert];
    [alertView addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
    }];
    UIAlertAction *firstAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *secondAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *thirdAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertView addAction:firstAction];
    [alertView addAction:secondAction];
    [alertView addAction:thirdAction];
    [self presentViewController:alertView animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
