//
//  UIColor+Hex.h
//  HexColor
//
//  Created by liwei on 2018/7/18.
//  Copyright © 2018年 liwei. All rights reserved.
//

#import <UIKit/UIKit.h>

#define hex_color(S)         [UIColor hex:S]

@interface UIColor (Hex)

/**
 16进制web颜色 支持6位和8位显示
 param  hex： 6位： #CFCFCF，8位：#FFCFCFCF，前两位为透明度，后面6位表示颜色，同android。
 return UIColor
 */
+ (UIColor *)hex:(NSString *)hex;

@end
