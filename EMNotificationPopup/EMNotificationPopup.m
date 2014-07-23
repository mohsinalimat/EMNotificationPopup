//
//  EMNotificationPopup.m
//  Twist And Turn
//
//  Created by Ennio Masi on 15/07/14.
//  Copyright (c) 2014 tactify. All rights reserved.
//

#import "EMNotificationPopup.h"

#import "UIColor+EMNotificationPopup.h"
#import "UIFont+EMNotificationPopup.h"


#define kDefaultWidth 220.0f
#define kDefaultHeight 300.0f
#define kDefaultImageSize 180.0f

@implementation EMNotificationPopup {
    UIImageView *imageView;
    UITextView *contentTextView;
    UIView *actionView;
    UIView *titleView;
    UIView *subtitleView;
    
    UIView *popoverView;
    UIView *backgroundView;
    
    EMNotificationPopupDirection enterDirection;
    EMNotificationPopupDirection exitDirection;
}

@synthesize delegate = _delegate;

- (id) initWithImage:(UIImage *)image andTitle:(NSString *)title andSubTitle:(NSString *) subtitle andButtonTitle:(NSString *)buttonTitle {
    if (self = [super init]) {
        // Default
        enterDirection = EMNotificationPopupToDown;
        exitDirection = EMNotificationPopupToDown;

        self.frame = [[UIApplication sharedApplication] keyWindow].frame;

        // ---------
        // Base View
        popoverView = [[UIView alloc] init];
        [self manageInitialPopoverPosition];

        popoverView.backgroundColor = [UIColor EMNotificationPopupBackgroundColor];
        popoverView.layer.borderColor = [UIColor EMNotificationPopupBorderColor].CGColor;
        popoverView.layer.borderWidth = 1.0f;
        // ---------

        // ---------
        // 1. The image
        CGPoint imageViewOrigin = CGPointMake((popoverView.frame.size.width - kDefaultImageSize) / 2, 5.0f);
        if (image) {
            imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewOrigin.x, imageViewOrigin.y, kDefaultImageSize, kDefaultImageSize)];
            imageView.image = image;
            [popoverView addSubview:imageView];
        }
        // ---------
        
        // ---------
        // 2. Title
        titleView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, imageViewOrigin.y + kDefaultImageSize + 10.0f, popoverView.frame.size.width, 22.0f)];
        titleView.backgroundColor = popoverView.backgroundColor;
        
        UILabel *popupTitle = [[UILabel alloc] initWithFrame:titleView.frame];
        popupTitle.textColor = [UIColor EMNotificationPopupTitleColor];
        popupTitle.font = [UIFont EMNotificationPopupTitleFont];
        popupTitle.textAlignment = NSTextAlignmentCenter;
        popupTitle.backgroundColor = titleView.backgroundColor;
        popupTitle.text = title;

        [popoverView addSubview:titleView];
        [popoverView addSubview:popupTitle];
        // ----------
        
        // ----------
        // 3. Subtitle
        subtitleView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, titleView.frame.origin.y + titleView.frame.size.height + 5.0f, popoverView.frame.size.width, 40.0f)];
        subtitleView.backgroundColor = popoverView.backgroundColor;
        
        UILabel *popupSubtitle = [[UILabel alloc] initWithFrame:subtitleView.frame];
        popupSubtitle.textColor = [UIColor EMNotificationPopupSubtitleColor];
        popupSubtitle.font = [UIFont EMNotificationPopupSubtitleFont];
        popupSubtitle.textAlignment = NSTextAlignmentCenter;
        popupSubtitle.numberOfLines = 2;
        popupSubtitle.backgroundColor = titleView.backgroundColor;
        popupSubtitle.text = subtitle;
        [popoverView addSubview:subtitleView];
        [popoverView addSubview:popupSubtitle];
        

        // ----------
        // 4. Action View
        actionView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, popoverView.frame.size.height - 40.0f, popoverView.frame.size.width, 40.0f)];
        actionView.backgroundColor = [UIColor EMNotificationPopupActionBackgroundColor];
        UILabel *actionTitle = [[UILabel alloc] initWithFrame:actionView.frame];
        actionTitle.textColor = [UIColor EMNotificationPopupActionColor];
        actionTitle.font = [UIFont EMNotificationPopupActionTitleFont];
        actionTitle.textAlignment = NSTextAlignmentCenter;
        actionTitle.backgroundColor = actionView.backgroundColor;
        actionTitle.text = buttonTitle;
        actionView.userInteractionEnabled = YES;
        // ----------
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognized)];
        tapGesture.numberOfTapsRequired = 1;
        [actionView addGestureRecognizer:tapGesture];

        [popoverView addSubview:actionView];
        [popoverView addSubview:actionTitle];

        backgroundView = [[UIView alloc] init];
        backgroundView.frame = self.frame;
        backgroundView.backgroundColor = [UIColor blackColor];
        backgroundView.alpha = .7f;
        
        [self addSubview:backgroundView];
        [self addSubview:popoverView];
    }
    
    return self;
}

