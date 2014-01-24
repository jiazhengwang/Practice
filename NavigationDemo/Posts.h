//
//  Posts.h
//  NavigationDemo
//
//  Created by wangjiazheng on 14-1-21.
//  Copyright (c) 2014年 wangjiazheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Posts : NSObject
#define Posts_URL @"http://115.29.171.182/bbs/api/mobile/index.php?fid=36&sechash=hgjPKI36&charset=utf-8&seccodeverify=vbkb&secqaahash=hgjPKI36&version=3&seccodehash=hgjPKI36&mobile=no&topicsubmit=yes&module=newthread"
#define Charset @"utf-8"

//@property(nonatomic,strong)NSString * ids;
//@property(nonatomic,strong)NSString * getId;
-(void)postmessage:(NSString*)message subject:(NSString*)subject;
@end
