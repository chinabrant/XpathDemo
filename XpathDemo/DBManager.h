//
//  DBManager.h
//  XpathDemo
//
//  Created by brant on 2017/3/8.
//  Copyright © 2017年 brant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBManager : NSObject

+ (DBManager *)shareInstance;

- (void)insert:(NSString *)category title:(NSString *)title content:(NSString *)content wid:(NSInteger)wid parentCategory:(NSString *)parent;

- (void)close;

@end
