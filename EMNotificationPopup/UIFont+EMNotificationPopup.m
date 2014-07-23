//
//  UIFont+EMNotificationPopup.m
//  EMNotificationPopup
//
//  Created by Ennio Masi on 23/07/14.
//  Copyright (c) 2014 Ennio Masi. All rights reserved.
//

#import "UIFont+EMNotificationPopup.h"
#define kEMGeneralFont @"Helvetica-Light"

#define kEMNotificationPopupTitleFontSize 16.0f
#define kEMNotificationPopupSubtitleFontSize 12.0f
#define kEMNotificationPopupActionFontSize 22.0f

@implementation UIFont (EMNotificationPopup)

+ (UIFont *) EMNotificationPopupActionTitleFont {
    return [UIFont fontWithName:kEMGeneralFont size:kEMNotificationPopupActionFontSize];
}

+ (UIFont *) EMNotificationPopupSubtitleFont {
    return [UIFont fontWithName:kEMGeneralFont size:kEMNotificationPopupSubtitleFontSize];
}

+ (UIFont *) EMNotificationPopupTitleFont {
    return [UIFont fontWithName:kEMGeneralFont size:kEMNotificationPopupTitleFontSize];
}

@end