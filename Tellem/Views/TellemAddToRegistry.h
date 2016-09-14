//
//  TellemAddToRegistry.h
//  Tellem
//
//  Created by Ed Bayudan on 1/28/15.
//  Copyright (c) 2015 Tellem, LLC All rights reserved.
//

@interface TellemAddToRegistry : UIView<UITextFieldDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *inputBackgroundImageView;
@property (nonatomic, strong) UIImage *inputBackgroundImage;
@property (nonatomic, strong) UIButton *removeViewButton;
@property (nonatomic, strong) UIButton *currentRegistryButton;
@property (nonatomic, strong) UIButton *pushToFriendsButton;
@property (nonatomic, strong) UIButton *futureRegistryButton;

- (id)initWithFrame:(CGRect)frame;

@end
