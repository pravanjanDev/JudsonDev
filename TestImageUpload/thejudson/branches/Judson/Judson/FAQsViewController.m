//
//  FAQsViewController.m
//  Judson
//
//  Created by Nesh Technologies on 15/07/13.
//  Copyright (c) 2013 Judson. All rights reserved.
//

#import "FAQsViewController.h"

@interface FAQsViewController ()

@end

@implementation FAQsViewController

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
    UIButton *settingsButton =  [UIButton buttonWithType:UIButtonTypeCustom];
    [settingsButton setImage:[UIImage imageNamed:@"back-button.png"] forState:UIControlStateNormal];
    [settingsButton addTarget:self.navigationController action:@selector(popViewControllerAnimated:) forControlEvents:UIControlEventTouchUpInside];
    //[settingsButton setFrame:CGRectMake(0,10,36,35)];
    [settingsButton setFrame:CGRectMake(3,8,45,38)];
    
    UILabel *lbl_title=[[UILabel alloc] initWithFrame:CGRectMake(110, 0, 200, 50)];
    [lbl_title setBackgroundColor:[UIColor clearColor]];
    [lbl_title setTextColor:[UIColor blackColor]];
    [lbl_title setFont:[UIFont fontWithName:@"Georgia-Bold" size:23]];
    [lbl_title setText:@"FAQ"];
    [view addSubview:lbl_title];
    [view addSubview:settingsButton];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    [self.navigationItem setLeftBarButtonItem:barButtonItem];}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
