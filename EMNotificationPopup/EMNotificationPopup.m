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


#define kDefaultBigPopupWidth 220.0f
#define kDefaultBigPopupHeight 300.0f
#define kDefaultSlimPopupHeight 80.0f

#define kDefaultBigPopupImageSize 180.0f

@implementation EMNotificationPopup {
    UIImageView *imageView;
    UITextView *contentTextView;

    UIView *actionView;
    UILabel *actionTitleLbl;
    
    UIView *titleView;
    UILabel *popupTitle;
    
    UIView *subtitleView;
    UILabel *popupSubtitle;

    UIView *backgroundView;
    
    EMNotificationPopupDirection enterDirection;
    EMNotificationPopupDirection exitDirection;
    EMNotificationPopupPosition popupPosition;
    
    EMNotificationPopupType popupType;
    
    CGSize popoverSize;
    
    UIColor *popupActionBackgroundColor;
    UIColor *popupActionTitleColor;
    UIColor *popupBackgroundColor;
    UIColor *popupBorderColor;
    UIColor *popupSubtitleColor;
    UIColor *popupTitleColor;
}

@synthesize delegate = _delegate;

@synthesize actionTitle = _actionTitle;
@synthesize image = _image;
@synthesize subtitle = _subtitle;
@synthesize title = _title;

// Default View
- (id) initWithType: (EMNotificationPopupType) type enterDirection:(EMNotificationPopupDirection) enter exitDirection:(EMNotificationPopupDirection) exit popupPosition: (EMNotificationPopupPosition) position  {
    if (self = [super init]) {
        popupType = type;
        
        enterDirection = enter;
        exitDirection = exit;
        popupPosition = position;
        
        switch (popupType) {
            case EMNotificationPopupSlim:
                [self initSlimPopup];
                break;
            case EMNotificationPopupBig:
                [self initBigPopup];
                break;
            case EMNotificationPopupBigButton:
                [self initBigPopupButton];
                break;
            default:
                break;
        }
    }
    
    return self;
}

- (void) initSlimPopup {
    popoverSize = CGSizeMake([[UIApplication sharedApplication] keyWindow].frame.size.width, kDefaultSlimPopupHeight);
    
    [self manageInitialPopoverPosition];
    
    self.backgroundColor = popupBackgroundColor ? popupBackgroundColor : [UIColor EMNotificationPopupSlimBackgroundColor];
    self.layer.borderColor = popupBorderColor ? popupBorderColor.CGColor : [UIColor EMNotificationPopupSlimBorderColor].CGColor;
    self.layer.borderWidth = 1.0f;
    
    titleView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.frame.size.width, self.frame.size.height)];
    titleView.backgroundColor = [UIColor clearColor];
    
    popupTitle = [[UILabel alloc] initWithFrame:titleView.frame];
    popupTitle.textColor = popupTitleColor ? popupTitleColor : [UIColor EMNotificationPopupTitleColor];
    popupTitle.font = [UIFont EMNotificationPopupTitleFont];
    popupTitle.textAlignment = NSTextAlignmentCenter;
    popupTitle.backgroundColor = [UIColor clearColor];
    
    [self addSubview:titleView];
    [self addSubview:popupTitle];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognized)];
    tapGesture.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tapGesture];
}

