//
//  TellemBuildCustomRegistry.m
//  Tellem
//
//  Created by Ed Bayudan on 1/28/15.
//  Copyright (c) 2015 Tellem, LLC All rights reserved.
//

#import "TellemBuildCustomRegistry.h"


@interface TellemBuildCustomRegistry ()
@end


@implementation TellemBuildCustomRegistry
@synthesize buildScrollView;
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
@synthesize quickAddLabel,productImageView,productLabel,productDescription,productURL,productPrice,productName,productComplete;


#pragma mark - Initialization

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        self.layer.cornerRadius = 0.0;
        self.layer.borderWidth = 0.0;
        self.buildScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(10, 0, self.frame.size.width-20, self.frame.size.height)];
        [self.buildScrollView setContentSize:CGSizeMake(self.buildScrollView.bounds.size.width, self.buildScrollView.bounds.size.height+250)];        
        self.buildScrollView.layer.cornerRadius = 0.0;
        self.buildScrollView.layer.masksToBounds = YES;
        self.buildScrollView.layer.borderWidth = 0.0;
        [self.buildScrollView setScrollEnabled:YES];
        self.buildScrollView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.buildScrollView];
        
        UILabel *signupLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, self.buildScrollView.frame.size.width - 10, 300)];
        [signupLabel setTextColor:[UIColor whiteColor]];
        [signupLabel setBackgroundColor:[UIColor blackColor]];
        [self.buildScrollView addSubview:signupLabel];
        
        
        UIImageView *registryImageView = [[UIImageView alloc]init];
        registryImageView.frame = CGRectMake(15.0f, 15.0f, 80.0f, 80.0f);
        registryImageView.layer.cornerRadius = 40.0;
        registryImageView.layer.borderWidth = 1.0;
        [registryImageView setImage:[UIImage imageNamed:@"user.png"]];
        [self.buildScrollView  addSubview:registryImageView];
        
        removeViewButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [removeViewButton setFrame:CGRectMake(self.buildScrollView.frame.size.width - 60.0f, 10.0f, 50.0f, 20.0f)];
        [removeViewButton setBackgroundColor:[UIColor blackColor]];
        removeViewButton.titleLabel.font = [UIFont fontWithName: kFontBold size: 12.0f];
        [removeViewButton setTitle:@"(CLOSE)" forState:UIControlStateNormal];
        [removeViewButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [removeViewButton setSelected:NO];
        [self.buildScrollView addSubview:removeViewButton];

        UILabel *registryLabel = [[UILabel alloc]init];
        registryLabel.frame = CGRectMake(self.buildScrollView.frame.size.width - 200.0f, 25.0f, 190.0f, 40.0f);
        [registryLabel setTextColor:[UIColor whiteColor]];
        [registryLabel setBackgroundColor:[UIColor blackColor]];
        [registryLabel setFont:[UIFont fontWithName: kFontBold size: 12.0f]];
        registryLabel.lineBreakMode = NSLineBreakByWordWrapping;
        registryLabel.numberOfLines = 0;
        registryLabel.text = @"A REGISTRY FOR ANY OCCASION\nEND THE RE-GIFTING CYCLE!";
        registryLabel.textAlignment = NSTextAlignmentRight;
        [self.buildScrollView addSubview:registryLabel];
        
        UITextField *registryTitle = [[UITextField alloc]init];
        registryTitle.frame = CGRectMake(self.buildScrollView.frame.size.width - 180.0f, 70.0f, 170.0f, 30.0f);
        registryTitle.backgroundColor = [UIColor whiteColor];
        [registryTitle setTextColor:[UIColor blackColor]];
        [registryTitle setFont:[UIFont fontWithName:kFontNormal size:14.0f]];
        registryTitle.placeholder = @"Title of registry";
        [registryTitle setBorderStyle:UITextBorderStyleNone];
        registryTitle.delegate=self;
        registryTitle.userInteractionEnabled=YES;
        [buildScrollView addSubview:registryTitle];
        
        UITextField *registryCountdown = [[UITextField alloc]init];
        registryCountdown.frame = CGRectMake(self.buildScrollView.frame.size.width - 180.0f, 110.0f, 80.0f, 30.0f);
        registryCountdown.backgroundColor = [UIColor whiteColor];
        [registryCountdown setTextColor:[UIColor blackColor]];
        [registryCountdown setFont:[UIFont fontWithName:kFontNormal size:14.0f]];
        registryCountdown.placeholder = @"Countdown";
        [registryCountdown setBorderStyle:UITextBorderStyleNone];
        registryCountdown.delegate=self;
        registryCountdown.userInteractionEnabled=YES;
        [buildScrollView addSubview:registryCountdown];
        
        UITextField *registryEndDate = [[UITextField alloc]init];
        registryEndDate.frame = CGRectMake(self.buildScrollView.frame.size.width - 90.0f, 110.0f, 80.0f, 30.0f);
        registryEndDate.backgroundColor = [UIColor whiteColor];
        [registryEndDate setTextColor:[UIColor blackColor]];
        [registryEndDate setFont:[UIFont fontWithName:kFontNormal size:14.0f]];
        registryEndDate.placeholder = @"mm/dd/yy";
        [registryEndDate setBorderStyle:UITextBorderStyleNone];
        registryEndDate.delegate=self;
        registryEndDate.userInteractionEnabled=YES;
        [buildScrollView addSubview:registryEndDate];
                
        UITextView *registryDecription = [[UITextView alloc]init];
        registryDecription.frame = CGRectMake(15.0f, 150.0f, self.buildScrollView.frame.size.width - 25.0f, 70.0f);
        registryDecription.layer.borderWidth = 1.0;
        registryDecription.layer.borderColor = [[UIColor darkGrayColor]CGColor];
        registryDecription.clearsOnInsertion = TRUE;
        [registryDecription resignFirstResponder];
        registryDecription.delegate = self;
        registryDecription.backgroundColor = [UIColor whiteColor];
        registryDecription.font = [UIFont fontWithName:kFontThin size:10.0];
        [registryDecription setTextColor:[UIColor blackColor]];
        [registryDecription setTintColor:[UIColor blackColor]];
        [buildScrollView addSubview:registryDecription];
        
        int buttonWidth = (self.buildScrollView.frame.size.width - 25.0f)/2 - 10.0f;
        UIButton *addItemButton = [UIButton buttonWithType:UIButtonTypeCustom];
        addItemButton.frame = CGRectMake(15, 240, buttonWidth, 40);
        [addItemButton setBackgroundColor:[UIColor whiteColor]];
        [addItemButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [addItemButton setTitle:@"ADD ITEMS" forState:UIControlStateNormal];
        [addItemButton.titleLabel setFont:[UIFont fontWithName:kFontBold size:14.0f]];
        [addItemButton setSelected:NO];
        addItemButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [self.buildScrollView addSubview:addItemButton];

        UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        shareButton.frame = CGRectMake(15 + buttonWidth + 20, 240, buttonWidth, 40);
        [shareButton setBackgroundColor:[UIColor whiteColor]];
        [shareButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [shareButton setTitle:@"SHARE" forState:UIControlStateNormal];
        [shareButton.titleLabel setFont:[UIFont fontWithName:kFontBold size:14.0f]];
        [shareButton setSelected:NO];
        shareButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [self.buildScrollView addSubview:shareButton];
        
    }
    
    return self;
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