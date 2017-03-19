//
//  ViewController.m
//  XpathDemo
//
//  Created by brant on 2017/3/7.
//  Copyright © 2017年 brant. All rights reserved.
//

#import "ViewController.h"
#import <TFHpple.h>
#import "DBManager.h"

@interface ViewController ()

@property (nonatomic) dispatch_queue_t queue;

@property (nonatomic, copy) NSMutableArray *numbers;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // chengyu minjian  shenhua  huangdi  zhanzheng  wenhuagushi  lishirenwu mingren  yeshi  dangshi
    
    
    
//    http://www.gs5000.cn/gs/huangdi/mingchao/list_27_11.html
    // 皇帝
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 明朝 12页
        for (int i = 1; i < 2; i++) {
            NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/huangdi/mingchao/list_27_%d.html", i];
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
            TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
            NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
            for (TFHppleElement *ele in eles) {
                NSString *path = [ele objectForKey:@"href"];
                NSLog(@"path: %@", path);
            }
        }
        
        // 上古  3页
        for (int i = 1; i < 2; i++) {
            NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/huangdi/shanggu/list_158_%d.html", i];
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
            TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
            NSArray *eles = [hpple searchWithXPathQuery:@"//ul[@class='c1 ico2']/li/a"];
            for (TFHppleElement *ele in eles) {
                NSString *path = [ele objectForKey:@"href"];
                NSLog(@"path: %@", path);
            }
        }
        
        // 夏商周 5页
        for (int i = 1; i < 2; i++) {
            NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/huangdi/mingchao/list_8_%d.html", i];
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
            TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
            NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
            for (TFHppleElement *ele in eles) {
                NSString *path = [ele objectForKey:@"href"];
                NSLog(@"path: %@", path);
            }
        }
        
        // 秦朝 6页
        for (int i = 1; i < 2; i++) {
            NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/huangdi/mingchao/list_18_%d.html", i];
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
            TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
            NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
            for (TFHppleElement *ele in eles) {
                NSString *path = [ele objectForKey:@"href"];
                NSLog(@"path: %@", path);
            }
        }
    });
    
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSArray *titles = @[@"chengyu", @"minjian", @"shenhua", @"lishirenwu", @"yeshi", @"dangshi"];
//        for (int i = 0; i < 30000; i++) {
//            for (int k = 0; k < titles.count; k++) {
//                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.gs5000.cn/gs/%@/%d.html", titles[k], i]]];
//                
//                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
//                NSArray *eles = [hpple searchWithXPathQuery:@"//div[@class='place']/a[2] | //div[@class='title']/h2 | //div[@class='content']/table[1]/tr/td"];
//                if (eles.count == 3) {
//                    NSString *category, *title, *content;
//                    category = ((TFHppleElement *) eles[0]).content;
//                    title = ((TFHppleElement *) eles[1]).content;
//                    content = ((TFHppleElement *) eles[2]).content;
//                    if (title.length > 0 && content.length > 0) {
//                        [[DBManager shareInstance] insert:category title:title content:content];
//                    }
//                    
//                    break;
//                    
//                }
//
//            }
//           
//            
//            NSLog(@"i : %d", i);
//        }
//        
//        NSLog(@"完成");
//        
//        
//    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (dispatch_queue_t)queue {
    if (!_queue) {
        _queue = dispatch_queue_create("xxx", NULL);
    }
    
    return _queue;
}

- (NSMutableArray *)numbers {
    if (!_numbers) {
        _numbers = [[NSMutableArray alloc] init];
    }
    
    return _numbers;
}

@end
