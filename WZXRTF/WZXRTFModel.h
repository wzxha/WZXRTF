//
//  WZXAttributedString.h
//  WZXAttributedString
//
//  Created by WzxJiang on 16/10/11.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

@interface WZXRTFModel : NSObject

// 文字
@property(nonatomic, copy)NSString * text;

// 文字颜色
@property(nonatomic, copy)UIColor * textColor;

// 背景颜色
@property(nonatomic, copy)UIColor * backgroundColor;

// 文字字体
@property(nonatomic, copy)UIFont * font;

// 点击事件link
@property(nonatomic, copy)NSString * link;

// 线的样式
@property(nonatomic, assign)CTUnderlineStyle lineStyle;

// 图片
@property(nonatomic, strong)UIImage * image;

// 图片位置
@property(nonatomic, assign)CGRect imageRect;

/** 线的颜色
 *  暂时无效
 */
@property(nonatomic, copy)UIColor * lineColor;

// 
@property(nonatomic, strong, readonly)NSMutableDictionary * attributes;

@end
