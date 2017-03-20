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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // chengyu minjian  shenhua  huangdi  zhanzheng  wenhuagushi  lishirenwu mingren  yeshi  dangshi
    
    
    // http://www.gs5000.cn/gs/huangdi/shanggu/23949.html
    
    /*
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSArray *huangdi = @[@"shanggu", @"xsz", @"qinchao", @"hanchao",
                             @"liangjinhuangdi", @"nanbeichao", @"suichao", @"tangchao",
                             @"wudaishiguo", @"songchao", @"yuanchao", @"mingchao", @"qingchao"];
        
        for (int i = 0; i < 24850; i++) {
            for (int k = 0; k < huangdi.count; k++) {
                
                dispatch_async(self.queue, ^{
                    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.gs5000.cn/gs/huangdi/%@/%d.html", huangdi[k], i]]];
                    
                    TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                    NSArray *eles = [hpple searchWithXPathQuery:@"//div[@class='place']/a[3] | //div[@class='title']/h2 | //div[@class='content']/table[1]/tr/td"];
                    if (eles.count == 3) {
                        NSString *category, *title, *content;
                        category = ((TFHppleElement *) eles[0]).content;
                        title = ((TFHppleElement *) eles[1]).content;
                        content = ((TFHppleElement *) eles[2]).content;
                        if (title.length > 0 && content.length > 0) {
                            [[DBManager shareInstance] insert:category title:title content:content];
                        }
                        
                        NSLog(@"title: %@", title);
                        
                    }
                });
                
                
            }
        }
    });
     */
    
    // @"//div[@class='place']/a[1] | //div[@class='place']/a[2] | //div[@class='title']/h2 | //div[@class='content']/table[1]/tr/td";
    
    /*
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSArray *titles = @[@"chengyu", @"minjian", @"shenhua", @"lishirenwu", @"yeshi", @"dangshi"];
        for (int i = 0; i < 30000; i++) {
            for (int k = 0; k < titles.count; k++) {
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.gs5000.cn/gs/%@/%d.html", titles[k], i]]];
                
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//div[@class='place']/a[2] | //div[@class='title']/h2 | //div[@class='content']/table[1]/tr/td"];
                if (eles.count == 3) {
                    NSString *category, *title, *content;
                    category = ((TFHppleElement *) eles[0]).content;
                    title = ((TFHppleElement *) eles[1]).content;
                    content = ((TFHppleElement *) eles[2]).content;
                    if (title.length > 0 && content.length > 0) {
                        [[DBManager shareInstance] insert:category title:title content:content];
                    }
                    
                    break;
                    
                }

            }
           
            
            NSLog(@"i : %d", i);
        }
        
        NSLog(@"完成");
        
        
    });
     */
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

@end
