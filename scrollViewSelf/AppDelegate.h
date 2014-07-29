//
//  AppDelegate.h
//  scrollViewSelf
//
//  Created by longfei on 14-7-24.
//  Copyright (c) 2014年 longfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UIScrollViewDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIPageControl *pageControl;
@property (strong, nonatomic) UIScrollView *scroolView;

@end
