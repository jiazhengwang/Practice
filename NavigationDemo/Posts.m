//
//  Posts.m
//  NavigationDemo
//
//  Created by wangjiazheng on 14-1-21.
//  Copyright (c) 2014年 wangjiazheng. All rights reserved.
//

#import "Posts.h"
#import "ASIFormDataRequest.h"
#import "JSONKit.h"

@implementation Posts

-(void)postmessage:(NSString *)message subject:(NSString *)subject
{
NSLog(@"--message:%@,,,,,,,subject:%@",message,subject);
    NSUserDefaults * standard = [NSUserDefaults standardUserDefaults];
    //NSString * formhash = [standard valueForKey:@"formhash"];
    ASIFormDataRequest * request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:Posts_URL]];
    [request setPostValue:message forKey:@"message"];
    [request setPostValue:Charset forKey:@"charset"];
NSLog(@"----charset:%@",Charset);
    [request setPostValue:subject forKey:@"subject"];
    [request setPostValue:[standard valueForKey:@"formhashForPost"] forKey:@"formhash"];
NSLog(@"-----formhash:%@",[standard valueForKey:@"formhashForPost"]);
    [request setPostValue:@"1" forKey:@"allownoticeauthor"];
    [request setPostValue:@"1" forKey:@"mobiletype"];
    [request setPostValue:@"583" forKey:@"tyepid"];
    [request setRequestMethod:@"POST"];
    [request setDelegate:self];
    [request startSynchronous];
    NSError * error = [request error];
    NSLog(@"-----request--%@",[request url]);

    if (!error) {
        NSString * response = [request responseString];
        NSLog(@"-----response:%@",response);
        NSDictionary * dict = [response objectFromJSONString];
        NSLog(@"-----dict::%@",dict);
    }
    NSLog(@"----error;;;%@",error.description);
}
@end
