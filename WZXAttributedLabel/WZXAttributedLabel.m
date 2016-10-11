//
//  WZXAttributedLabel.m
//  WZXAttributedString
//
//  Created by WzxJiang on 16/10/11.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import "WZXAttributedLabel.h"
#import "WZXAttributedModel.h"

@interface WZXAttributedLabel() <UITextViewDelegate>

@end

@implementation WZXAttributedLabel

- (instancetype)init {
    if (self = [super init]) {
        self.delegate = self;
        self.editable = NO;
    }
    return self;
}

- (void)setAttributes:(NSArray *)attributes {
    _attributes = attributes;
    NSMutableAttributedString * attributedString = [NSMutableAttributedString new];
    for (WZXAttributedModel * model in attributes) {
        if (model.image) {
            NSTextAttachment * attachment = [[NSTextAttachment alloc] init];
            attachment.image = model.image;
            attachment.bounds = model.imageRect;
            [attributedString appendAttributedString:[NSAttributedString attributedStringWithAttachment:attachment]];
            
            continue;
        }
        
        if (model.link) {
            self.linkTextAttributes = model.attributes;
        }
        
        [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:model.text attributes:model.attributes]];
    }
    
    [self setAttributedText: attributedString];
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction {
    if (self.minorDelegate) {
        return [self.minorDelegate wzx_attributedLabelHasClicked:URL.absoluteString];
    }
    
    return YES;
}

@end
