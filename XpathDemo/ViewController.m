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

/*
 
 名人count: 1298
 文化count: 2658
 战争count: 613
 皇帝 count: 861
 一级 count: 3414
 
 */
@interface ViewController ()

@property (nonatomic) dispatch_queue_t queue;

@property (nonatomic, copy) NSMutableArray *numbers;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // chengyu minjian  shenhua  huangdi  zhanzheng  wenhuagushi  lishirenwu mingren  yeshi  dangshi
    
    // 名人故事
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        {
        NSMutableArray *pathList = [[NSMutableArray alloc] init];
        
        // 名人名言  44页
        for (int i = 1; i < 45; i++) {
            NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/mingren/mrmy/list_118_%d.html", i];
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
            TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
            NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
            for (TFHppleElement *ele in eles) {
                NSString *path = [ele objectForKey:@"href"];
                [pathList addObject:path];
            }
        }
        
        // 名人读书 10
        for (int i = 1; i < 11; i++) {
            NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/mingren/mrds/list_119_%d.html", i];
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
            TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
            NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
            for (TFHppleElement *ele in eles) {
                NSString *path = [ele objectForKey:@"href"];
                [pathList addObject:path];
            }
        }
        
        // 现代名人 15
        for (int i = 1; i < 16; i++) {
            NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/mingren/xdmr/list_120_%d.html", i];
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
            TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
            NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
            for (TFHppleElement *ele in eles) {
                NSString *path = [ele objectForKey:@"href"];
                [pathList addObject:path];
            }
        }
        
        // 世界名人 46
        for (int i = 1; i < 47; i++) {
            NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/mingren/sjmr/list_121_%d.html", i];
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
            TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
            NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
            for (TFHppleElement *ele in eles) {
                NSString *path = [ele objectForKey:@"href"];
                [pathList addObject:path];
            }
        }
        
        // 世界富豪 11
        for (int i = 1; i < 12; i++) {
            NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/mingren/fuhao/list_148_%d.html", i];
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
            TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
            NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
            for (TFHppleElement *ele in eles) {
                NSString *path = [ele objectForKey:@"href"];
                [pathList addObject:path];
            }
        }
        
        // 名人幽默 22
        for (int i = 1; i < 23; i++) {
            NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/mingren/mrym/list_123_%d.html", i];
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
            TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
            NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
            for (TFHppleElement *ele in eles) {
                NSString *path = [ele objectForKey:@"href"];
                [pathList addObject:path];
            }
        }
        
        NSLog(@"名人count: %lu", (unsigned long)pathList.count);
        
        for (NSString *path in pathList) {
            
//            dispatch_async(self.queue, ^{
            
                [self getDataWithPath2:path];
//            });
            
        }
            
        }
        
        {
            NSMutableArray *pathList = [[NSMutableArray alloc] init];
            
            // 传统节日  22页
            for (int i = 1; i < 23; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/wenhuagushi/jieri/list_30_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 对联故事 13页 http://www.gs5000.cn/gs/wenhuagushi/duilian/list_157_2.html
            for (int i = 1; i < 14; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/wenhuagushi/duilian/list_157_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 文化常识 111页
            for (int i = 1; i < 112; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/wenhuagushi/changshi/list_33_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 文化典故 39 http://www.gs5000.cn/gs/wenhuagushi/diangu/list_37_2.html
            for (int i = 1; i < 40; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/wenhuagushi/diangu/list_37_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 文化名人 11
            for (int i = 1; i < 12; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/wenhuamr/list_34_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 古代廉政故事 8
            for (int i = 1; i < 9; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/wenhuagushi/gudaifanfuchangliangushi/list_40_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 科学技术 12
            for (int i = 1; i < 13; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/wenhuagushi/kexuejishu/list_38_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 禁忌 15
            for (int i = 1; i < 16; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/wenhuagushi/jinji/list_150_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 才女爱情故事 2
            for (int i = 1; i < 3; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/wenhuagushi/cnaq/list_111_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 天朝落日 2
            for (int i = 1; i < 3; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/wenhuagushi/tclr/list_54_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 十二生肖 2
            for (int i = 1; i < 3; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/wenhuagushi/shiersx/list_31_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 人之初 16
            for (int i = 1; i < 17; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/wenhuagushi/rzc/list_114_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 孙子兵法 2
            for (int i = 1; i < 3; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/wenhuagushi/szbf/list_152_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 文史疑案 56
            for (int i = 1; i < 57; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/wenhuagushi/ws/list_153_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            NSLog(@"文化count: %lu", (unsigned long)pathList.count);
            
            for (NSString *path in pathList) {
                
//                dispatch_async(self.queue, ^{
                
                    [self getDataWithPath2:path];
//                });
                
            }
        }
        
        {
            NSMutableArray *pathList = [[NSMutableArray alloc] init];
            
            // 古代  20页
            for (int i = 1; i < 21; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/zhanzheng/gd/list_35_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 近现代  6页
            for (int i = 1; i < 7; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/zhanzheng/jxd/list_36_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 世界战争  17页
            for (int i = 1; i < 18; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/zhanzheng/sjzz/list_129_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            //
            // 抗日战争  22页
            for (int i = 1; i < 23; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/zhanzheng/kr/list_67_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 抗美援朝  7页
            for (int i = 1; i < 8; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/zhanzheng/kmyc/list_68_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 自卫反击战  3页
            for (int i = 1; i < 4; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/zhanzheng/zwfj/list_147_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            NSLog(@"战争count: %lu", (unsigned long)pathList.count);
            
            for (NSString *path in pathList) {
                
//                dispatch_async(self.queue, ^{
                
                    [self getDataWithPath2:path];
//                });
                
            }
        }
        
        {
            NSMutableArray *pathList = [[NSMutableArray alloc] init];
            
            // 上古  3页
            for (int i = 1; i < 4; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/huangdi/shanggu/list_158_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 夏商周 5页
            for (int i = 1; i < 6; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/huangdi/mingchao/list_8_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 秦朝 6页
            for (int i = 1; i < 7; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/huangdi/qinchao/list_18_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 汉朝 11页
            for (int i = 1; i < 12; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/huangdi/hanchao/list_19_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 两晋 10页
            for (int i = 1; i < 11; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/huangdi/liangjinhuangdi/list_20_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 南北朝 8页
            for (int i = 1; i < 9; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/huangdi/nanbeichao/list_21_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 隋朝 4页
            for (int i = 1; i < 5; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/huangdi/suichao/list_22_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 唐朝 15页
            for (int i = 1; i < 16; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/huangdi/tangchao/list_23_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 五代十国 4页songchao
            for (int i = 1; i < 5; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/huangdi/wudaishiguo/list_24_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 宋 13页
            for (int i = 1; i < 14; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/huangdi/songchao/list_25_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 元 6页
            for (int i = 1; i < 7; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/huangdi/yuanchao/list_26_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 明朝 12页
            for (int i = 1; i < 13; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/huangdi/mingchao/list_27_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 清 27页
            for (int i = 1; i < 28; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/huangdi/qingchao/list_28_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            NSLog(@"皇帝 count: %lu", (unsigned long)pathList.count);
            
            for (NSString *path in pathList) {
                
//                dispatch_async(self.queue, ^{
                
                    [self getDataWithPath2:path];
//                });
                
            }
        }
        
        {
            NSMutableArray *pathList = [[NSMutableArray alloc] init];
            
            // 成语 84页
            for (int i = 1; i < 85; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/chengyu/list_5_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 民间 46页
            for (int i = 1; i < 47; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/minjian/list_6_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 神话 22页
            for (int i = 1; i < 23; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/shenhua/list_32_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 历史人物 169页
            for (int i = 1; i < 170; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/lishirenwu/list_116_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 中国野史 31页
            for (int i = 1; i < 32; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/yeshi/list_82_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            // 党史故事 57页
            for (int i = 1; i < 58; i++) {
                NSString *urlString = [NSString stringWithFormat:@"http://www.gs5000.cn/gs/dangshi/list_124_%d.html", i];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
                TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
                NSArray *eles = [hpple searchWithXPathQuery:@"//a[@class='preview']"];
                for (TFHppleElement *ele in eles) {
                    NSString *path = [ele objectForKey:@"href"];
                    [pathList addObject:path];
                }
            }
            
            NSLog(@"一级 count: %lu", (unsigned long)pathList.count);
            
            for (NSString *path in pathList) {
                
//                dispatch_async(self.queue, ^{
                
                    [self getDataWithPath:path];
//                });
                
            }
        }
    });
    
    // 文化
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        
    });
    
    // 战争
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        
    });
    
//    http://www.gs5000.cn/gs/huangdi/mingchao/list_27_11.html
    // 皇帝

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        
    });
    
    // 一级
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        
    });
    
    

}

// 有二级分类的
- (void)getDataWithPath2:(NSString *)path {
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.gs5000.cn%@", path]]];
    
    TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
    NSArray *eles = [hpple searchWithXPathQuery:@"//div[@class='place']/a[2] | //div[@class='place']/a[3] | //div[@class='title']/h2 | //div[@class='content']/table[1]/tr/td"];
    if (eles.count == 4) {
        
        NSString *category, *title, *content, *parent;
        parent = ((TFHppleElement *) eles[0]).content;
        category = ((TFHppleElement *) eles[1]).content;
        title = ((TFHppleElement *) eles[2]).content;
        content = ((TFHppleElement *) eles[3]).content;
        
        if (title.length > 0 && content.length > 0) {
            [[DBManager shareInstance] insert:category title:title content:content wid:[self getWid:path] parentCategory:parent];
        }
    }
}

// 只有一级分类的
- (void)getDataWithPath:(NSString *)path {
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.gs5000.cn%@", path]]];

    TFHpple *hpple = [TFHpple hppleWithHTMLData:data];
    NSArray *eles = [hpple searchWithXPathQuery:@"//div[@class='place']/a[2] | //div[@class='title']/h2 | //div[@class='content']/table[1]/tr/td"];
    if (eles.count == 3) {
        
        NSString *category, *title, *content;
        category = ((TFHppleElement *) eles[0]).content;
        title = ((TFHppleElement *) eles[1]).content;
        content = ((TFHppleElement *) eles[2]).content;
        if (title.length > 0 && content.length > 0) {
            [[DBManager shareInstance] insert:category title:title content:content wid:[self getWid:path] parentCategory:@""];
        }
    }
}

// /gs/zhanzheng/gd/23086.html
- (NSInteger)getWid:(NSString *)string {
    NSArray *arr = [string componentsSeparatedByString:@"/"];
    return [arr.lastObject integerValue];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 并发队列下载
- (dispatch_queue_t)queue {
    if (!_queue) {
        _queue = dispatch_queue_create("xxx", DISPATCH_QUEUE_CONCURRENT);
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
