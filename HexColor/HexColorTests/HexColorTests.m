//
//  HexColorTests.m
//  HexColorTests
//
//  Created by liwei on 2018/7/18.
//  Copyright © 2018年 liwei. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UIColor+Hex.h"

@interface HexColorTests : XCTestCase

@end

@implementation HexColorTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testHexColor {
    [UIColor hex:@"#8ccfcfcf"];
}

- (void)testHex
{
    NSString *hex = @"4D";
    if ([hex length] == 0) {
        return;
    }
    
    NSScanner *scanner = [NSScanner scannerWithString:hex];
    unsigned long long longlongValue;
    [scanner scanHexLongLong:&longlongValue];
    CGFloat value = [[NSNumber numberWithLongLong:longlongValue] floatValue];
    
    //XCTAssertEqual(115.f, value);
    CGFloat alpha = roundf((value/255.0)*100)*0.01;
    XCTAssertEqual(30.f, roundf(alpha*100));
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
