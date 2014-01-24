//
//  CollectionViewController.h
//  NavigationDemo
//
//  Created by wangjiazheng on 14-1-20.
//  Copyright (c) 2014年 wangjiazheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *url;
@property (weak, nonatomic) IBOutlet UIImageView *image1;
- (IBAction)postsButton:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *titles;
@property(nonatomic,strong)NSDictionary * dictionary;
@property (weak, nonatomic) IBOutlet UITextField *subjectText;
@property (weak, nonatomic) IBOutlet UITextField *messageText;
@end
