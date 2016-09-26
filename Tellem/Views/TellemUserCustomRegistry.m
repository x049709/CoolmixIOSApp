//
//  TellemBuildCustomRegistry.m
//  Tellem
//
//  Created by Ed Bayudan on 1/28/15.
//  Copyright (c) 2015 Tellem, LLC All rights reserved.
//

#import "TellemUserCustomRegistry.h"


@interface TellemUserCustomRegistry ()
@end


@implementation TellemUserCustomRegistry
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
@synthesize quickAddLabel,productImageView,productLabel,productDescription,productURL,productPrice,productName,userRegistryOne;


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
        [self.buildScrollView setShowsVerticalScrollIndicator:NO];
        self.buildScrollView.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.buildScrollView];
        
        UILabel *signupLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, self.buildScrollView.frame.size.width - 10, 300)];
        [signupLabel setTextColor:[UIColor blackColor]];
        [signupLabel setBackgroundColor:[UIColor whiteColor]];
        [self.buildScrollView addSubview:signupLabel];
        
        
        UIImageView *registryImageView = [[UIImageView alloc]init];
        registryImageView.frame = CGRectMake(15.0f, 15.0f, 80.0f, 80.0f);
        registryImageView.layer.cornerRadius = 40.0;
        registryImageView.layer.borderWidth = 1.0;
        [registryImageView setImage:[UIImage imageNamed:@"user.png"]];
        [self.buildScrollView  addSubview:registryImageView];
        
        removeViewButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [removeViewButton setFrame:CGRectMake(self.buildScrollView.frame.size.width - 60.0f, 10.0f, 50.0f, 20.0f)];
        [removeViewButton setBackgroundColor:[UIColor whiteColor]];
        removeViewButton.titleLabel.font = [UIFont fontWithName: kFontBold size: 12.0f];
        [removeViewButton setTitle:@"(CLOSE)" forState:UIControlStateNormal];
        [removeViewButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [removeViewButton setSelected:NO];
        [self.buildScrollView addSubview:removeViewButton];

        UILabel *registryLabel = [[UILabel alloc]init];
        registryLabel.frame = CGRectMake(self.buildScrollView.frame.size.width - 200.0f, 30.0f, 185.0f, 40.0f);
        [registryLabel setTextColor:[UIColor blackColor]];
        [registryLabel setBackgroundColor:[UIColor whiteColor]];
        [registryLabel setFont:[UIFont fontWithName: kFontBold size: 14.0f]];
        registryLabel.lineBreakMode = NSLineBreakByWordWrapping;
        registryLabel.numberOfLines = 0;
        registryLabel.text = @"JOE & JANES's WEDDING REGISTRY";
        registryLabel.textAlignment = NSTextAlignmentRight;
        [self.buildScrollView addSubview:registryLabel];
        
        int buttonWidth = (self.buildScrollView.frame.size.width - 25.0f)/2 - 10.0f;
        UIButton *pushButton = [UIButton buttonWithType:UIButtonTypeCustom];
        pushButton.frame = CGRectMake(15 + buttonWidth + 20, 80, buttonWidth -5, 40);
        [pushButton setBackgroundColor:[UIColor blackColor]];
        [pushButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [pushButton setTitle:@"PUSH" forState:UIControlStateNormal];
        [pushButton.titleLabel setFont:[UIFont fontWithName:kFontBold size:14.0f]];
        [pushButton setSelected:NO];
        pushButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [self.buildScrollView addSubview:pushButton];
        
        UIButton *daysLeftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        daysLeftButton.frame = CGRectMake(15 + buttonWidth + 20, 130, buttonWidth - 5, 40);
        [daysLeftButton setBackgroundColor:[UIColor blackColor]];
        [daysLeftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [daysLeftButton setTitle:@"183 DAYS LEFT!" forState:UIControlStateNormal];
        [daysLeftButton.titleLabel setFont:[UIFont fontWithName:kFontBold size:14.0f]];
        [daysLeftButton setSelected:NO];
        daysLeftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [self.buildScrollView addSubview:daysLeftButton];
        
        UILabel *descriptionLabel = [[UILabel alloc]init];
        descriptionLabel.frame = CGRectMake(15.0f, 180.0f, 190.0f, 20.0f);
        [descriptionLabel setTextColor:[UIColor blackColor]];
        [descriptionLabel setBackgroundColor:[UIColor whiteColor]];
        [descriptionLabel setFont:[UIFont fontWithName: kFontBold size: 12.0f]];
        descriptionLabel.text = @"EVENT DESCRIPTION:";
        descriptionLabel.textAlignment = NSTextAlignmentLeft;
        [self.buildScrollView addSubview:descriptionLabel];
        
        UITextView *registryDescription = [[UITextView alloc]init];
        registryDescription.frame = CGRectMake(15.0f, 200.0f, self.buildScrollView.frame.size.width - 30.0f, 90.0f);
        registryDescription.layer.borderWidth = 1.0;
        registryDescription.layer.borderColor = [[UIColor blackColor]CGColor];
        registryDescription.clearsOnInsertion = TRUE;
        [registryDescription resignFirstResponder];
        registryDescription.delegate = self;
        registryDescription.backgroundColor = [UIColor whiteColor];
        registryDescription.font = [UIFont fontWithName:kFontThin size:10.0];
        [registryDescription setTextColor:[UIColor blackColor]];
        [registryDescription setTintColor:[UIColor blackColor]];
        [buildScrollView addSubview:registryDescription];
        
        UILabel *giftOptionsLabel = [[UILabel alloc]init];
        giftOptionsLabel.frame = CGRectMake(15.0f, 310.0f, 190.0f, 20.0f);
        [giftOptionsLabel setTextColor:[UIColor blackColor]];
        [giftOptionsLabel setBackgroundColor:[UIColor whiteColor]];
        [giftOptionsLabel setFont:[UIFont fontWithName: kFontBold size: 12.0f]];
        giftOptionsLabel.text = @"GIFT OPTIONS:";
        giftOptionsLabel.textAlignment = NSTextAlignmentLeft;
        [self.buildScrollView addSubview:giftOptionsLabel];
        
        UIImageView *giftOne = [[UIImageView alloc]init];
        giftOne.frame = CGRectMake(15.0f, 330.0f, 80.0f, 80.0f);
        giftOne.layer.cornerRadius = 40.0;
        giftOne.layer.borderWidth = 0.0;
        [giftOne setImage:[UIImage imageNamed:@"shareApp.png"]];
        [self.buildScrollView  addSubview:giftOne];
        
        UIImageView *userRegistryTwo = [[UIImageView alloc]init];
        userRegistryTwo.frame = CGRectMake(105.0f, 330.0f, 80.0f, 80.0f);
        userRegistryTwo.layer.cornerRadius = 40.0;
        userRegistryTwo.layer.borderWidth = 0.0;
        [userRegistryTwo setImage:[UIImage imageNamed:@"user.png"]];
        [self.buildScrollView  addSubview:userRegistryTwo];
        
        UIImageView *userRegistryThree = [[UIImageView alloc]init];
        userRegistryThree.frame = CGRectMake(195.0f, 330.0f, 80.0f, 80.0f);
        userRegistryThree.layer.cornerRadius = 40.0;
        userRegistryThree.layer.borderWidth = 0.0;
        [userRegistryThree setImage:[UIImage imageNamed:@"user.png"]];
        [self.buildScrollView  addSubview:userRegistryThree];
        
        UIImageView *userRegistryFour = [[UIImageView alloc]init];
        userRegistryFour.frame = CGRectMake(15.0f, 420.0f, 80.0f, 80.0f);
        userRegistryFour.layer.cornerRadius = 40.0;
        userRegistryFour.layer.borderWidth = 0.0;
        [userRegistryFour setImage:[UIImage imageNamed:@"user.png"]];
        [self.buildScrollView  addSubview:userRegistryFour];
        
        UIImageView *userRegistryFive = [[UIImageView alloc]init];
        userRegistryFive.frame = CGRectMake(105.0f, 420.0f, 80.0f, 80.0f);
        userRegistryFive.layer.cornerRadius = 40.0;
        userRegistryFive.layer.borderWidth = 0.0;
        [userRegistryFive setImage:[UIImage imageNamed:@"user.png"]];
        [self.buildScrollView  addSubview:userRegistryFive];
        
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