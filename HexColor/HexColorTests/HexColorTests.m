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
    [UIColor hex:@"#ffcfcfcf"];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