- (void) initBigPopup {
    [self addOpaqueBackground];
    popoverSize = CGSizeMake(kDefaultBigPopupWidth, kDefaultBigPopupHeight);
    
    [self manageInitialPopoverPosition];
    
    self.backgroundColor = popupBackgroundColor ? popupBackgroundColor : [UIColor EMNotificationPopupBigBackgroundColor];
    self.layer.borderColor = popupBorderColor ? popupBorderColor.CGColor : [UIColor EMNotificationPopupBigBorderColor].CGColor;
    self.layer.borderWidth = 1.0f;
    
    // ---------
    // 1. The image
    CGPoint imageViewOrigin = CGPointMake((self.frame.size.width - kDefaultBigPopupImageSize) / 2, 25.0f);
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewOrigin.x, imageViewOrigin.y, kDefaultBigPopupImageSize, kDefaultBigPopupImageSize)];
    [self addSubview:imageView];
    // ---------
    
    // ----------
    // 2. Subtitle
    subtitleView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, self.frame.size.height - 42.0f, self.frame.size.width, 40.0f)];
    subtitleView.backgroundColor = [UIColor clearColor];
    
    popupSubtitle = [[UILabel alloc] initWithFrame:subtitleView.frame];
    popupSubtitle.textColor = popupSubtitleColor ? popupSubtitleColor : [UIColor EMNotificationPopupSubtitleColor];
    popupSubtitle.font = [UIFont EMNotificationPopupSubtitleFont];
    popupSubtitle.textAlignment = NSTextAlignmentCenter;
    popupSubtitle.numberOfLines = 2;
    popupSubtitle.backgroundColor = [UIColor clearColor];;
    [self addSubview:subtitleView];
    [self addSubview:popupSubtitle];
    // ---------

    // ---------
    // 3. Title
    titleView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, subtitleView.frame.origin.y - 22.0f, self.frame.size.width, 22.0f)];
    titleView.backgroundColor = [UIColor clearColor];
    
    popupTitle = [[UILabel alloc] initWithFrame:titleView.frame];
    popupTitle.textColor = popupTitleColor ? popupTitleColor : [UIColor EMNotificationPopupTitleColor];
    popupTitle.font = [UIFont EMNotificationPopupTitleFont];
    popupTitle.textAlignment = NSTextAlignmentCenter;
    popupTitle.backgroundColor = titleView.backgroundColor;
    
    [self addSubview:titleView];
    [self addSubview:popupTitle];
    // ----------

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognized)];
    tapGesture.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tapGesture];
}

- (void) initBigPopupButton {
    [self addOpaqueBackground];
    popoverSize = CGSizeMake(kDefaultBigPopupWidth, kDefaultBigPopupHeight);
    
    [self manageInitialPopoverPosition];
    
    self.backgroundColor = popupBackgroundColor ? popupBackgroundColor : [UIColor EMNotificationPopupBigBackgroundColor];
    self.layer.borderColor = popupBorderColor ? popupBorderColor.CGColor : [UIColor EMNotificationPopupBigBorderColor].CGColor;
    self.layer.borderWidth = 1.0f;
    
    // ---------
    // 1. The image
    CGPoint imageViewOrigin = CGPointMake((self.frame.size.width - kDefaultBigPopupImageSize) / 2, 5.0f);
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewOrigin.x, imageViewOrigin.y, kDefaultBigPopupImageSize, kDefaultBigPopupImageSize)];
    [self addSubview:imageView];
    // ---------
    
    // ---------
    // 2. Title
    titleView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, imageViewOrigin.y + imageView.frame.size.height, self.frame.size.width, 22.0f)];
    titleView.backgroundColor = [UIColor clearColor];
    
    popupTitle = [[UILabel alloc] initWithFrame:titleView.frame];
    popupTitle.textColor = popupTitleColor ? popupTitleColor : [UIColor EMNotificationPopupTitleColor];
    popupTitle.font = [UIFont EMNotificationPopupTitleFont];
    popupTitle.textAlignment = NSTextAlignmentCenter;
    popupTitle.backgroundColor = titleView.backgroundColor;
    
    [self addSubview:titleView];
    [self addSubview:popupTitle];
    // ----------
    
    // ----------
    // 3. Subtitle
    subtitleView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, titleView.frame.origin.y + titleView.frame.size.height, self.frame.size.width, 40.0f)];
    subtitleView.backgroundColor = [UIColor clearColor];
    
    popupSubtitle = [[UILabel alloc] initWithFrame:subtitleView.frame];
    popupSubtitle.textColor = popupSubtitleColor ? popupSubtitleColor : [UIColor EMNotificationPopupSubtitleColor];
    popupSubtitle.font = [UIFont EMNotificationPopupSubtitleFont];
    popupSubtitle.textAlignment = NSTextAlignmentCenter;
    popupSubtitle.numberOfLines = 2;
    popupSubtitle.backgroundColor = [UIColor clearColor];;
    [self addSubview:subtitleView];
    [self addSubview:popupSubtitle];
    // ---------

    // ----------
    // 4. Action View
    actionView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, self.frame.size.height - 40.0f, self.frame.size.width, 40.0f)];
    actionView.backgroundColor = popupActionBackgroundColor ? popupActionBackgroundColor : [UIColor EMNotificationPopupBigActionBackgroundColor];
    actionTitleLbl = [[UILabel alloc] initWithFrame:actionView.frame];
    actionTitleLbl.textColor = popupActionTitleColor ? popupActionTitleColor : [UIColor EMNotificationPopupBigActionTitleColor];
    actionTitleLbl.font = [UIFont EMNotificationPopupActionTitleFont];
    actionTitleLbl.textAlignment = NSTextAlignmentCenter;
    actionTitleLbl.backgroundColor = actionView.backgroundColor;

    actionView.userInteractionEnabled = YES;
    // ----------
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognized)];
    tapGesture.numberOfTapsRequired = 1;
    [actionView addGestureRecognizer:tapGesture];
    
    [self addSubview:actionView];
    [self addSubview:actionTitleLbl];
}

