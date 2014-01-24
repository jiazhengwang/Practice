//
//  Login.m
//  NavigationDemo
//
//  Created by wangjiazheng on 14-1-15.
//  Copyright (c) 2014年 wangjiazheng. All rights reserved.
//

#import "Login.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "JSONKit.h"

@implementation Login
-(Login *)login:(NSString*)userName And:(NSString*)passWord
{
    NSURL * urlLogin = [NSURL URLWithString:Login_URL];
    ASIFormDataRequest * request = [ASIFormDataRequest requestWithURL:urlLogin];
    NSLog(@"%@",[request url]);
    [request setPostValue:CharSet forKey:@"charset"];
    [request setPostValue:userName forKey:@"username"];
    [request setPostValue:passWord forKey:@"password"];
    [request setRequestMethod:@"POST"];
    [request setDelegate:self];
    [request startSynchronous];
    NSError * error = [request error];
    if (!error) {
        NSString * response = [request responseString];
        NSDictionary * dict = [response objectFromJSONString];
        NSLog(@"------------------------%@",dict);
        //NSDictionary * dicq = [aaf5c9bd];
        NSDictionary * dictInfo = [NSDictionary dictionaryWithObject:[dict valueForKey:@"Message"] forKey:@"info"];
        NSDictionary * dicVaribles = [NSDictionary dictionaryWithObject:[dict valueForKey:@"Variables"] forKey:@"variables"];
        NSString * formhashLogin = [[dicVaribles valueForKey:@"variables"] valueForKey:@"formhash"];
        NSString * str =[[dictInfo valueForKey:@"info"] valueForKey:@"messagestr"];
        NSLog(@"--urlLogin------%@",str);
        NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
        [user setObject:str forKey:@"str"];
        [user setObject:formhashLogin forKey:@"formhashLogin"];
        NSLog(@"----------------formhash-------%@",formhashLogin);
    }
    
    NSURL * urlSecure = [NSURL URLWithString:Secure_URL];
    ASIHTTPRequest * request2 = [ASIHTTPRequest requestWithURL:urlSecure];
    [request2 startSynchronous];
    NSError * error2 = [request2 error];
    if (!error2) {
        NSString * response = [request2 responseString];
        NSDictionary * dict = [response objectFromJSONString];
        NSDictionary * dicVaribles = [NSDictionary dictionaryWithObject:[dict valueForKey:@"Variables"] forKey:@"variables"];
        NSString * formhashSecure = [[dicVaribles valueForKey:@"variables"] valueForKey:@"formhash"];
        NSUserDefaults * users = [NSUserDefaults standardUserDefaults];
        [users setObject:formhashSecure forKey:@"formhashForPost"];
        
        NSLog(@"===urlSecure=====%@",dict);
    }


    
    return self;
}

@end
