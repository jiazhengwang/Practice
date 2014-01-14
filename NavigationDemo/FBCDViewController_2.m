//
//  FBCDViewController_2.m
//  NavigationDemo
//
//  Created by wangjiazheng on 13-11-25.
//  Copyright (c) 2013年 wangjiazheng. All rights reserved.
//

#import "FBCDViewController_2.h"
#import "FBCDViewController.h"
@interface FBCDViewController_2 ()

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
   
    [self.view addSubview:seg];
    
    UIBarButtonItem * button = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(pop)];
    self.navigationItem.leftBarButtonItem = button;
    

    toolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 436, self.view.frame.size.width, 44)];
    toolbar.backgroundColor = [UIColor blackColor];
    [toolbar setBarStyle:UIBarStyleDefault];
    toolbar.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
    UIBarButtonItem * addbutton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(add)];
    [toolbar setItems:[NSArray arrayWithObject:addbutton]];
    
    [self.view addSubview:toolbar];
    
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

@end
