//
//  TwoViewController.m
//  XpathDemo
//
//  Created by brant on 2017/3/17.
//  Copyright © 2017年 brant. All rights reserved.
//

#import "TwoViewController.h"
#import <objc/runtime.h>

@interface TwoViewController ()

@property (nonatomic) int count ;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"two";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _count += 1;
    
    NSLog(@" %d ", _count);
    
    for (UIViewController *vc in self.navigationController.viewControllers) {
        NSLog(@"%s", class_getName([vc class]));
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
