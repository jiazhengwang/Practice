//
//  PostsViewController.m
//  NavigationDemo
//
//  Created by wangjiazheng on 14-1-21.
//  Copyright (c) 2014年 wangjiazheng. All rights reserved.
//

#import "PostsViewController.h"
#import "Posts.h"
#import "ASIHTTPRequest.h"
#import "JSONKit.h"
#import "FBCD.h"

@interface PostsViewController ()

@end

@implementation PostsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.addObj = [[NSMutableArray alloc]init];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)viewWillAppear:(BOOL)animated
{
    NSString * fid = @"36";
    NSString * string = [NSString stringWithFormat:@"http://115.29.171.182/bbs/api/mobile/index.php?fid=%@&submodule=checkpost&charset=utf-8&version=3&mobile=no&tpp=10&module=forumdisplay", fid];
    NSURL * url = [NSURL URLWithString:string];
    ASIHTTPRequest * request = [ASIHTTPRequest requestWithURL:url];
    [request startSynchronous];
    NSError * error = [request error];
    if (!error) {
        NSString * response = [request responseString];
        NSLog(@"response---%@",response);
        NSDictionary * dict = [response objectFromJSONString];
        NSDictionary * variable = [dict valueForKey:@"Variables"];
        // NSDictionary * threadList = [variable valueForKey:@"forum_threadlist"];
        NSArray * array = [variable valueForKey:@"forum_threadlist"];
        NSLog(@"------array --%@",array);
        for(NSDictionary * info in array)
        {
            FBCD * fbcd = [[FBCD alloc]init];
            fbcd.lastpost = [info valueForKey:@"lastpost"];
            fbcd.subject = [info valueForKey:@"subject"];
            [self.addObj addObject:fbcd];
        }
        
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.addObj count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    FBCD * fbcd = [[FBCD alloc]init];
    fbcd = [self.addObj objectAtIndex:indexPath.row];
    cell.textLabel.text = fbcd.subject;
    cell.detailTextLabel.text = fbcd.lastpost;
    cell.detailTextLabel.textColor = [UIColor redColor];
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];

    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
 
 */

@end
