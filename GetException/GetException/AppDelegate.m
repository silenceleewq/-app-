//
//  AppDelegate.m
//  GetException
//
//  Created by slience on 2017/2/3.
//  Copyright © 2017年 Ninja. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //自动发送错误报告
    NSSetUncaughtExceptionHandler(&GetUncaughtExceptionHandler);
    
    //异常信息发送到服务器
    NSString *ourDocumentPath1 = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSString *path = [ourDocumentPath1 stringByAppendingPathComponent:@"Exception.txt"];
   
    NSString * crashLogInfo = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    //如果本地有异常信息,那么做处理.
    if (crashLogInfo) {
        //发送到公司邮箱.
        NSLog(@"%@", crashLogInfo);
    }
    
    return YES;
}

void GetUncaughtExceptionHandler(NSException *exception)
{
    NSArray *arr = [exception callStackSymbols]; //得到当前调用栈信息
    NSString *reason = [exception reason];
    NSString *name = [exception name];
    
    NSString *crashLogInfo = [NSString stringWithFormat:@"异常类型: %@\n 异常原因: %@ \n call stack info: %@", name, reason, arr];
    //1. 将崩溃信息持久化在本地,下次程序启动时,将崩溃信息作为日志发送给开发者.
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *ourDocumentPath = [documentPaths objectAtIndex:0];
    NSString *filePath = [ourDocumentPath stringByAppendingPathComponent:@"Exception.txt"];
    [crashLogInfo writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
