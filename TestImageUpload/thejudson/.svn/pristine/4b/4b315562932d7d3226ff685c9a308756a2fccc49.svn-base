//
//  JudsonAppDelegate.m
//  Judson
//
//  Created by Suresh D on 25/06/13.
//  Copyright (c) 2013 Judson. All rights reserved.
//

#import "JudsonAppDelegate.h"
#import "JudsonFirstViewController.h"
#import "JudsonSecondViewController.h"
#import "JudsonThirdViewController.h"
#import "ViewTheTour.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@implementation JudsonAppDelegate
@synthesize navigationController;
@synthesize galleryImages,galleryTitle,galleryDescription,galleryDateandTime,galleryLocation;
@synthesize indexvalue,checkResponse;
@synthesize userDefaults;
@synthesize session;


- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    // attempt to extract a token from the url
    return [FBAppCall handleOpenURL:url
                  sourceApplication:sourceApplication
                        withSession:self.session];
}

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    galleryImages=[[NSMutableArray alloc] init];
    galleryTitle=[[NSMutableArray alloc] init];
    galleryDescription=[[NSMutableArray alloc] init];
    galleryDateandTime=[[NSMutableArray alloc] init];
    galleryLocation = [[NSMutableArray alloc]init];
    indexvalue=[[NSString alloc] init];
    checkResponse=[[NSString alloc] init];
    checkResponse=@"0";
    
    NSMutableArray *viewControllers = [[NSMutableArray alloc] init];
    
    userDefaults = [NSUserDefaults standardUserDefaults];
    // Override point for customization after application launch.
    //UIViewController *viewController1 = [[[JudsonFirstViewController alloc] initWithNibName:@"JudsonFirstViewController" bundle:nil] autorelease];
    
    UIViewController *viewController1 = [[[ViewTheTour alloc] initWithNibName:@"ViewTheTour" bundle:nil] autorelease];
    
    //    UIViewController *viewController1 = [[[ViewTheTour alloc] initWithNibName:@"ViewTheTour" bundle:nil] autorelease];
    UINavigationController *navController1 = [[UINavigationController alloc] initWithRootViewController:viewController1];
    
    
    UIViewController *viewController2 = [[[JudsonSecondViewController alloc] initWithNibName:@"JudsonSecondViewController" bundle:nil] autorelease];
    UINavigationController *navController2 = [[UINavigationController alloc] initWithRootViewController:viewController2];
    //    [viewControllers addObject:viewController2];
    
    
    
    UIViewController *viewController3 = [[[JudsonThirdViewController alloc] initWithNibName:@"JudsonThirdViewController" bundle:nil] autorelease];
    UINavigationController *navController3 = [[UINavigationController alloc] initWithRootViewController:viewController3];
    //   [viewControllers addObject:viewController3];
    
    
    [viewControllers addObject:navController1];
    [viewControllers addObject:navController2];
    [viewControllers addObject:navController3];
    
    
    self.tabBarController = [[[UITabBarController alloc] init] autorelease];
    [self.tabBarController setViewControllers:viewControllers];
    
    
    
    //    self.tabBarController.viewControllers = @[viewController1, viewController2,viewController3];
    //    self.tabBarController.tabBarItem.
    //    self.navigationController.navigationItem.title=@"Gallery Pages";
    //   self.navigationController= [[UINavigationController alloc]initWithRootViewController:self.tabBarController];
    
    //self.tabBarController.tabBar.selectedImageTintColor = UIColorFromRGB(0xE21C3F);
    
    [self.tabBarController setSelectedIndex:1];
    
    //    self.window.rootViewController = self.navigationController;
    
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application
{
    [self.session close];
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
    //    [FBAppCall handleDidBecomeActiveWithSession:self.session];
    
    [FBAppCall handleDidBecomeActiveWithSession:self.session];
    
}


/*
 // Optional UITabBarControllerDelegate method.
 - (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
 {
 }
 */

/*
 // Optional UITabBarControllerDelegate method.
 - (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
 {
 }
 */
-(UIImage *)retrieveUIimage:(NSString *)fileName
{
    NSString *ImageFile = [[NSString alloc] initWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath],fileName];
    UIImage *image = [UIImage imageWithContentsOfFile:ImageFile];
    [ImageFile release];
    return image;
}

@end
