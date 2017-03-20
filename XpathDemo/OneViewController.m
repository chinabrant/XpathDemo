//
//  OneViewController.m
//  XpathDemo
//
//  Created by brant on 2017/3/17.
//  Copyright © 2017年 brant. All rights reserved.
//

#import "OneViewController.h"
#import "UIView+BrDot.h"

@interface OneViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"one";
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 300, 200)];
    _label.br_backgroundColor([UIColor orangeColor])
    .br_alpha(0.8)
    .br_cornerRadius(100)
    .br_masksToBounds(YES)
    .br_borderColor([UIColor redColor])
    .br_borderWidth(1);
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
