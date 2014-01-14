//
//  FBCDViewController_1.m
//  NavigationDemo
//
//  Created by wangjiazheng on 13-11-25.
//  Copyright (c) 2013年 wangjiazheng. All rights reserved.
//

#import "FBCDViewController_1.h"
#import "FBCDViewController_2.h"
@interface FBCDViewController_1 ()

@end

@implementation FBCDViewController_1

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    self.title =@"First " ;
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem * leftButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(click)];
    self.navigationItem.leftBarButtonItem = leftButton;
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(clickTo)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 50)];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"下一页" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(navigation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [self.navigationController setToolbarHidden:NO animated:YES];
    
    UIBarButtonItem * one = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
     UIBarButtonItem * two = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil]; UIBarButtonItem * five = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
     UIBarButtonItem * three = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
     UIBarButtonItem * four = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
    
    [self setToolbarItems:[NSArray arrayWithObjects:one,two,three,four,five,nil ]];
    
    
    
    // Do any additional setup after loading the view from its nib.
}
-(void)navigation {
    
    FBCDViewController_2 * two = [[FBCDViewController_2 alloc]init];
    [self.navigationController pushViewController:two animated:YES];
}
-(void)click
{
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"left Click" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    [alert show];
}

-(void)clickTo{
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"right Click" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