- (void) setActionTitle: (NSString *)actionTitle {
    _actionTitle = actionTitle;
    actionTitleLbl.text = _actionTitle;
}

- (void) setImage: (UIImage *) image {
    _image = image;
    imageView.image = _image;
}
- (void) setSubtitle: (NSString *)subtitle {
    _subtitle = subtitle;
    popupSubtitle.text = _subtitle;
}

- (void) setTitle:(NSString *)title {
    _title = title;
    popupTitle.text = _title;
}

// Customize the default view
- (void) setPopupActionBackgroundColor: (UIColor *) color {
    popupActionBackgroundColor = color;
    actionView.backgroundColor = popupActionBackgroundColor;
}

- (void) setPopupActionTitleColor: (UIColor *) color {
    popupActionTitleColor = color;
    actionTitleLbl.backgroundColor = popupActionTitleColor;
}

- (void) setPopupBackgroundColor:(UIColor *)color {
    popupBackgroundColor = color;
    self.backgroundColor = popupBackgroundColor;
}

- (void) setPopupBorderColor: (UIColor *)color {
    popupBorderColor = color;
    self.layer.borderColor = popupBorderColor.CGColor;
}

- (void) setPopupSubtitleColor:(UIColor *)color {
    popupSubtitleColor = color;
    popupSubtitle.textColor = popupSubtitleColor;
}

- (void) setPopupTitleColor:(UIColor *)color {
    popupTitleColor = color;
    popupTitle.textColor = popupTitleColor;
}


- (id) initWithView:(UIView *)view enterDirection:(EMNotificationPopupDirection) enter exitDirection:(EMNotificationPopupDirection) exit popupPosition: (EMNotificationPopupPosition) position {
    if (self = [super init]) {
        enterDirection = enter;
        exitDirection = exit;
        popupPosition = position;
        
        popoverSize = CGSizeMake(view.frame.size.width, view.frame.size.height);
        [self manageInitialPopoverPosition];

        [self addOpaqueBackground];
        [self addSubview:view];
    }
    
    return self;
}

- (void) defaultSettings {
    enterDirection = EMNotificationPopupToDown;
    exitDirection = EMNotificationPopupToDown;
    popupPosition = EMNotificationPopupPositionCenter;
}

- (void) show {
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];
    [UIView animateWithDuration:1.0f
                          delay:0.2f
         usingSpringWithDamping:0.3f
          initialSpringVelocity:0.2f
                        options:UIViewAnimationOptionCurveEaseOut animations:^{
                            switch (popupPosition) {
                                case EMNotificationPopupPositionTop:
                                    self.center = CGPointMake([[UIApplication sharedApplication] keyWindow].center.x, self.frame.size.height / 2);
                                    break;
                                case EMNotificationPopupPositionBottom:
                                    self.center = CGPointMake([[UIApplication sharedApplication] keyWindow].center.x, [[UIApplication sharedApplication] keyWindow].frame.size.height - popoverSize.height / 2);
                                    break;
                                case EMNotificationPopupPositionCenter:
                                    self.center = [[UIApplication sharedApplication] keyWindow].center;
                                    break;
                                default:
                                    break;
                            }
                        }
                     completion:^(BOOL finished) {
                         //Completion Block
                     }];
}
- (void) dismissWithAnimation:(BOOL) animate {
    if (animate) {
        [UIView animateWithDuration:0.6f
                              delay:0.0f
             usingSpringWithDamping:0.2f
              initialSpringVelocity:0.7f
                            options:UIViewAnimationOptionCurveEaseIn animations:^{
                                [backgroundView removeFromSuperview];
                                self.center = [self exitCenter];
                            }
                         completion:^(BOOL finished) {
                             [self setHidden:YES];
                             [self removeFromSuperview];
                         }];
    } else {
        [self removeFromSuperview];
    }
}

