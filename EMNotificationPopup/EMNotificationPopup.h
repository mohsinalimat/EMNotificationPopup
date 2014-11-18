//
//  EMNotificationPopup.h
//  Twist And Turn
//
//  Created by Ennio Masi on 15/07/14.
//  Copyright (c) 2014 tactify. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, EMNotificationPopupDirection) {
    EMNotificationPopupToRight = 0,
    EMNotificationPopupToDown = 1,
    EMNotificationPopupToLeft = 2,
    EMNotificationPopupToTop = 3
};

typedef NS_ENUM(NSInteger, EMNotificationPopupPosition) {
    EMNotificationPopupPositionTop = 0,
    EMNotificationPopupPositionBottom = 1,
    EMNotificationPopupPositionCenter = 2,
};

typedef NS_ENUM(NSInteger, EMNotificationPopupType) {
    EMNotificationPopupSlim = 0,       // Title without any background
    EMNotificationPopupBig = 1,        // Title + Image + Subtitle + black semitransparent background
    EMNotificationPopupBigButton = 2,  // Title + Image + Subtitle + Button + black semitransparent background
};

typedef NS_ENUM(NSInteger, EMNotificationPopupBouncePower) {
    EMNotificationPopupNoBounce = 0,
    EMNotificationPopupBounceWeak = 1,
    EMNotificationPopupBounceMedium = 2,
    EMNotificationPopupBounceStrong = 3,
};

@protocol EMNotificationPopupDelegate
- (void) emNotificationPopupActionClicked;
@end

@interface EMNotificationPopup : UIView

@property NSObject <EMNotificationPopupDelegate> *delegate;

@property (nonatomic, strong) NSString *actionTitle;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSString *title;

// Init default View
- (id) initWithType: (EMNotificationPopupType) type enterDirection:(EMNotificationPopupDirection) enter exitDirection:(EMNotificationPopupDirection) exit popupPosition: (EMNotificationPopupPosition) position;

// Init custom view
- (id) initWithView:(UIView *)view enterDirection:(EMNotificationPopupDirection) enter exitDirection:(EMNotificationPopupDirection) exit popupPosition: (EMNotificationPopupPosition) position;

// Actions on the popup view
- (void) dismissWithAnimation:(BOOL) animate;
- (void) show;
- (BOOL) isVisible;

// Customize the bounce power
- (void) setBouncePower:(NSInteger) bouncePower;

// Customize the default view
- (void) setPopupActionBackgroundColor: (UIColor *) color;
- (void) setPopupActionTitleColor: (UIColor *) color;
- (void) setPopupBorderColor: (UIColor *)color;
- (void) setPopupBackgroundColor:(UIColor *)color;
- (void) setPopupSubtitleColor:(UIColor *)color;
- (void) setPopupTitleColor:(UIColor *)color;

@end