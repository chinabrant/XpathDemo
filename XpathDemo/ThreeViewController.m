//
//  ThreeViewController.m
//  XpathDemo
//
//  Created by brant on 2017/3/17.
//  Copyright © 2017年 brant. All rights reserved.
//

#import "ThreeViewController.h"

@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"three";
    
    NSLog(@"%@", self.navigationController.viewControllers);
}

// 如果navigation controller的堆栈里面已经有指定的viewController的个数大于等于2，则保留最后一个，其它的全部移除
+ (void)removeViewController:(Class)cls navigationController:(UINavigationController *)nav {
    NSMutableArray *arr = [[NSMutableArray alloc] initWithArray:nav.viewControllers];
    
    NSMutableArray *clsList = [[NSMutableArray alloc] init];
    for (UIViewController *vc in arr) {
        
        if ([vc isKindOfClass:cls]) {
            
            [clsList addObject:vc];
        }
    }
    
    if (clsList.count <= 1) {
        return;
    }
    
    [clsList removeLastObject];
    [arr removeObjectsInArray:clsList];
    nav.viewControllers = arr;
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
