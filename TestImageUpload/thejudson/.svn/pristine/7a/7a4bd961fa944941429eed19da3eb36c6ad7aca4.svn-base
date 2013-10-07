//
//  JudsonLogin.h
//  Judson
//
//  Created by Suresh D on 04/07/13.
//  Copyright (c) 2013 Judson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JudsonAppDelegate;
@interface JudsonLogin : UIViewController
{
    JudsonAppDelegate *appDelegate;
    NSString*AccessToken;
    IBOutlet UIButton *butForFB;
    NSString *location;
    NSString *link;
    NSString *fname;
    NSString *fbId;
    NSData *imageData;
    NSString *fbImgUrl,*responseString;
    NSURLConnection *urlConnection;
    NSMutableData *responseData;
    NSDictionary *dictValues;
}
- (IBAction)FbLoginAction;
@property (nonatomic, retain) JudsonAppDelegate *appDelegate;

@end
