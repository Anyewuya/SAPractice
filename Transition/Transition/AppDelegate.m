//
//  AppDelegate.m
//  Transition
//
//  Created by TRY-MAC01 on 15/6/24.
//  Copyright (c) 2015年 ZH. All rights reserved.
//



#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate, UIViewControllerAnimatedTransitioning>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    

    UITabBarController *tab = [[UITabBarController alloc] init];
    tab.viewControllers = @[
                             [[ViewController alloc] initWithColor:[UIColor yellowColor]],
                             [[ViewController alloc] initWithColor:[UIColor blueColor]],
                             [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] initWithColor:[UIColor redColor]]]
                             ];
    tab.delegate = self;
    self.window.rootViewController = tab;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController animationControllerForTransitionFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    return  self;
}



- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *incomingVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController *outgingVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [[transitionContext containerView] addSubview:incomingVC.view];
    
    CGRect incomingDestinationFrame = [transitionContext finalFrameForViewController:incomingVC];
    CGRect tmp  = incomingDestinationFrame;

//    incomingDestinationFrame.origin.x = incomingDestinationFrame.size.width;
    incomingDestinationFrame = CGRectMake(160, 280, 0, 0);

    CGRect outgoingDestinationFrame = [[outgingVC view] frame];
//    outgoingDestinationFrame.origin.x = outgoingDestinationFrame.origin.x + outgoingDestinationFrame.size.width;
//    outgoingDestinationFrame.origin.x -= outgoingDestinationFrame.size.width;

//    outgoingDestinationFrame = CGRectMake(160, 280, 0, 0);
    
    [[incomingVC view] setFrame:incomingDestinationFrame];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        [[incomingVC view] setFrame:tmp];
        [[outgingVC view] setFrame:outgoingDestinationFrame];
    } completion:^(BOOL finished) {
        NSLog(@"the transitionContext is over");
        [transitionContext completeTransition:finished];
    }];
}



//http://stablekernel.com/blog/view-controller-containers-part-iv-custom-transitions/



@end
