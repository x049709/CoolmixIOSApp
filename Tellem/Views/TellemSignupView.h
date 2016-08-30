//
//  TellemSignupView.h
//  Tellem
//
//  Created by Ed Bayudan on 1/28/15.
//  Copyright (c) 2015 Tellem, LLC All rights reserved.
//

#import "TPKeyboardAvoidingScrollView.h"

@interface TellemSignupView : UIView<UITextFieldDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *inputBackgroundImageView;
@property (nonatomic, strong) UIImage *inputBackgroundImage;
@property (nonatomic, strong) UIButton *removeViewButton;
@property (nonatomic, strong) UITextField *inputFirstName, *inputLastName;
@property (nonatomic, strong) UITextField *inputUserName;
@property (nonatomic, strong) UITextField *inputPassword,*retypePassword;
@property (nonatomic, strong) UIButton *signinButton;
@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, strong) UIButton *forgotPasswordButton;
@property (nonatomic, strong) UIButton *guestButton;

- (id)initWithFrame:(CGRect)frame;

@end
