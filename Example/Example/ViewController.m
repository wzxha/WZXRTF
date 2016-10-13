//
//  ViewController.m
//  WZXAttributedLabel
//
//  Created by WzxJiang on 16/10/11.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import "ViewController.h"
#import "UITextView+WZXRTF.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITextView * textView1 = [UITextView new];
    textView1.frame = CGRectMake(10, 20, self.view.frame.size.width - 20, self.view.frame.size.height - 20);
    textView1.text = @"我的网址: http://www.wzxjiang.com 我的 www.wzx.com 18516312500";
    [textView1 wzx_autoDetection];
    [self.view addSubview:textView1];
    
    
    UITextView * textView2 = [UITextView new];
    textView2.frame = CGRectMake(10, 120, self.view.frame.size.width - 20, self.view.frame.size.height - 20);
    
    WZXRTFModel * model1 = [WZXRTFModel new];
    model1.text = @"sjkdhsakjhdjksahdjkashdjhsajkdhsajkdhkjashdkjashdjkashdjksahjkdhsajkdhksjahdjksahd，到处为";
    model1.textColor = [UIColor blackColor];
    model1.font = [UIFont boldSystemFontOfSize:20];

    WZXRTFModel * model2 = [WZXRTFModel new];
    model2.image = [UIImage imageNamed:@"IMG_8371.JPG"];
    model2.imageRect = CGRectMake(0, -3, 20, 20);

    WZXRTFModel * model3 = [WZXRTFModel new];
    model3.text = @"...[查看全文]";
    model3.textColor = [UIColor grayColor];
    model3.font = [UIFont boldSystemFontOfSize:10];
    model3.link = @"123";
    model3.lineStyle = kCTUnderlineStyleSingle;
    
    [textView2 wzx_setAttributes:@[model1, model2, model3]];
    [self.view addSubview:textView2];
    
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction {
    NSLog(@"URL.absoluteString: %@", URL.absoluteString);
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
