//
//  TellemLabel.m
//  UTellem
//
//  Created by Ed Bayudan on 2/13/15.
//  Copyright (c) 2015 Tellem, LLC All rights reserved.
//

#import "TellemLabel.h"

@implementation TellemLabel

@synthesize photoIndex;

- (id)initWithFrame:(CGRect)frame withBackgroundColor:(UIColor*)backgroundColor andTitle:(NSString*) title
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.layer.cornerRadius = 4.0;
        self.layer.borderWidth = 1.0;
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.textColor = [UIColor blueColor];
        self.text = title;
        self.textAlignment = NSTextAlignmentCenter;
        self.font = [UIFont fontWithName:kFontNormal size:17];
        //[self setTintColor:[UIColor blackColor]];
        //[self makeButtonShiny:self withBackgroundColor:backgroundColor];
    }
    return self;
}

- (void)makeButtonShiny:(TellemLabel*)button withBackgroundColor:(UIColor*)backgroundColor
{
    // Get the button layer and give it rounded corners with a semi-transparant button
    CALayer *layer = button.layer;
    layer.cornerRadius = 8.0f;
    layer.masksToBounds = YES;
    layer.borderWidth = 2.0f;
    layer.borderColor = [UIColor colorWithWhite:0.4f alpha:0.2f].CGColor;
    
    // Create a shiny layer that goes on top of the button
    CAGradientLayer *shineLayer = [CAGradientLayer layer];
    shineLayer.frame = button.layer.bounds;
    // Set the gradient colors
    shineLayer.colors = [NSArray arrayWithObjects:
                         (id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,
                         (id)[UIColor colorWithWhite:1.0f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:0.75f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:0.4f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,
                         nil];
    // Set the relative positions of the gradien stops
    shineLayer.locations = [NSArray arrayWithObjects:
                            [NSNumber numberWithFloat:0.0f],
                            [NSNumber numberWithFloat:0.5f],
                            [NSNumber numberWithFloat:0.5f],
                            [NSNumber numberWithFloat:0.8f],
                            [NSNumber numberWithFloat:1.0f],
                            nil];
    
    // Add the layer to the button
    [button.layer addSublayer:shineLayer];
    
    [button setBackgroundColor:backgroundColor];
}


@end
