//
//  PHIAppdelegate.h
//
//
//  Created by  on 16/04/2018.
//  Copyright © 2018 PHICOMM. All rights reserved.
//

#import <UIKit/UIKit.h>

#define APPDELEGATE ((PHIBaseAppDelegate *)[[UIApplication sharedApplication] delegate])

@interface PHIBaseAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
