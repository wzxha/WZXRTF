//
//  ViewController.m
//  WZXAttributedLabel
//
//  Created by WzxJiang on 16/10/11.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import "ViewController.h"
#import "WZXAttributedLabel.h"

@interface ViewController () <WZXAttributedDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WZXAttributedLabel * label = [[WZXAttributedLabel alloc] init];
    label.frame = CGRectMake(10, 20, self.view.frame.size.width - 20, self.view.frame.size.height - 20);
    
    label.minorDelegate = self;
    
    WZXAttributedModel * model1 = [WZXAttributedModel new];
    model1.text = @"sjkdhsakjhdjksahdjkashdjhsajkdhsajkdhkjashdkjashdjkashdjksahjkdhsajkdhksjahdjksahd，到处为";
    model1.textColor = [UIColor blackColor];
    model1.font = [UIFont boldSystemFontOfSize:20];
    
    WZXAttributedModel * model2 = [WZXAttributedModel new];
    model2.image = [UIImage imageNamed:@"IMG_8371.JPG"];
    model2.imageRect = CGRectMake(0, -3, 20, 20);
    
    WZXAttributedModel * model3 = [WZXAttributedModel new];
    model3.text = @"...[查看全文]";
    model3.textColor = [UIColor grayColor];
    model3.font = [UIFont boldSystemFontOfSize:10];
    model3.link = @"123";
    model3.lineStyle = kCTUnderlineStyleSingle;
    
    [label setAttributes:@[model1, model2, model3]];
    [self.view addSubview:label];
}

- (BOOL)wzx_attributedLabelHasClicked:(NSString *)link {
    NSLog(@"%@", link);
    if ([link isEqualToString:@"http://www.baidu.com"]) {
        return YES;
    }
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
