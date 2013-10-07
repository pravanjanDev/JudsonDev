//
//  FBViewController.m
//  Judson
//
//  Created by Nesh Technologies on 09/07/13.
//  Copyright (c) 2013 Judson. All rights reserved.
//

#import "FBViewController.h"
#import "LoadingView.h"
@interface FBViewController ()

@end

@implementation FBViewController
@synthesize webViews;
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
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    view.backgroundColor = [UIColor clearColor];
    
//    UIButton *settingsButton =  [UIButton buttonWithType:UIButtonTypeCustom];
//    [settingsButton setImage:[UIImage imageNamed:@"Upload-button.png"] forState:UIControlStateNormal];
//    [settingsButton addTarget:self action:@selector(Upload:) forControlEvents:UIControlEventTouchUpInside];
//    [settingsButton setFrame:CGRectMake(282,8,35,35)];
    
    
    UIButton *backButton =  [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"back-button.png"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backPressed:) forControlEvents:UIControlEventTouchUpInside];
    [backButton setFrame:CGRectMake(5,5,45,38)];
    
    
//    UILabel *lbl_title=[[UILabel alloc] initWithFrame:CGRectMake(110, 0, 200, 50)];
//    [lbl_title setBackgroundColor:[UIColor clearColor]];
//    [lbl_title setTextColor:[UIColor blackColor]];
//    [lbl_title setFont:[UIFont boldSystemFontOfSize:20]];
//    [lbl_title setText:@"Add Gallery"];
//    [view addSubview:lbl_title];
    
    
    //[view addSubview:settingsButton];
    [self.view addSubview:backButton];
//    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
//    [self.navigationItem setRightBarButtonItem:barButtonItem];
//    [self.navigationItem setLeftBarButtonItem:barButtonItem];

    
    NSString *urlAddress = @"https://m.facebook.com/#!/TheJudsonStudios?slog=942181303&seq=421103141&rk=0&fbtype=65&__user=100000441411294";
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webViews loadRequest:requestObj];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationItem setHidesBackButton:YES];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [[LoadingView sharedLoadingView] showLoadingScreen:self.view];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
	
    [[LoadingView sharedLoadingView] hideLoadingScreen];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    //NSLog(@"could not load the website caused by error: %@", error);
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"No Network Connection"  delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
	[alert show];
	[alert release];
}

-(IBAction)backPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
