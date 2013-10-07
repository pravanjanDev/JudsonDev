//
//  LoadingView.h
//  
//
//  Created by Gokul Balaji



#import <UIKit/UIKit.h>

@interface LoadingView : UIView {
    
    UIActivityIndicatorView *activityIndicator;
    UIImageView *imgLoading;
}
@property(nonatomic, retain) UIActivityIndicatorView *activityIndicator;
@property(nonatomic, retain) UIImageView *imgLoading;

//Declare method to show loading

- (IBAction)showLoadingScreen:(UIView *)rootView;
- (IBAction)showFirstLoadingScreen:(UIView *)rootView;

//Declare method to hide loading
- (IBAction)hideFirstLoadingScreen;
- (IBAction)hideLoadingScreen;

//Declare class method

+ (LoadingView *)sharedLoadingView;

@end