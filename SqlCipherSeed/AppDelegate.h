//
//  AppDelegate.h
//  SqlCipherSeed
//
//  Created by Cafex-Development on 05/10/16.
//  Copyright © 2016 Cafex-Development. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
- (void) copyDatabaseIfNeeded ;
- (NSString *) getDBPath;

@end

