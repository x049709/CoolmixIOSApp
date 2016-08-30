//
//  NewCGRView.h
//  Coolmix
//
//  Created by Ed Bayudan on 1/28/15.
//  Copyright (c) 2015 Tellem, LLC All rights reserved.
//

#import "TPKeyboardAvoidingScrollView.h"

@interface NewCGRView : UIView<UITextFieldDelegate>

@property (nonatomic, strong) TPKeyboardAvoidingScrollView *scrollView;
@property (nonatomic, strong) UIImageView *inputBackgroundImageView;
@property (nonatomic, strong) UIImage *inputBackgroundImage;
@property (nonatomic, strong) UIButton *removeViewButton;
@property (nonatomic, strong) UITextField *inputCGRName, *inputCGRDescription;
@property (nonatomic, strong) UIButton *addNewCGRButton;

- (id)initWithFrame:(CGRect)frame;
- (UIToolbar*)configureKeyboardToolbars: (UITextField*) textField;


@end
