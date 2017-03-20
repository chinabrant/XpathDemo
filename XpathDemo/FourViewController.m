//
//  FourViewController.m
//  XpathDemo
//
//  Created by brant on 2017/3/17.
//  Copyright © 2017年 brant. All rights reserved.
//

#import "FourViewController.h"
#import "TwoViewController.h"

@interface FourViewController ()

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showTwo:(id)sender {
    
    Class cls = [TwoViewController class];
    UIViewController *vcc = nil;
    NSMutableArray *arr = [[NSMutableArray alloc] initWithArray:self.navigationController.viewControllers];
    for (UIViewController *vc in arr) {
        if ([vc isKindOfClass:cls]) {
            [arr removeObject:vc];
//            [arr addObject:vc];
            vcc = vc;
            break;
        }
    }
    
    self.navigationController.viewControllers = arr;
    [self.navigationController pushViewController:vcc animated:YES];
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
