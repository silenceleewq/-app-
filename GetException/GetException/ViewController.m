//
//  ViewController.m
//  GetException
//
//  Created by slience on 2017/2/3.
//  Copyright © 2017年 Ninja. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSArray *arr = @[@"123", @"ccc"];
    for (NSInteger i = 0; i < 4; ++i) {
        NSLog(@"%@", arr[i]);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
