//
//  UITextView+WZXAttributedLabel.m
//  Example
//
//  Created by WzxJiang on 16/10/13.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import "UITextView+WZXRTF.h"
#import <objc/message.h>

@implementation UITextView (WZXRTF)

- (void)wzx_setAttributes:(NSArray *)attributes {
    NSMutableAttributedString * attributedString = [NSMutableAttributedString new];
    for (WZXRTFModel * model in attributes) {
        if (model.image) {
            NSTextAttachment * attachment = [[NSTextAttachment alloc] init];
            attachment.image = model.image;
            attachment.bounds = model.imageRect;
            [attributedString appendAttributedString:[NSAttributedString attributedStringWithAttachment:attachment]];
            
            continue;
        }
        
        if (model.link) {
            self.linkTextAttributes = model.attributes;
            self.editable = NO;
        }
        
        [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:model.text attributes:model.attributes]];
    }
    
    [self setAttributedText: attributedString];
}

- (void)wzx_autoChange {
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString: self.text];
    
//    NSDictionary * imgMapper = [self wzx_getValueForClassSel:@"wzx_imagePropertyMapper"];
//    
//    for (NSString * imgMapperKey in imgMapper.allKeys) {
//        NSRange range = [self.text rangeOfString:imgMapperKey];
//        if (range != NSNotFound) {
//            attributedString add
//        }
//    }
    
    // link
    NSDictionary * linkMapper = [self wzx_getValueForClassSel:@"wzx_linkPropertyMapper"];
    
    if ([linkMapper[@"url"] boolValue]) {
        NSString * re = @"(((http|https|ftp)://)|(www.)){1}[a-zA-Z0-9]*(.){1}[a-zA-Z0-9]*((.){1}[a-zA-Z0-9]*)?";
        NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:re options:NSRegularExpressionCaseInsensitive error:nil];
        
        [regex enumerateMatchesInString:self.text options:NSMatchingReportCompletion range:NSMakeRange(0, self.text.length) usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
            [attributedString addAttribute:NSLinkAttributeName value:[self.text substringWithRange:result.range] range:result.range];
        }];
    }
    
    if ([linkMapper[@"tel"] boolValue]) {
        NSString * re = @"[0-9]{11}";
        NSRegularExpression * regex = [NSRegularExpression regularExpressionWithPattern:re options:NSRegularExpressionCaseInsensitive error:nil];
        
        [regex enumerateMatchesInString:self.text options:NSMatchingReportCompletion range:NSMakeRange(0, self.text.length) usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
            [attributedString addAttribute:NSLinkAttributeName value:[self.text substringWithRange:result.range] range:result.range];
        }];
    }
    
    

    
    [self setAttributedText:attributedString];
}

- (id)wzx_getValueForClassSel:(NSString *)selName {
    Class cls = [self class];
    if ([[self class] respondsToSelector:NSSelectorFromString(selName)]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        return [(id <WZXRTF>)cls performSelector:NSSelectorFromString(selName)];
#pragma clang diagnostic pop
    }
    return nil;
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction { return YES; }

+ (NSDictionary<NSString *, id> *)wzx_linkPropertyMapper {
    return @{@"url": @(1),
             @"tel": @(1)};
}
@end
