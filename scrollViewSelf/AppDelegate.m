//
//  AppDelegate.m
//  scrollViewSelf
//
//  Created by longfei on 14-7-24.
//  Copyright (c) 2014年 longfei. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor orangeColor];
    [self.window makeKeyAndVisible];
    
    //添加ScroolView
    self.scroolView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, (self.window.frame.size.height-320)/2, 320, 320)];
    self.scroolView.backgroundColor = [UIColor whiteColor];
    //设置contentSize才能滚动
    self.scroolView.contentSize = CGSizeMake(320*3, 320);
    [self.window addSubview:self.scroolView];
    
    //加图
    UIImageView *hezi0 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    hezi0.image = [UIImage imageNamed:@"hezi0.jpg"];
    [self.scroolView addSubview:hezi0];
    UIImageView *hezi1 = [[UIImageView alloc] initWithFrame:CGRectMake(320, 0, 320, 320)];
    hezi1.image = [UIImage imageNamed:@"hezi1.jpg"];
    [self.scroolView addSubview:hezi1];
    UIImageView *hezi2 = [[UIImageView alloc]  initWithFrame:CGRectMake(320*2, 0, 320, 320)];
    hezi2.image = [UIImage imageNamed:@"hezi2.jpg"];
    [self.scroolView addSubview:hezi2];
    //可以滚动
    self.scroolView.pagingEnabled = YES;
    self.scroolView.showsHorizontalScrollIndicator = NO;

    //加分页
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((320-100)/2.0, 350, 100, 40)];
    self.pageControl.backgroundColor = [UIColor orangeColor];
    self.pageControl.numberOfPages = 3;
    [self.window addSubview:self.pageControl];
    
    //设置delegate，至关重要
    self.scroolView.delegate = self;
    
    [self.pageControl addTarget:self action:@selector(pageSelected) forControlEvents:UIControlEventValueChanged];
    return YES;
}

- (void) pageSelected{
    NSInteger currentPage = self.pageControl.currentPage;
    NSLog(@"currentPage:%d", currentPage);
    [self.scroolView setContentOffset:CGPointMake(320*currentPage, 0) animated:YES];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma scroolView delegage

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger pageIndex = scrollView.contentOffset.x/scrollView.frame.size.width;
    self.pageControl.currentPage = pageIndex;
}

@end
