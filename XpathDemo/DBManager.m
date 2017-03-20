//
//  DBManager.m
//  XpathDemo
//
//  Created by brant on 2017/3/8.
//  Copyright © 2017年 brant. All rights reserved.
//

#import "DBManager.h"
#import <FMDB.h>

@interface DBManager ()

@property (nonatomic, strong) FMDatabase *db;

@property (nonatomic) dispatch_queue_t insertQueue;

@end

@implementation DBManager

+ (DBManager *)shareInstance {
    static DBManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DBManager alloc] init];
    });
    
    return manager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
        self.insertQueue = dispatch_queue_create("insert", DISPATCH_QUEUE_SERIAL);    // 同步queue
        
        if ([self.db open]) {
            [self creatTable];
        }
    }
    
    return self;
}

- (void)close {
    [self.db close];
}

- (void)creatTable {
    NSString *create = @"create table if not exists history_story(sid integer primary key autoincrement,title text,content text,category text,wid integer,parentCategory text)";
    [self.db executeUpdate:create];
}

- (void)insert:(NSString *)category title:(NSString *)title content:(NSString *)content wid:(NSInteger)wid parentCategory:(NSString *)parent {
    
    dispatch_async(_insertQueue, ^{
        NSString *sql = [NSString stringWithFormat:@"insert into history_story (category, title, content, wid, parentCategory) values (?,?,?,?,?)"];
        BOOL success = [self.db executeUpdate:sql, category, title, content, @(wid), parent];
        if (success) {
            //        NSLog(@"插入成功");
        }
        else {
            NSLog(@"插入失败");
        }
    });
    
}


- (FMDatabase *)db {
    if (!_db) {
        NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        path = [path stringByAppendingString:@"/all.db"];
        _db = [FMDatabase databaseWithPath:path];
        NSLog(@"path: %@", path);
    }
    
    return _db;
}

@end
