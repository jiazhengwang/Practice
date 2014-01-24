//
//  Collect.m
//  NavigationDemo
//
//  Created by wangjiazheng on 14-1-20.
//  Copyright (c) 2014年 wangjiazheng. All rights reserved.
//

#import "Collect.h"
#import "ASIFormDataRequest.h"
#import "JSONKit.h"

@implementation Collect

-(void)collect:(NSString *)formhash
{
    NSURL * url = [NSURL URLWithString:Collect_URL];
    ASIFormDataRequest * request = [ASIFormDataRequest requestWithURL:url];
    [request  addRequestHeader:@"formhash" value:formhash]; //:formhash forKey:@"formhash"];
    [request  addRequestHeader:@"charset" value:CharSet];
    [request setRequestMethod:@"POST"];
    [request startSynchronous];
    NSError * error = [request error];
    if (!error) {
        NSString * response = [request responseString];
        NSLog(@"---------dicInfo--------%@",response);

        NSDictionary * dict = [response objectFromJSONString];
        NSDictionary * dicInfo = [NSDictionary dictionaryWithObject:[dict valueForKey:@"Variables"] forKey:@"info"];
        NSLog(@"---------dicInfo--------%@",dicInfo);
        NSArray * array = [[dicInfo valueForKey:@"info"] valueForKey:@"list"];
        self.dicList = [array lastObject];
        NSString * title = [self.dicList valueForKey:@"title"];
        NSString * url = [self.dicList valueForKey:@"url"];
        //self.ids = [self.dicList valueForKey:@"id"];
        NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
        [user setObject:[self.dicList valueForKey:@"id"] forKey:@"idsss"];
        NSLog(@"======%@=========%@===========%@",_ids,url,title);
    }
    NSLog(@"err:%@",[error description]);
}
@end
