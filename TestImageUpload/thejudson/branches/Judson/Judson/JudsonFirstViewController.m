//
//  JudsonFirstViewController.m
//  Judson
//
//  Created by Suresh D on 25/06/13.
//  Copyright (c) 2013 Judson. All rights reserved.
//

#import "JudsonFirstViewController.h"
#import "ViewTheTour.h"


@interface JudsonFirstViewController ()

@end

@implementation JudsonFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //self.title = NSLocalizedString(@"Tour", @"Tour");
        //self.tabBarItem.image = [UIImage imageNamed:@"tour.png"];
        [[self tabBarItem] setFinishedSelectedImage:[UIImage imageNamed:@"tour-hover1.png"]withFinishedUnselectedImage:[UIImage imageNamed:@"tour.png"]];
        [[self tabBarItem] setImageInsets:UIEdgeInsetsMake(6, 0, -6, 0)];
    }
    return self;
}
							
- (void)viewDidLoad
{
//    self.title=@"Tour";
    
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
    [self.tabBarController setSelectedIndex:1];
    ViewTheTour *viewTour=[[ViewTheTour alloc] initWithNibName:@"ViewTheTour" bundle:nil];
    [self.navigationController presentViewController:viewTour animated:YES completion:nil];
    

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
