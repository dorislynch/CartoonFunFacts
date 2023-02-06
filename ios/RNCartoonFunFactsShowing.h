//
//  RNCartoonFunFactsShowing.h
//  RNCartoonFunFacts
//
//  Created by Charm on 2/6/23.
//  Copyright © 2023 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTBridgeDelegate.h>
#import <UserNotifications/UNUserNotificationCenter.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNCartoonFunFactsShowing : UIResponder<RCTBridgeDelegate, RCTBridgeModule, UNUserNotificationCenterDelegate>

+ (instancetype)cartoonFunFacts_shared;
- (BOOL)cartoonFunFacts_showThisWay;
- (UIInterfaceOrientationMask)cartoonFunFacts_getOrientation;
- (UIViewController *)cartoonFunFacts_changeRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions;

@end

NS_ASSUME_NONNULL_END
