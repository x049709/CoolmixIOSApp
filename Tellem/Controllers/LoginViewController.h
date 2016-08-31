//
//  LoginViewController.h
//  Tellem
//
//  Created by Ed Bayudan on 24/03/14.
//  Copyright (c) 2014 Tellem, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MokriyaUITabBarController.h"
#import <Social/Social.h>
#import <Twitter/Twitter.h>
#import <Accounts/Accounts.h>
#import "AppDelegate.h"
#import "TellemLoginView.h"
#import "TellemSignupView.h"
#import "TellemSignupInterestsView.h"
#import "TellemSignupPictureView.h"
#import "TellemSignupDescribeMe.h"
#import "TellemForgotPasswordView.h"
#import "PAPUtility.h"
#import "TellemGlobals.h"
#import "RestClient.h"
#import "UserProfileCamViewController.h"
#import "ProfilePictureViewController.h"

@interface LoginViewController : UIViewController<UITextFieldDelegate,UIWebViewDelegate,PFLogInViewControllerDelegate,UIScrollViewDelegate, ProfilePictureProtocol>
{
    UIScrollView *scrollView;
    BOOL firstLaunch;
}
@property (nonatomic, retain) NSString *user_id;
@property (nonatomic, retain) NSString *isLogin;
@property (nonatomic, strong) MBProgressHUD *hud;
@property (strong, nonatomic) UIImageView *textfielImg;
@property (weak, nonatomic)   UILabel *titleLbl;
@property (strong, nonatomic) UIImageView *titlImg;
@property (nonatomic, strong) UIImage *image, *profileImage;
@property (nonatomic, strong) NSTimer *autoFollowTimer;
@property (nonatomic, strong) MokriyaUITabBarController *tabBarController;
@property (nonatomic, strong) TellemLoginView *tellemLoginView;
@property (nonatomic, strong) TellemSignupView *tellemSignupView;
@property (nonatomic, strong) TellemSignupInterestsView *tellemSignupInterestsView;
@property (nonatomic, strong) TellemSignupPictureView *tellemSignupPictureView;
@property (nonatomic, strong) TellemSignupDescribeMe *tellemSignupDescribeMe;
@property (nonatomic, strong) TellemForgotPasswordView *resetPasswordView;
@property (strong, nonatomic) IBOutlet UIButton *mixSigninButton;
@property (strong, nonatomic) IBOutlet UIButton *shopSigninButton;
@property UIImage *imagePickedFromGalleryOrCamera;
@property UserProfileCamViewController *userProfileCamViewController;



-(IBAction)mixSigninTouched:(id)sender;
-(IBAction)shopSigninTouched:(id)sender;
-(BOOL)isEmailValid:(NSString *)checkString;
-(BOOL)isPasswordValid:(NSString *)checkString;


@end