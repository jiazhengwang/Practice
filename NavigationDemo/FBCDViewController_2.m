//
//  FBCDViewController_2.m
//  NavigationDemo
//
//  Created by wangjiazheng on 13-11-25.
//  Copyright (c) 2013年 wangjiazheng. All rights reserved.
//

#import "FBCDViewController_2.h"
#import "FBCDViewController.h"
#import "Login.h"
#import "Collect.h"
#import "CollectionViewController.h"
#import "ASIFormDataRequest.h"
#import "JSONKit.h"


@interface FBCDViewController_2 ()
{
    Login * login;
   
}
@end

@implementation FBCDViewController_2

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    self.title = @"Second";
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController setToolbarHidden:YES animated:YES];
    NSArray * arr = [[NSArray alloc]initWithObjects:@"鸡翅",@"可乐",nil];
    UISegmentedControl * seg = [[UISegmentedControl alloc]initWithItems:arr];
    [seg addTarget:self action:@selector(bush:) forControlEvents:UIControlEventValueChanged];
    seg.frame = CGRectMake(100, 100, 100, 20);
   
    //[self.view addSubview:seg];
    
    UIBarButtonItem * button = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(pop)];
    self.navigationItem.leftBarButtonItem = button;
    

    toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-44, self.view.frame.size.width, 44)];
    toolbar.backgroundColor = [UIColor blackColor];
    [toolbar setBarStyle:UIBarStyleDefault];
    toolbar.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
    UIBarButtonItem * addbutton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(add)];
    [toolbar setItems:[NSArray arrayWithObject:addbutton]];
    
    //[self.view addSubview:toolbar];
    
    
    login = [[Login alloc]init];
    // Do any additional setup after loading the view from its nib.
}

-(void)add{
    NSLog(@"bushiwodecuo ");
}
-(void)pop
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)bush:(UISegmentedControl*)index
{
    FBCDViewController * fbcd = [[FBCDViewController alloc]init];
    [self.navigationController pushViewController:fbcd animated:YES];
    
    
    if (index.selectedSegmentIndex ==0) {
        NSLog(@"000000");
        
    }
    else if(index.selectedSegmentIndex == 1)
    {
        NSLog(@"11111111");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UItextField

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//
//{
//    
//    UITextPosition * start = [textField positionFromPosition:[textField beginningOfDocument] offset:[textField.text length]];
//    UITextPosition * end = [textField positionFromPosition:[textField endOfDocument] offset:0];
//    
//    [textField setSelectedTextRange:[textField textRangeFromPosition:start toPosition:end]];
//    return YES;
//}

- (IBAction)loginButton:(id)sender {
    
    
    NSLog(@"-----------------%@,------------------%@",self.userName.text,self.passWord.text);
    [login login:self.userName.text And:self.passWord.text];
    NSUserDefaults * str = [NSUserDefaults standardUserDefaults];
    self.showInfo.text = [str valueForKey:@"str"];
    self.showInfo.lineBreakMode = NSLineBreakByWordWrapping;
    self.showInfo.numberOfLines = 2;
   // NSLineBreakMode  NSLineBreakByWordWrapping;

}

- (IBAction)collection:(id)sender {
    NSUserDefaults * str = [NSUserDefaults standardUserDefaults];
    NSLog(@"------str----=%@",[str valueForKey:@"formhash"]);

    Collect * collect = [[Collect alloc]init];
    [collect collect:@""];
    CollectionViewController * colletion2 = [[CollectionViewController alloc]init];
    colletion2.dictionary = collect.dicList;
    NSLog(@"-----collect:%@",collect.dicList);

    NSLog(@"________&&&&&****************%@",collect.dicList);
    [self presentViewController:colletion2 animated:YES completion:nil];
}
@end
