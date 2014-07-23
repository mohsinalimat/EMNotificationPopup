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

@protocol EMNotificationPopupDelegate
- (void) emActionClicked;
@end

@interface EMNotificationPopup : UIView

@property NSObject <EMNotificationPopupDelegate> *delegate;

- (id) initWithImage:(UIImage *)image andTitle:(NSString *)title andSubTitle:(NSString *) subtitle andButtonTitle:(NSString *)buttonTitle;
- (id) initWithView:(UIView *)view;

- (void) dismissWithAnimation:(BOOL) animate;
- (BOOL) isVisible;
- (void) show;
- (void) showWithEnterDirection:(EMNotificationPopupDirection)enterDirection andExitDirection:(EMNotificationPopupDirection) exitDirection;

@end