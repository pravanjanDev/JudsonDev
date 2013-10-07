//
//  JudsonThirdViewController.m
//  Judson
//
//  Created by Suresh D on 25/06/13.
//  Copyright (c) 2013 Judson. All rights reserved.
//

#import "JudsonThirdViewController.h"
#import "VideosViewController.h"
#import "FBViewController.h"
#import "TwitterViewController.h"
#import "ContactsViewController.h"
#import "FAQsViewController.h"

@interface JudsonThirdViewController ()

@end

@implementation JudsonThirdViewController

@synthesize arryList;
@synthesize scrlView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //[[self tabBarItem] setTitle:@"More"];
        //[[self tabBarItem] setImage:[UIImage imageNamed:@"more.png"]];
        [[self tabBarItem] setFinishedSelectedImage:[UIImage imageNamed:@"more-hover1.png"]withFinishedUnselectedImage:[UIImage imageNamed:@"more.png"]];
        [[self tabBarItem] setImageInsets:UIEdgeInsetsMake(6, 0, -6, 0)];

        //    [[self navigationItem] setTitle:@"Gallery"];
    }
    return self;
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {

}

- (void)viewDidLoad
{
//    self.navigationItem.title = @"More Page";
//    arryList=[[NSMutableArray alloc] init];
//    [arryList addObject:@"Contact"];
//    [arryList addObject:@"Facebook"];
//    [arryList addObject:@"Twitter"];
//    [arryList addObject:@"Videos"];
//    [arryList addObject:@"FAQs"];
//    [arryList addObject:@"About"];    
    [super viewDidLoad];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    //view.backgroundColor = [UIColor clearColor];
    UILabel *lbl_title=[[UILabel alloc] initWithFrame:CGRectMake(130, 0, 200, 50)];
    [lbl_title setBackgroundColor:[UIColor clearColor]];
    [lbl_title setTextColor:[UIColor blackColor]];
    [lbl_title setFont:[UIFont fontWithName:@"Georgia-Bold" size:23]];
    [lbl_title setText:@"More"];
    [view addSubview:lbl_title];    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    [self.navigationItem setRightBarButtonItem:barButtonItem];}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
    [scrlView setContentOffset:CGPointMake(0,0) animated:YES];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"top-bar.png"] forBarMetrics:UIBarMetricsDefault];
}

-(IBAction)btnFB:(id)sender
{
    FBViewController *FBController=[[FBViewController alloc] initWithNibName:@"FBViewController" bundle:nil];
    [self.navigationController pushViewController:FBController animated:YES];
}

-(IBAction)btnTwits:(id)sender
{
    TwitterViewController *TwitController=[[TwitterViewController alloc] initWithNibName:@"TwitterViewController" bundle:nil];
    [self.navigationController pushViewController:TwitController animated:YES];    
}
-(IBAction)btnContact:(id)sender
{
    ContactsViewController *contacts = [[ContactsViewController alloc]initWithNibName:@"ContactsViewController" bundle:nil];
    [self.navigationController pushViewController:contacts animated:YES];
}

-(IBAction)btnVideos:(id)sender
{
    VideosViewController *videosController=[[VideosViewController alloc] initWithNibName:@"VideosViewController" bundle:nil];
    [self.navigationController pushViewController:videosController animated:YES];
}

-(IBAction)btnFAQs:(id)sender
{
    FAQsViewController *FAQs = [[FAQsViewController alloc]initWithNibName:@"FAQsViewController" bundle:nil];
    [self.navigationController pushViewController:FAQs animated:YES];
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
