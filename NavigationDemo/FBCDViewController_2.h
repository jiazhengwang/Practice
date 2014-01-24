//
//  FBCDViewController_2.h
//  NavigationDemo
//
//  Created by wangjiazheng on 13-11-25.
//  Copyright (c) 2013年 wangjiazheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FBCDViewController_2 : UIViewController<UITextFieldDelegate>
{
    UIToolbar * toolbar;
}
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UILabel *showInfo;
- (IBAction)loginButton:(id)sender;
- (IBAction)collection:(id)sender;
@end
