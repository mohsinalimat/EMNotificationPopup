//
//  EMNotificationPopup+UIColor.m
//  EMNotificationPopup
//
//  Created by Ennio Masi on 23/07/14.
//  Copyright (c) 2014 Ennio Masi. All rights reserved.
//

#import "UIColor+EMNotificationPopup.h"

@implementation UIColor (EMNotificationPopup)

+ (UIColor *) EMNotificationPopupBigActionBackgroundColor {
    return [UIColor colorWithRed:38.0f/255.0f green:97.0f/255.0f blue:107.0f/255.0f alpha:1.0f];
}

+ (UIColor *) EMNotificationPopupBigActionTitleColor {
    return [UIColor whiteColor];
}

+ (UIColor *) EMNotificationPopupBigBackgroundColor {
    return [UIColor whiteColor];
}

+ (UIColor *) EMNotificationPopupBigBorderColor {
    return [UIColor colorWithRed:255.0f/255.0f green:244.0f/255.0f blue:0.0f/255.0f alpha:1.0f];
}

+ (UIColor *) EMNotificationPopupSlimBackgroundColor {
    return [UIColor colorWithRed:255.0f/255.0f green:244.0f/255.0f blue:0.0f/255.0f alpha:1.0f];
}

+ (UIColor *) EMNotificationPopupSlimBorderColor {
    return [UIColor colorWithRed:128.0f/255.0f green:128.0f/255.0f blue:21.0f/255.0f alpha:1.0f];
}

+ (UIColor *) EMNotificationPopupSubtitleColor {
    return [UIColor blackColor];
}

+ (UIColor *) EMNotificationPopupTitleColor {
    return [UIColor blackColor];
}

@end