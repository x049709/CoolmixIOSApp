//
// TellemBuildCustomRegistry.h
//  Tellem
//
//  Created by Ed Bayudan on 1/28/15.
//  Copyright (c) 2015 Tellem, LLC All rights reserved.
//

@interface TellemBuildCustomRegistry : UIView<UITextFieldDelegate>

@property (nonatomic, strong) UIScrollView *buildScrollView;
@property (nonatomic, strong) UIImageView *profileImageView;
@property (nonatomic, strong) UIImage *profileImage;
@property (strong, nonatomic) UILabel *profileImageLabel;
@property (nonatomic, strong) UIButton *removeViewButton;
@property (nonatomic, strong) UITextField *inputFirstName, *inputLastName;
@property (nonatomic, strong) UITextField *inputUserName;
@property (nonatomic, strong) UITextField *inputPassword,*retypePassword;
@property (nonatomic, strong) UIButton *alreadyButton;
@property (nonatomic, strong) UIButton *continueButton, *skipButton;
@property (nonatomic, strong) UIButton *forgotPasswordButton;
@property (nonatomic, strong) UIButton *sportsButton, *newsButton,*musicButton;
@property (nonatomic, strong) UIButton *entertainmentButton, *lifestyleButton,*techscienceButton;
@property (nonatomic, strong) UIButton *artButton, *gamingButton,*foodButton;
@property (nonatomic, strong) UIButton *fashionButton, *outdoorsadventureButton;
@property (weak, nonatomic) IBOutlet UILabel *quickAddLabel;
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *productLabel;
@property (weak, nonatomic) IBOutlet UITextField *productDescription;
@property (weak, nonatomic) IBOutlet UITextField *productURL;
@property (weak, nonatomic) IBOutlet UITextField *productPrice;
@property (weak, nonatomic) IBOutlet UITextField *productName;
@property (weak, nonatomic) IBOutlet UILabel *productDesirability;
@property (weak, nonatomic) IBOutlet UIButton *productComplete;


- (id)initWithFrame:(CGRect)frame;


@end