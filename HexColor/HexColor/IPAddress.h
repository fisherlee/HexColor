//
//  IPAddress.h
//  HexColor
//
//  Created by liwei on 2018/7/24.
//  Copyright © 2018年 liwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IPAddress : NSObject

+ (IPAddress *)shareInstance;
- (NSString *)getIPAddress:(BOOL)preferIPv4;
- (NSDictionary *)getIPAddresses;

@end
