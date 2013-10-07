//
//  ViewTheTour.h
//  FamZeeAgent
//
//  Created by Gokul Balaji on 04/06/12.
//  Copyright (c) 2012 Tangoe rTEM. All rights reserved
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "LBYouTubePlayerViewController.h"
#import "LoadingView.h"

@interface ViewTheTour : UIViewController<UIScrollViewDelegate,UIWebViewDelegate,UIGestureRecognizerDelegate,LBYouTubePlayerControllerDelegate>
{
    
    MPMoviePlayerViewController *moviePlayerViewController;
    LBYouTubePlayerViewController *lbYoutubePlayerVC;

    IBOutlet UIScrollView *scroll;

    NSMutableArray *aryImg;
    
    IBOutlet UIWebView *web_view;
    IBOutlet UIButton *but_one,*but_two,*but_three,*but_four,*but_five,*but_six,*play_button,*btn_getStarted;
}
@property(nonatomic,retain)IBOutlet UIImageView *imgOne,*imgTwo,*imgThree,*imgFour,*imgFive,*imgSix,*imgFooter;
@property(nonatomic,retain)IBOutlet UIButton *btn_getStarted;
-(IBAction)btnOne:(id)sender;
-(IBAction)btnTwo:(id)sender;
-(IBAction)btnThree:(id)sender;
-(IBAction)btnFour:(id)sender;
-(IBAction)btnFive:(id)sender;
-(IBAction)btnSix:(id)sender;
-(IBAction)dismis;
- (IBAction)playVideo:(id)sender;
@end
