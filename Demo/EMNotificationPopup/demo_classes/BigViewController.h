//
//  BigViewController.h
//  EMNotificationPopup
//
//  Created by Ennio Masi on 07/08/14.
//  Copyright (c) 2014 Ennio Masi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMNotificationPopup.h"

@interface BigViewController : UIViewController<EMNotificationPopupDelegate>

@property (nonatomic, strong) EMNotificationPopup *notificationPopup;

@end