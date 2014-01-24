//
//  Collect.h
//  NavigationDemo
//
//  Created by wangjiazheng on 14-1-20.
//  Copyright (c) 2014年 wangjiazheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Posts.h"

@interface Collect : NSObject


#define Collect_URL @"http://115.29.171.182/bbs/api/mobile/index.php?charset=utf-8&version=3&mobile=no&module=myfavforum"
#define CharSet @"utf-8"

@property(nonatomic,strong)NSDictionary * dicList;
@property(nonatomic,strong)NSString * ids;
-(void)collect:(NSString*)formhash;
@end