- (void) tapGestureRecognized {
    if (self.delegate && [self.delegate respondsToSelector:@selector(emNotificationPopupActionClicked)]) {
        [self.delegate emNotificationPopupActionClicked];
    } else {
        [NSException raise:@"The delegate doesn't respond to the method emNotificationPopupActionClicked" format:@"The delegate doesn't respond to the method emNotificationPopupActionClicked"];
    }
}

- (BOOL) isVisible {
    return !self.isHidden;
}

- (void) addOpaqueBackground {
    backgroundView = [[UIView alloc] init];
    backgroundView.frame = CGRectMake(-200.0f, -200.0f, [[UIApplication sharedApplication] keyWindow].frame.size.width + 400.0f, [[UIApplication sharedApplication] keyWindow].frame.size.height + 400.0f);
    backgroundView.backgroundColor = [UIColor blackColor];
    backgroundView.alpha = .7f;
    
    [[[UIApplication sharedApplication] keyWindow] addSubview:backgroundView];
}

- (void) manageInitialPopoverPosition {
    CGFloat yOrigin = 0.0f;
    
    switch (enterDirection) {
        case EMNotificationPopupToDown:
            self.frame = CGRectMake(([[UIApplication sharedApplication] keyWindow].frame.size.width - popoverSize.width) / 2.0f, -popoverSize.height, popoverSize.width, popoverSize.height);
            break;
        case EMNotificationPopupToTop:
            self.frame = CGRectMake(([[UIApplication sharedApplication] keyWindow].frame.size.width - popoverSize.width) / 2.0f, [[UIApplication sharedApplication] keyWindow].frame.size.height, popoverSize.width, popoverSize.height);
            break;
        case EMNotificationPopupToLeft:

            switch (popupPosition) {
                case EMNotificationPopupPositionTop:
                    yOrigin = 0.0f;
                    break;
                case EMNotificationPopupPositionBottom:
                    yOrigin = [[UIApplication sharedApplication] keyWindow].frame.size.height - popoverSize.height;
                    break;
                case EMNotificationPopupPositionCenter:
                    yOrigin = ([[UIApplication sharedApplication] keyWindow].frame.size.height - popoverSize.height) / 2.0f;
                    break;
                default:
                    break;
            }
            
            self.frame = CGRectMake([[UIApplication sharedApplication] keyWindow].frame.size.width, yOrigin, popoverSize.width, popoverSize.height);
            break;
        case EMNotificationPopupToRight:
            
            switch (popupPosition) {
                case EMNotificationPopupPositionTop:
                    yOrigin = 0.0f;
                    break;
                case EMNotificationPopupPositionBottom:
                    yOrigin = [[UIApplication sharedApplication] keyWindow].frame.size.height - popoverSize.height;
                    break;
                case EMNotificationPopupPositionCenter:
                    yOrigin = ([[UIApplication sharedApplication] keyWindow].frame.size.height - popoverSize.height) / 2.0f;
                    break;
                default:
                    break;
            }

            self.frame = CGRectMake(-popoverSize.width, yOrigin, popoverSize.width, popoverSize.height);
            break;
        default:
            break;
    }
}

- (CGPoint) exitCenter {
    CGPoint newCenter;
    switch (exitDirection) {
        case EMNotificationPopupToDown:
            newCenter = CGPointMake(self.center.x, [[UIApplication sharedApplication] keyWindow].frame.size.height + popoverSize.height);
            break;
        case EMNotificationPopupToTop:
            newCenter = CGPointMake(self.center.x, -popoverSize.height);
            break;
        case EMNotificationPopupToLeft:
            newCenter = CGPointMake(-popoverSize.width, self.center.y);
            break;
        case EMNotificationPopupToRight:
            newCenter = CGPointMake([[UIApplication sharedApplication] keyWindow].frame.size.width + popoverSize.width, self.center.y);
            break;
        default:
            break;
    }
    
    return newCenter;
}

@end