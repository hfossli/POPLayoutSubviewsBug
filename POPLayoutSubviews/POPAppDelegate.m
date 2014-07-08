//
//  POPAppDelegate.m
//  POPLayoutSubviews
//
//  Created by Håvard Fossli on 07.07.14.
//  Copyright (c) 2014 Agens AS. All rights reserved.
//

#import "POPAppDelegate.h"
#import <POP/POP.h>


@interface MySubview : UIView

@end

@implementation MySubview

- (void)layoutSubviews
{
    [super layoutSubviews];

    NSLog(@"layoutSubviews in MySubview");
}

@end



@interface MyView : UIView

@end

@implementation MyView

- (void)layoutSubviews
{
    [super layoutSubviews];

    NSLog(@"layoutSubviews in MyView");
}

@end



@interface MyViewController : UIViewController

@property (nonatomic, strong) MySubview *subview;

@end

@implementation MyViewController

- (void)loadView
{
    self.view = [MyView new];

    self.subview = [[MySubview alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
    self.subview.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.subview];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];

    NSLog(@"viewDidLayoutSubviews in MyViewController");
}

@end



@implementation POPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    MyViewController *controller = [MyViewController new];
    self.window.rootViewController = controller;

    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(1.5, 1.5)];
    anim.springSpeed = 0.5;

    [controller.subview.layer pop_addAnimation:anim forKey:@"scale"];

    return YES;
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

@end
