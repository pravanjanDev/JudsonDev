//
//  JudsonLogin.m
//  Judson
//
//  Created by Suresh D on 04/07/13.
//  Copyright (c) 2013 Judson. All rights reserved.
//

#import "JudsonLogin.h"
#import "JudsonAppDelegate.h"
#import "JSON.h"
#import "JudsonSecondViewController.h"

@interface JudsonLogin ()

@end

@implementation JudsonLogin

@synthesize appDelegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    appDelegate =(JudsonAppDelegate *)[[UIApplication sharedApplication] delegate];
    if (!appDelegate.session.isOpen) {
        // create a fresh session object
        appDelegate.session = [[FBSession alloc] init];
        
        // if we don't have a cached token, a call to open here would cause UX for login to
        // occur; we don't want that to happen unless the user clicks the login button, and so
        // we check here to make sure we have a token before calling open
        if (appDelegate.session.state == FBSessionStateCreatedTokenLoaded)
        {
            // even though we had a cached token, we need to login to make the session usable
            [appDelegate.session openWithCompletionHandler:^(FBSession *session,
                                                             FBSessionState status,
                                                             NSError *error)
             {
                 // we recurse here, in order to update buttons and labels
//                 [self updateView];
                 
                 AccessToken=[NSString stringWithFormat:@"https://graph.facebook.com/me?access_token=%@",appDelegate.session.accessTokenData.accessToken];
                 NSLog(@"url-->%@",AccessToken);
             }];
        }
    }

}

-(void)viewWillAppear:(BOOL)animated
{
    appDelegate =(JudsonAppDelegate *)[[UIApplication sharedApplication] delegate];
    [super viewWillAppear:animated];
    //[self.navigationItem setHidesBackButton:YES];
    [self.navigationController setNavigationBarHidden:YES];
}

- (IBAction)FbLoginAction
{
    if (appDelegate.session.isOpen) {
        
        [appDelegate.session closeAndClearTokenInformation];
        
    }
    else
    {
        if (appDelegate.session.state != FBSessionStateCreated)
        {
            // Create a new, logged out session.
            appDelegate.session = [[FBSession alloc] init];
        }
        // if the session isn't open, let's open it now and present the login UX to the user
        [appDelegate.session openWithCompletionHandler:^(FBSession *session,
                                                         FBSessionState status,
                                                         NSError *error) {
            // and here we make sure to update our UX according to the new session state
            NSLog(@"Access Tok==>%@",session.accessTokenData.accessToken);
            AccessToken=[NSString stringWithFormat:@"https://graph.facebook.com/me?access_token=%@",appDelegate.session.accessTokenData.accessToken];
            NSLog(@"Acces Token got--------********%@",AccessToken);
           // [self updateView];
            
            
            
            NSURL *url= [NSURL URLWithString:AccessToken] ;
            NSData*data = [[NSData alloc]initWithContentsOfURL:url];
            NSLog(@"url==>%@",url);
            
            NSError* error1;
            NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error1];
            NSLog(@"name: %@", json);
            fbId = [NSString stringWithFormat:@"%@",[json objectForKey:@"id"]];
            fname = [NSString stringWithFormat:@"%@",[json objectForKey:@"first_name"]];
            [self ProfPic];
            
        }];
    }    
}


-(void)ProfPic
{
    NSString *string = [NSString stringWithFormat:@"https://graph.facebook.com/%@?fields=picture",fbId];
    NSData*data=[NSData dataWithContentsOfURL:[NSURL URLWithString:string]];
    NSError *er;
    NSDictionary*dic=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&er];
    NSDictionary*dicForPic=[dic objectForKey:@"picture"];
    NSDictionary*dicForData=[dicForPic objectForKey:@"data"];
    NSDictionary*di=[dicForData objectForKey:@"url"];
    fbImgUrl = [NSString stringWithFormat:@"%@",di];
    NSLog(@"pic url==>%@",fbImgUrl);
    [self SignInWithFacebook];
}


-(void)SignInWithFacebook
{
    //[[LoadingView sharedLoadingView] showLoadingScreen:self.view];
    NSURL *url=[NSURL URLWithString:@"http://judson-server.appspot.com/api/ContactManageController//createContactFB/v_0"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    NSString *boundary = @"0x0hHai1CanHazB0undar135";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data;boundary=%@",boundary];
    [request setValue:contentType forHTTPHeaderField:@"Content-Type"];
    NSMutableData *body = [NSMutableData data];
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"firstName\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"%@\r\n",fname] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"faceBookId\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"%@\r\n",fbId] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"profileImageLink\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"%@\r\n",fbImgUrl] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:body];
    [request setHTTPMethod:@"POST"];
    urlConnection =[[NSURLConnection alloc]initWithRequest:request delegate:self];
    if(urlConnection)
    {
        responseData = [[NSMutableData alloc]retain];
    }
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	[responseData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	[responseData setLength:0];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError : %@",[error description]);
    [urlConnection release];
    urlConnection = nil;
    [responseData release];
	responseData = nil;
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    responseString =[[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
    dictValues =[responseString JSONValue];
    NSLog(@"login dictvalues : %@",dictValues);
    appDelegate.userDefaults = [NSUserDefaults standardUserDefaults];
    [appDelegate.userDefaults setObject:[[dictValues objectForKey:@"UserDetai"]objectForKey:@"userId"] forKey:@"userId"];
    [appDelegate.userDefaults setObject:[[dictValues objectForKey:@"UserDetai"] objectForKey:@"userLastName"] forKey:@"fbId"];
    [appDelegate.userDefaults setObject:[[dictValues objectForKey:@"UserDetai"] objectForKey:@"userFirstName"] forKey:@"userFirstName"];
    [appDelegate.userDefaults setObject:[[dictValues objectForKey:@"UserDetai"] objectForKey:@"profileImageLink"] forKey:@"profileImageLink"];
    [appDelegate.userDefaults synchronize];
    [urlConnection release];
    urlConnection = nil;
    NSLog(@"connection did : %@",[appDelegate.userDefaults objectForKey:@"userId"]);
    [self.tabBarController.tabBar setHidden:NO];
    [self.tabBarController setSelectedIndex:1];
    [self.navigationController popToRootViewControllerAnimated:NO];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (UIInterfaceOrientationPortrait == interfaceOrientation);
}
@end
