//
//  ViewTheTour.m
//  FamZeeAgent
//
//  Created by Gokul Balaji on 04/06/12.
//  Copyright (c) 2012 Tangoe rTEM. All rights reserved
//

#import "ViewTheTour.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewTheTour ()

@end

@implementation ViewTheTour

@synthesize imgOne,imgTwo,imgThree,imgFour,imgFive,imgSix,imgFooter;
@synthesize btn_getStarted;
MPMoviePlayerViewController *moviePlayerViewController;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
//        self.title = NSLocalizedString(@"Tour", @"Tour");
//        self.tabBarItem.image = [UIImage imageNamed:@"first"];
        [[self tabBarItem] setFinishedSelectedImage:[UIImage imageNamed:@"tour-hover1.png"]withFinishedUnselectedImage:[UIImage imageNamed:@"tour.png"]];
        [[self tabBarItem] setImageInsets:UIEdgeInsetsMake(6, 0, -6, 0)];

    }
    return self;
}
/*
-(IBAction)playVideo
{
    VideoLink *videoLink=[[VideoLink alloc] initWithNibName:@"VideoLink" bundle:nil];
    [self.navigationController presentModalViewController:videoLink animated:YES];
}
*/

- (IBAction)playVideo:(id)sender
{
    [[LoadingView sharedLoadingView] showLoadingScreen:self.view];
    //    initialize LBYouTubePlayerViewController here and pass the url
    lbYoutubePlayerVC = [[LBYouTubePlayerViewController alloc]initWithYouTubeURL:[NSURL URLWithString:@"http://www.youtube.com/watch?feature=player_embedded&v=zECxcwEQ208"] quality:LBYouTubeVideoQualityLarge];
    lbYoutubePlayerVC.delegate=self;
}

#pragma mark - LBYouTubePlayerControllerDelegate methods

-(void)youTubePlayerViewController:(LBYouTubePlayerViewController *)controller didSuccessfullyExtractYouTubeURL:(NSURL *)videoURL
{
    moviePlayerViewController = [[MPMoviePlayerViewController alloc] initWithContentURL:videoURL];
    [moviePlayerViewController.moviePlayer prepareToPlay];
    [[LoadingView sharedLoadingView] hideLoadingScreen];
    [moviePlayerViewController.moviePlayer play];
//    [self presentModalViewController:moviePlayerViewController animated:YES];
    [self presentViewController:moviePlayerViewController animated:YES completion:nil];
}

-(void)youTubePlayerViewController:(LBYouTubePlayerViewController *)controller failedExtractingYouTubeURLWithError:(NSError *)error
{
    NSLog(@"URL extracting failed with error: %@", error);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Network Failed" message:@"Please try again later" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    [[LoadingView sharedLoadingView] hideLoadingScreen];
}

