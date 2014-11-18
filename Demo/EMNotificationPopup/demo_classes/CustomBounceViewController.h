//
//  CustomBounceViewController.h
//  EMNotificationPopup
//
//  Created by Ennio Masi on 18/11/14.
//  Copyright (c) 2014 Ennio Masi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMNotificationPopup.h"

@interface CustomBounceViewController : UIViewController<EMNotificationPopupDelegate>

@property (nonatomic, strong) EMNotificationPopup *notificationPopup;

@end