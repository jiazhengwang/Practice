//
//  FBCDViewController.m
//  NavigationDemo
//
//  Created by wangjiazheng on 13-12-2.
//  Copyright (c) 2013年 wangjiazheng. All rights reserved.
//

#import "FBCDViewController.h"

@interface FBCDViewController ()
{
    NSMutableData * _data;
}

@end

@implementation FBCDViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _data = [[NSMutableData alloc]init];
    
    //组合一个搜索的字符串
    NSString * urlStr = [NSString stringWithFormat:@"http://www.baidu.com%@",@"php"];
    NSURL * url = [NSURL URLWithString:urlStr];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    
    //发起一个请求，定义代理
    [NSURLConnection connectionWithRequest:request delegate:self];
    
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_data appendData:data];
    NSLog(@"data:%@",_data);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString * datastring = [[NSString alloc]initWithData:_data encoding:NSUTF8StringEncoding];
    NSLog(@"string:%@",datastring);
}

@end
