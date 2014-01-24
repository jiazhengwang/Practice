//
//  CollectionViewController.m
//  NavigationDemo
//
//  Created by wangjiazheng on 14-1-20.
//  Copyright (c) 2014年 wangjiazheng. All rights reserved.
//

#import "CollectionViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "PostsViewController.h"
#import "Collect.h"
#import "Posts.h"
#import "FBCD.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

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
    NSLog(@"-----%@",self.dictionary);
    self.url.text = [self.dictionary valueForKey:@"url"];
    
    
    //UITextPosition
    //[self.titles setTitle:[self.dictionary valueForKey:@"title"] forState:UIControlStateNormal];
    self.titles.text = [self.dictionary valueForKey:@"title"];
    
    NSLog(@"---%d",[[self.dictionary valueForKey:@"icon"] length]);
    NSString * str =[[self.dictionary valueForKey:@"icon"] substringFromIndex:1];
    NSLog(@"%@",str);
    // Do any additional setup after loading the view from its nib.
    
//显示图片
    NSURL * url = [NSURL URLWithString:@"http://115.29.171.182/bbs/static/image/feed/discuz.gif"];
    NSData * data = [NSData dataWithContentsOfURL:url];
    self.image1.image = [UIImage imageWithData:data];
    
    
   // self.messageText.text = @"13124";
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)postsButton:(id)sender {
    Posts * post = [[Posts alloc]init];
  //  NSUserDefaults * user = [NSUserDefaults standardUserDefaults];
    
    [post postmessage:self.messageText.text subject:self.subjectText.text];
  //  NSLog(@"----idss %@",[user valueForKey:@"idsss"]);
    PostsViewController * posts = [[PostsViewController alloc]init];
    [self presentViewController:posts animated:YES completion:nil];
    
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
