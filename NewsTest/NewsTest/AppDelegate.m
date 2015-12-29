//
//  AppDelegate.m
//  NewsTest
//
//  Created by scjy on 15/12/29.
//  Copyright © 2015年 王雪娟. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //1.创建一个UITabBarController
    UITabBarController *tabBarVC = [[UITabBarController alloc] init];
    //选中的额颜色
    tabBarVC.tabBar.tintColor = [UIColor greenColor];
    //背景颜色
    tabBarVC.tabBar.barTintColor = [UIColor grayColor];

    //2.创建被UITabBarController管理的视图控制器
    ViewController *TwoVC = [[ViewController alloc] init];
    //3.设置标签标题
    TwoVC.tabBarItem.title = @"WXJ";
    TwoVC.tabBarItem.badgeValue = @"45";
    TwoVC.tabBarItem.image = [UIImage imageNamed:@"103-map.png"];
    UINavigationController *TwoNav = [[UINavigationController alloc] initWithRootViewController:TwoVC];
    //设置代理
    tabBarVC.delegate = self;
    tabBarVC.viewControllers = @[TwoNav];
    
    
    
    
    
    //添加到根视图上
    self.window.rootViewController = tabBarVC;
    
    
    
    
    
    
    
    return YES;
    
   
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
