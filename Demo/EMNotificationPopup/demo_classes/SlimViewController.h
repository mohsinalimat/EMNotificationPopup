//
//  ViewController.h
//  EMNotificationPopup
//
//  Created by Ennio Masi on 23/07/14.
//  Copyright (c) 2014 Ennio Masi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMNotificationPopup.h"

@interface SlimViewController : UIViewController<EMNotificationPopupDelegate>

@property (nonatomic, strong) EMNotificationPopup *notificationPopup;

@end