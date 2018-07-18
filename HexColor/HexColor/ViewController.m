//
//  ViewController.m
//  HexColor
//
//  Created by liwei on 2018/7/18.
//  Copyright © 2018年 liwei. All rights reserved.
//

#import "ViewController.h"
#import "UIColor+Hex.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIView *view1;
@property (nonatomic, weak) IBOutlet UIView *view2;
@property (nonatomic, weak) IBOutlet UIView *view3;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _view1.backgroundColor = [UIColor hex:@"#ff4500"];
    _view2.backgroundColor = [UIColor hex:@"#ffff4500"];
    _view3.backgroundColor = [UIColor hex:@"#4dff4500"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
