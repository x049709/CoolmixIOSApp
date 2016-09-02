//
//  TellemSignupPictureDetails.m
//  Tellem
//
//  Created by Ed Bayudan on 1/28/15.
//  Copyright (c) 2015 Tellem, LLC All rights reserved.
//

#import "TellemSignupDescribeMe.h"


@interface TellemSignupDescribeMe ()
@end


@implementation TellemSignupDescribeMe
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
@synthesize fashionButton, outdoorsadventureButton, commentTextField;

#pragma mark - Initialization

- (id)initWithFrame:(CGRect)frame andProfilePicture:(UIImage*) profilePicture {
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
        signupLabel.text = @"DESCRIBE YOURSELF";
        signupLabel.textAlignment = NSTextAlignmentCenter;
        [scrollView addSubview:signupLabel];
        
        profileImage = profilePicture;
        profileImageView = [[UIImageView alloc] initWithImage:profileImage];
        [profileImageView setFrame:CGRectMake(20, 60, 60, 60)];
        profileImageView.layer.cornerRadius = self.profileImageView.frame.size.height/2.0f;
        profileImageView.layer.masksToBounds = YES;
        profileImageView.layer.borderWidth = 0;
        [profileImageView setBackgroundColor:[UIColor whiteColor]];
        [scrollView addSubview:profileImageView];
        
        UILabel *interestLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 130, scrollView.frame.size.width - 40, 30)];
        [interestLabel setTextColor:[UIColor blackColor]];
        [interestLabel setBackgroundColor:[UIColor lightGrayColor]];
        [interestLabel setFont:[UIFont fontWithName: kFontBold size: 8.0f]];
        interestLabel.lineBreakMode = NSLineBreakByWordWrapping;
        interestLabel.numberOfLines = 0;
        interestLabel.text = @"WHAT IS IT THAT MAKES YOU SPECIAL? WHAT KIND OF THINGS ARE YOU INTO? HAVE FUN WITH IT!";
        [scrollView addSubview:interestLabel];
        
        self.commentTextField = [[UITextView alloc] initWithFrame:CGRectMake(20, 170, 210, 180)];
        self.commentTextField.layer.borderWidth = 1.0;
        self.commentTextField.layer.borderColor = [[UIColor darkGrayColor]CGColor];
        self.commentTextField.clearsOnInsertion = TRUE;
        [self.commentTextField resignFirstResponder];
        self.commentTextField.delegate = self;
        self.commentTextField.backgroundColor = [UIColor whiteColor];
        self.commentTextField.font = [UIFont fontWithName:kFontThin size:10.0];
        [self.commentTextField setTextColor:[UIColor blackColor]];
        //[self.commentTextField setPlaceholderColor:[UIColor darkGrayColor]];
        [self.commentTextField setTintColor:[UIColor blackColor]];
        //[self.commentTextField setPlaceholder:@"Type in here..."];
        [scrollView addSubview:self.commentTextField];

        
        continueButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [continueButton setFrame:CGRectMake(scrollView.frame.size.width - 80, scrollView.frame.size.height - 40, 60, 25)];
        [continueButton setBackgroundColor:[UIColor whiteColor]];
        [continueButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [continueButton setTitle:@"CONTINUE" forState:UIControlStateNormal];
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


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}


@end