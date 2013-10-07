//
//  JudsonAppDelegate.h
//  Judson
//
//  Created by Suresh D on 25/06/13.
//  Copyright (c) 2013 Judson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
@interface JudsonAppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>
{
    UINavigationController *navigationController;
    NSMutableArray *galleryImages,*galleryTitle,*galleryDescription,*galleryDateandTime,*galleryLocation;
    NSString *indexvalue;
    NSString *checkResponse;
    NSUserDefaults *userDefaults;
}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (nonatomic, retain) NSMutableArray *galleryImages,*galleryTitle,*galleryDescription,*galleryDateandTime,*galleryLocation;
@property (nonatomic, retain) NSString *indexvalue,*checkResponse;
@property (nonatomic, retain) NSUserDefaults *userDefaults;
@property (strong, nonatomic) FBSession *session;
-(UIImage *)retrieveUIimage:(NSString *)fileName;
@end
