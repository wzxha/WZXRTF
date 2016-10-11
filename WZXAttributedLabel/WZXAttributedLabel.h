//
//  WZXAttributedLabel.h
//  WZXAttributedString
//
//  Created by WzxJiang on 16/10/11.
//  Copyright © 2016年 WzxJiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WZXAttributedModel.h"

@protocol WZXAttributedDelegate <NSObject>

@optional
// 点击链接
- (BOOL)wzx_attributedLabelHasClicked:(NSString *)link;

@end


@interface WZXAttributedLabel : UITextView

@property(nonatomic, copy)NSArray * attributes;

@property(nonatomic, weak)id <WZXAttributedDelegate> minorDelegate;

@end