-(IBAction)dismis
{
    [self.tabBarController setSelectedIndex:1];
    [self dismissViewControllerAnimated:YES completion:nil];
//    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    aryImg = [[NSMutableArray alloc] init];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appHasGoneInBackground)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appHasGoneInBackground)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        if([[UIScreen mainScreen] bounds].size.height >= 568 || [[UIScreen mainScreen] bounds].size.width >= 568)
        {
            play_button.frame=CGRectMake(1670,165,175,175);
            imgFooter.frame=CGRectMake(0, 493, 320, 47);
            [imgFooter setImage:[UIImage imageNamed:@"swip1-568h@2x.png"]];
            [aryImg addObject:@"swip1-568h@2x.png"];
            [aryImg addObject:@"swip2-568h@2x.png"];
            [aryImg addObject:@"swip3-568h@2x.png"];
            [aryImg addObject:@"swip4-568h@2x.png"];
            [aryImg addObject:@"swip5-568h@2x.png"];
            [aryImg addObject:@"swip6-568h@2x.png"];
            
            scroll.frame=CGRectMake(0,63, 320, 450);
            imgOne.frame=CGRectMake(0, 0, 320, 416);
            imgTwo.frame=CGRectMake(320,0, 320, 416);
            imgThree.frame=CGRectMake(640, 0, 320, 416);
            imgFour.frame=CGRectMake(960, 0, 320, 416);
            imgFive.frame=CGRectMake(1280, 0, 320, 416);
            imgSix.frame=CGRectMake(1600, 0, 320, 416);
            
            
            but_one.frame=CGRectMake(59, 505, 31, 33);
            but_two.frame=CGRectMake(95, 505, 31, 33);
            but_three.frame=CGRectMake(130, 505, 31, 33);
            but_four.frame=CGRectMake(163, 505, 31, 33);
            but_five.frame=CGRectMake(196, 505, 31, 33);
            but_six.frame=CGRectMake(233,505, 31, 33);
 /*
            [imgOne setImage:[appDelegate.configurationController retrieveUIimage:@"One-568h@2x.png"]];
            [imgTwo setImage:[appDelegate.configurationController retrieveUIimage:@"Two-568h@2x.png"]];
            [imgThree setImage:[appDelegate.configurationController retrieveUIimage:@"Three-568h@2x.png"]];
            [imgFour setImage:[appDelegate.configurationController retrieveUIimage:@"Four-568h@2x.png"]];
            [imgFive setImage:[appDelegate.configurationController retrieveUIimage:@"Five-568h@2x.png"]];
            [imgSix setImage:[appDelegate.configurationController retrieveUIimage:@"Six-568h@2x.png"]];
            [btn_getStarted setFrame:CGRectMake(1676,386,168,35)];
            [btn_getStarted setImage:[appDelegate.configurationController retrieveUIimage:@"getStarted@2x.png"] forState:UIControlStateNormal]; 
  */
        }
        else
        {
            play_button.frame=CGRectMake(1670,136,175,175);
//            [btn_getStarted setFrame:CGRectMake(1676,327,168,35)];
            [aryImg addObject:@"swip1.png"];
            [aryImg addObject:@"swip2.png"];
            [aryImg addObject:@"swip3.png"];
            [aryImg addObject:@"swip4.png"];
            [aryImg addObject:@"swip5.png"];
            [aryImg addObject:@"swip6.png"];
 /*
            [imgOne setImage:[appDelegate.configurationController retrieveUIimage:@"One.png"]];
            [imgTwo setImage:[appDelegate.configurationController retrieveUIimage:@"Two.png"]];
            [imgThree setImage:[appDelegate.configurationController retrieveUIimage:@"Three.png"]];
            [imgFour setImage:[appDelegate.configurationController retrieveUIimage:@"Four.png"]];
            [imgFive setImage:[appDelegate.configurationController retrieveUIimage:@"Five.png"]];
            [imgSix setImage:[appDelegate.configurationController retrieveUIimage:@"Six.png"]];
            [btn_getStarted setImage:[appDelegate.configurationController retrieveUIimage:@"getStarted.png"] forState:UIControlStateNormal];
  */
        }
    }
    UISwipeGestureRecognizer *leftRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(rightSwipeHandle:)];
    leftRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [leftRecognizer setNumberOfTouchesRequired:1];
    [self.view addGestureRecognizer:leftRecognizer];
    [leftRecognizer release];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int indexval = scroll.contentOffset.x/320;
    NSString *img_str=[aryImg objectAtIndex:indexval];
    UIImage *img=[UIImage imageNamed:img_str];
    [imgFooter setImage:img];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(scroll.contentOffset.x<=-30)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }    
    int indexval = scroll.contentOffset.x/320;
    NSString *img_str=[aryImg objectAtIndex:indexval];
    UIImage *img=[UIImage imageNamed:img_str];
    [imgFooter setImage:img];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    [scroll setPagingEnabled:YES];
    [scroll setContentSize:CGSizeMake(320*6,0)];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (UIInterfaceOrientationPortrait == interfaceOrientation);
}

-(IBAction)btnOne:(id)sender
{
    [scroll setContentOffset:CGPointMake(320*0, 0) animated:YES];
}

-(IBAction)btnTwo:(id)sender
{
    [scroll setContentOffset:CGPointMake(320*1, 0) animated:YES];
}

-(IBAction)btnThree:(id)sender
{
    [scroll setContentOffset:CGPointMake(320*2, 0) animated:YES];
}

-(IBAction)btnFour:(id)sender
{
    [scroll setContentOffset:CGPointMake(320*3, 0) animated:YES];
    
}

-(IBAction)btnFive:(id)sender
{
    [scroll setContentOffset:CGPointMake(320*4, 0) animated:YES];
}

-(IBAction)btnSix:(id)sender
{
    [scroll setContentOffset:CGPointMake(320*5, 0) animated:YES];
}
-(void)appHasGoneInBackground
{
    [self dismissModalViewControllerAnimated:NO];
}

- (void)rightSwipeHandle:(UISwipeGestureRecognizer*)gestureRecognizer
{
    if(scroll.contentOffset.x==0)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
