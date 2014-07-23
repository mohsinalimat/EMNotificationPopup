//
//  EMNotificationPopup+UIColor.m
//  EMNotificationPopup
//
//  Created by Ennio Masi on 23/07/14.
//  Copyright (c) 2014 Ennio Masi. All rights reserved.
//

#import "UIColor+EMNotificationPopup.h"

@implementation UIColor (EMNotificationPopup)

+ (UIColor *) EMNotificationPopupActionBackgroundColor {
    return [UIColor colorWithRed:255.0f/255.0f green:244.0f/255.0f blue:0.0f/255.0f alpha:1.0f];    
}

+ (UIColor *) EMNotificationPopupBackgroundColor {
    return [UIColor whiteColor];
}

+ (UIColor *) EMNotificationPopupActionColor {
    return [UIColor blackColor];    
}

+ (UIColor *) EMNotificationPopupBorderColor {
    return [UIColor colorWithRed:255.0f/255.0f green:244.0f/255.0f blue:0.0f/255.0f alpha:1.0f];
}

+ (UIColor *) EMNotificationPopupSubtitleColor {
    return [UIColor lightGrayColor];
}

+ (UIColor *) EMNotificationPopupTitleColor {
    return [UIColor blackColor];
}

@end