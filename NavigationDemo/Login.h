//
//  Login.h
//  NavigationDemo
//
//  Created by wangjiazheng on 14-1-15.
//  Copyright (c) 2014年 wangjiazheng. All rights reserved.
//

#import <Foundation/Foundation.h>

#define Login_URL @"http://115.29.171.182/bbs/api/mobile/index.php?loginfield=auto&charset=utf-8&version=3&loginsubmit=yes&mobile=no&module=login"
#define Secure_URL @"http://115.29.171.182/bbs/api/mobile/index.php?charset=utf-8&version=3&force=1&secversion=3&mobile=no&debug=1&type=login&module=secure"
#define Seccode_URL @"http://115.29.171.182/bbs/api/mobile/index.php?module=seccode&sechash=sA5ugbzS&version=3"
#define Plugin_URL @"http://115.29.171.182/bbs/plugin.php?id=cloudcaptcha:get&rand=mpuZ0CunI7&modid=&mobile=1"
#define CharSet @"utf-8"

@interface Login : NSObject
-(Login *)login:(NSString*)userName And:(NSString*)passWord;
@end
