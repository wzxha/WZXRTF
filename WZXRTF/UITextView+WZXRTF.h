//
//  UITextView+WZXAttributedLabel.h
//  Example
//
//  Created by WzxJiang on 16/10/13.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WZXRTFModel.h"


@interface UITextView (WZXRTF) 

- (void)wzx_setAttributes:(NSArray *)attributes;

- (void)wzx_autoDetection;

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL
         inRange:(NSRange)characterRange
     interaction:(UITextItemInteraction)interaction;
@end


@protocol WZXRTF <NSObject>

+ (NSDictionary<NSString *, id> *)wzx_imagePropertyMapper;

// tel link
+ (NSDictionary<NSString *, id> *)wzx_linkPropertyMapper;
@end
