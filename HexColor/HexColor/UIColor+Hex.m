//
//  UIColor+Hex.m
//  HexColor
//
//  Created by liwei on 2018/7/18.
//  Copyright © 2018年 liwei. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

/**
 16进制web颜色 支持6位和8位显示
 param  hex： 6位： #CFCFCF，8位：#FFCFCFCF，前两位为透明度，后面6位表示颜色，同android。
 return UIColor
 */
+ (UIColor *)hex:(NSString *)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor blackColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    //if ([cString length] != 6) return [UIColor blackColor];
    
    // Separate into r, g, b substrings
    if ([cString length] == 6) {
        NSRange range;
        range.location = 0;
        range.length = 2;
        NSString *rString = [cString substringWithRange:range];
        
        range.location = 2;
        NSString *gString = [cString substringWithRange:range];
        
        range.location = 4;
        NSString *bString = [cString substringWithRange:range];
        
        // Scan values
        unsigned int r, g, b;
        [[NSScanner scannerWithString:rString] scanHexInt:&r];
        [[NSScanner scannerWithString:gString] scanHexInt:&g];
        [[NSScanner scannerWithString:bString] scanHexInt:&b];
        
        return [UIColor colorWithRed:((float) r / 255.0f)
                               green:((float) g / 255.0f)
                                blue:((float) b / 255.0f)
                               alpha:1.0f];
    }
    else if ([cString length] == 8) {
        NSRange range;
        range.location = 0;
        range.length = 2;
        NSString *aString = [cString substringWithRange:range];
        
        range.location = 2;
        NSString *rString = [cString substringWithRange:range];
        
        range.location = 4;
        NSString *gString = [cString substringWithRange:range];
        
        range.location = 6;
        NSString *bString = [cString substringWithRange:range];
        
        // Scan values
        unsigned int r, g, b;
        CGFloat alpha = [UIColor alphaHex:aString];
        [[NSScanner scannerWithString:rString] scanHexInt:&r];
        [[NSScanner scannerWithString:gString] scanHexInt:&g];
        [[NSScanner scannerWithString:bString] scanHexInt:&b];
        
        return [UIColor colorWithRed:((float) r / 255.0f)
                               green:((float) g / 255.0f)
                                blue:((float) b / 255.0f)
                               alpha:alpha];
    }
    else {
        return [UIColor whiteColor];
    }
}

#pragma mark - Android中颜色不透明度对应16进制值

+ (CGFloat)alphaHex:(NSString *)hex
{
    if ([hex length] == 0) {
        return 1;
    }
    
    NSScanner *scanner = [NSScanner scannerWithString:hex];
    unsigned long long llv;
    [scanner scanHexLongLong:&llv];
    CGFloat value = [[NSNumber numberWithLongLong:llv] floatValue];
    CGFloat alpha = roundf((value/255.0)*100)*0.01;
    
    return alpha;
}


//百分比-开头字母
//100% FF
//95% — F2
//90% — E6
//85% — D9
//80% — CC
//75% — BF
//70% — B3
//65% — A6
//60% — 99
//55% — 8C
//50% — 80
//45% — 73
//40% — 66
//35% — 59
//30% — 4D
//25% — 40
//20% — 33
//15% — 26
//10% — 1A
//5% — 0D
//0% — 00
+ (CGFloat)alphaValueAtHex:(NSString *)hex
{
    NSDictionary *dict = @{@"FF":@100,
                           @"F2":@95,
                           @"E6":@90,
                           @"D9":@85,
                           @"CC":@80,
                           @"BF":@75,
                           @"B3":@70,
                           @"A6":@65,
                           @"99":@60,
                           @"8C":@55,
                           @"73":@45,
                           @"66":@40,
                           @"59":@35,
                           @"4D":@30,
                           @"40":@25,
                           @"33":@20,
                           @"26":@15,
                           @"1A":@10,
                           @"0D":@5,
                           @"00":@0
                           };
    NSArray *allKeys = [dict allKeys];
    if (![allKeys containsObject:hex]) {
        return 1.0;
    }else {
        return [dict[hex] integerValue]/100.00;
    }
}

@end
