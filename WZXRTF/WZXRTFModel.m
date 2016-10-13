//
//  WZXAttributedString.m
//  WZXAttributedString
//
//  Created by WzxJiang on 16/10/11.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import "WZXRTFModel.h"

@implementation WZXRTFModel

- (instancetype)init {
    if (self = [super init]) {
        [self setUp];
    }
    return self;
}

- (void)setUp {
    _attributes = [NSMutableDictionary dictionary];
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    [_attributes setObject:_textColor forKey:NSForegroundColorAttributeName];
}

- (void)setFont:(UIFont *)font {
    _font = font;
    [_attributes setObject:_font forKey:NSFontAttributeName];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    _backgroundColor = backgroundColor;
    [_attributes setObject:_backgroundColor forKey:NSBackgroundColorAttributeName];
}

- (void)setLineStyle:(CTUnderlineStyle)lineStyle {
    _lineStyle = lineStyle;
    [_attributes setObject:@(lineStyle) forKey:(NSString *)kCTUnderlineStyleAttributeName];
}

- (void)setLineColor:(UIColor *)lineColor {
    _lineColor = lineColor;
    [_attributes setObject:lineColor forKey:(NSString *)kCTUnderlineColorAttributeName];
}

- (void)setLink:(NSString *)link {
    _link = link;
    [_attributes setObject:[NSURL URLWithString:link] forKey:NSLinkAttributeName];
}

@end