- (id) initWithView:(UIView *)view {
    if (self = [super init]) {
        popoverView = view;
        
        popoverView.frame = CGRectMake(popoverView.frame.origin.x, popoverView.frame.origin.y - popoverView.frame.size.height, popoverView.frame.size.width, popoverView.frame.size.height);
        
        [self addSubview:popoverView];
    }
    
    return self;
}

- (void) show {
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];
    [UIView animateWithDuration:1.0f
                          delay:0.2f
         usingSpringWithDamping:0.3f
          initialSpringVelocity:0.2f
                        options:UIViewAnimationOptionCurveEaseOut animations:^{
                            if (enterDirection == EMNotificationPopupToDown || enterDirection == EMNotificationPopupToTop)
                                popoverView.center = CGPointMake(popoverView.center.x, self.center.y);
                            else
                                popoverView.center = CGPointMake(self.center.x, popoverView.center.y);
                        }
                     completion:^(BOOL finished) {
                         //Completion Block
                     }];
}

- (void) showWithEnterDirection:(EMNotificationPopupDirection)enter andExitDirection:(EMNotificationPopupDirection) exit {
    enterDirection = enter;
    exitDirection = exit;
    
    
    [self manageInitialPopoverPosition];
    [self show];
}

- (void) dismissWithAnimation:(BOOL) animate {
    if (animate) {
        [UIView animateWithDuration:0.6f
                              delay:0.0f
             usingSpringWithDamping:0.2f
              initialSpringVelocity:0.7f
                            options:UIViewAnimationOptionCurveEaseIn animations:^{
                                [backgroundView removeFromSuperview];
                                popoverView.center = [self exitCenter];
                            }
                         completion:^(BOOL finished) {
                             [self removeFromSuperview];
                         }];
    } else {
        [self removeFromSuperview];
    }
}

- (void) tapGestureRecognized {
    if (self.delegate && [self.delegate respondsToSelector:@selector(emActionClicked)]) {
        [self.delegate emActionClicked];
    } else {
        [NSException raise:@"The delegate doesn't respond to the method emActionClicked" format:@"The delegate doesn't respond to the method emActionClicked"];
    }
}

- (BOOL) isVisible {
    return !self.isHidden;
}

- (void) manageInitialPopoverPosition {
    switch (enterDirection) {
        case EMNotificationPopupToDown:
            popoverView.frame = CGRectMake(([[UIApplication sharedApplication] keyWindow].frame.size.width - kDefaultWidth) / 2.0f, -kDefaultHeight, kDefaultWidth, kDefaultHeight);
            break;
        case EMNotificationPopupToTop:
            popoverView.frame = CGRectMake(([[UIApplication sharedApplication] keyWindow].frame.size.width - kDefaultWidth) / 2.0f, [[UIApplication sharedApplication] keyWindow].frame.size.height, kDefaultWidth, kDefaultHeight);
            break;
        case EMNotificationPopupToLeft:
            popoverView.frame = CGRectMake([[UIApplication sharedApplication] keyWindow].frame.size.width, ([[UIApplication sharedApplication] keyWindow].frame.size.height - kDefaultWidth) / 2.0f, kDefaultWidth, kDefaultHeight);
            break;
        case EMNotificationPopupToRight:
            popoverView.frame = CGRectMake(-kDefaultWidth, ([[UIApplication sharedApplication] keyWindow].frame.size.height - kDefaultWidth) / 2.0f, kDefaultWidth, kDefaultHeight);
            break;
        default:
            break;
    }
}

- (CGPoint) exitCenter {
    CGPoint newCenter;
    switch (exitDirection) {
        case EMNotificationPopupToDown:
            newCenter = CGPointMake(popoverView.center.x, [[UIApplication sharedApplication] keyWindow].frame.size.height + kDefaultHeight);
            break;
        case EMNotificationPopupToTop:
            newCenter = CGPointMake(popoverView.center.x, -kDefaultHeight);
            break;
        case EMNotificationPopupToLeft:
            newCenter = CGPointMake(-kDefaultWidth, popoverView.center.y);
            break;
        case EMNotificationPopupToRight:
            newCenter = CGPointMake([[UIApplication sharedApplication] keyWindow].frame.size.width + kDefaultWidth, popoverView.center.y);
            break;
        default:
            break;
    }
    
    return newCenter;
}

@end