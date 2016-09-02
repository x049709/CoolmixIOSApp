//
//  TellemSignupDOBOptions.m
//  Tellem
//
//  Created by Ed Bayudan on 1/28/15.
//  Copyright (c) 2015 Tellem, LLC All rights reserved.
//

#import "TellemSignupDOBOptions.h"


@interface TellemSignupDOBOptions ()
@end


@implementation TellemSignupDOBOptions
@synthesize scrollView;
@synthesize profileImageView, profileImageLabel;
@synthesize profileImage;
@synthesize removeViewButton;
@synthesize inputUserName, inputFirstName, inputLastName;
@synthesize inputPassword,retypePassword;
@synthesize continueButton,skipButton;
@synthesize alreadyButton;
@synthesize forgotPasswordButton;
@synthesize sportsButton, newsButton, musicButton;
@synthesize entertainmentButton, lifestyleButton, techscienceButton;
@synthesize artButton, gamingButton, foodButton;
@synthesize fashionButton, outdoorsadventureButton;

#pragma mark - Initialization

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        self.layer.cornerRadius = 0.0;
        self.layer.borderWidth = 0.0;
        scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(30, 60, self.frame.size.width-60, self.frame.size.height-110)];
        scrollView.layer.cornerRadius = 0.0;
        scrollView.layer.masksToBounds = YES;
        scrollView.layer.borderWidth = 0.5;
        [scrollView setScrollEnabled:YES];
        scrollView.backgroundColor = [UIColor whiteColor];
        [self addSubview:scrollView];
        
        removeViewButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [removeViewButton setFrame:CGRectMake(self.bounds.origin.x+self.bounds.size.width-40, 25.0f, 32.0f, 32.0f)];
        [removeViewButton setBackgroundColor:[UIColor clearColor]];
        [[removeViewButton titleLabel] setAdjustsFontSizeToFitWidth:YES];
        [removeViewButton setBackgroundImage:[UIImage imageNamed:@"cancel.png"] forState:UIControlStateNormal];
        [removeViewButton setSelected:NO];
        [self addSubview:removeViewButton];
        
        UILabel *signupLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, scrollView.frame.size.width - 40, 30)];
        [signupLabel setTextColor:[UIColor whiteColor]];
        [signupLabel setBackgroundColor:[UIColor blackColor]];
        [signupLabel setFont:[UIFont fontWithName: kFontBold size: 14.0f]];
        signupLabel.text = @"ADD YOUR BIRTHDAY";
        signupLabel.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:signupLabel];
        
        UILabel *interestLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, scrollView.frame.size.width - 40, 20)];
        [interestLabel setTextColor:[UIColor blackColor]];
        [interestLabel setBackgroundColor:[UIColor lightGrayColor]];
        [interestLabel setFont:[UIFont fontWithName: kFontBold size: 8.0f]];
        interestLabel.lineBreakMode = NSLineBreakByWordWrapping;
        interestLabel.numberOfLines = 0;
        interestLabel.text = @"LET YOUR FRIENDS CELEBRATE WITH YOU! YOU ARE ALWAYS IN CONTROL OF WHO CAN SEE IT. ";
        [scrollView addSubview:interestLabel];
        
        profileImage = [UIImage imageNamed:@"user.png"];
        profileImageView = [[UIImageView alloc] initWithImage:profileImage];
        [profileImageView setFrame:CGRectMake(25, 100, 200, 200)];
        profileImageView.layer.cornerRadius = self.profileImageView.frame.size.height/2.0f;
        profileImageView.layer.masksToBounds = YES;
        profileImageView.layer.borderWidth = 0;
        
        [profileImageView setBackgroundColor:[UIColor whiteColor]];
        [scrollView addSubview:profileImageView];
        
        continueButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [continueButton setFrame:CGRectMake(scrollView.frame.size.width - 80, scrollView.frame.size.height - 40, 60, 25)];
        [continueButton setBackgroundColor:[UIColor whiteColor]];
        [continueButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [continueButton setTitle:@"FINISH" forState:UIControlStateNormal];
        [continueButton.titleLabel setFont:[UIFont fontWithName:kFontNormal size:10.0f]];
        [continueButton setSelected:NO];
        continueButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [scrollView addSubview:continueButton];
        
        skipButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [skipButton setFrame:CGRectMake(20, scrollView.frame.size.height - 40, 60, 25)];
        [skipButton setBackgroundColor:[UIColor whiteColor]];
        [skipButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [skipButton setTitle:@"SKIP" forState:UIControlStateNormal];
        [skipButton.titleLabel setFont:[UIFont fontWithName:kFontNormal size:10.0f]];
        [skipButton setSelected:NO];
        skipButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [scrollView addSubview:skipButton];
        
        alreadyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [alreadyButton setFrame:CGRectMake(30, scrollView.frame.size.height +80, scrollView.frame.size.width, 30.0)];
        [alreadyButton setBackgroundColor:[UIColor blackColor]];
        [alreadyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [alreadyButton setTitle:@"ALREADY A MIXER? LOG IN HERE." forState:UIControlStateNormal];
        [alreadyButton.titleLabel setFont:[UIFont fontWithName:kFontBold size:14.0f]];
        [alreadyButton setSelected:NO];
        [self addSubview:alreadyButton];
        
    }
    
    return self;
}

- (void)changeButtonColor:(id)sender {
    
    UIButton* btn = (UIButton*)sender;
    if (btn.tag == 0) {
        btn.tag = 1;
        [btn setBackgroundColor:[UIColor blackColor]];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        continueButton.tag++;
    } else {
        btn.tag = 0;
        [btn setBackgroundColor:[UIColor whiteColor]];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        continueButton.tag--;
    }
    
    if (continueButton.tag>0) {
        [continueButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [continueButton setEnabled:TRUE];
        [skipButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [skipButton setEnabled:FALSE];
    }
    else {
        [continueButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [continueButton setEnabled:FALSE];
        [skipButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [skipButton setEnabled:TRUE];
    }
}



@end