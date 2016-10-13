# WZXAttributedLabel

# 如何使用
- import 'UITextView+WZXRTF.h'
- 执行`- (void)setAttributes:(NSArray <WZXAttributedModel * > *)attributes`

或者

- `[textView wzx_autoDetection]` 自动识别电话，链接.

# WZXRTFModel属性
| 属性名        | 简介           | 类型  |
| ------------- |:-------------:| -----:|
|text|文字|NSString|
|textColor|文字颜色|UIColor|
|backgroundColor|背景颜色|UIColor|
|font| 文字字体|UIFont|
|link|链接网址或id|NSString|
|lineColor|线的颜色(暂时无效)|UIColor|
|image|图片|UIImage|
|imageRect|图片位置|CGRect|
|font|文字字体|UIFont|
|link|链接网址或id|NSString|

# WZXAttributedDelegate代理方法

```objc
// 点击链接
- (BOOL)wzx_attributedLabelHasClicked:(NSString *)link;
```
