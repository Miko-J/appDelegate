//
//  PHIAppdelegate.m
//
//
//  Created by  on 16/04/2018.
//  Copyright © 2018 PHICOMM. All rights reserved.
//

#import "PHIBaseAppDelegate.h"
#import "PHIEngine.h"

@implementation PHIBaseAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions {
    return [PHIEngine.shared application:application didFinishLaunchingWithOptions:launchOptions];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    [PHIEngine.shared applicationWillEnterForeground:application];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [PHIEngine.shared applicationDidBecomeActive:application];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [PHIEngine.shared applicationWillResignActive:application];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [PHIEngine.shared applicationDidEnterBackground:application];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [PHIEngine.shared applicationWillTerminate:application];
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    [PHIEngine.shared applicationDidReceiveMemoryWarning:application];
}

- (void)applicationSignificantTimeChange:(UIApplication *)application {
    [PHIEngine.shared applicationSignificantTimeChange:application];
}

#pragma mark - Notification

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    [PHIEngine.shared application:application didFailToRegisterForRemoteNotificationsWithError:error];
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    [PHIEngine.shared application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings NS_DEPRECATED_IOS(8_0, 10_0, "Use UserNotifications Framework's -[UNUserNotificationCenter requestAuthorizationWithOptions:completionHandler:]")__TVOS_PROHIBITED {
    [PHIEngine.shared application:application didRegisterUserNotificationSettings:notificationSettings];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo NS_DEPRECATED_IOS(3_0, 10_0, "Use UserNotifications Framework's -[UNUserNotificationCenterDelegate willPresentNotification:withCompletionHandler:] or -[UNUserNotificationCenterDelegate didReceiveNotificationResponse:withCompletionHandler:] for user visible notifications and -[UIApplicationDelegate application:didReceiveRemoteNotification:fetchCompletionHandler:] for silent remote notifications") {
    [PHIEngine.shared application:application didReceiveRemoteNotification:userInfo];
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification NS_DEPRECATED_IOS(4_0, 10_0, "Use UserNotifications Framework's -[UNUserNotificationCenterDelegate willPresentNotification:withCompletionHandler:] or -[UNUserNotificationCenterDelegate didReceiveNotificationResponse:withCompletionHandler:]")__TVOS_PROHIBITED {
    [PHIEngine.shared application:application didReceiveLocalNotification:notification];
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void (^)())completionHandler NS_DEPRECATED_IOS(8_0, 10_0, "Use UserNotifications Framework's -[UNUserNotificationCenterDelegate didReceiveNotificationResponse:withCompletionHandler:]")__TVOS_PROHIBITED {
    [PHIEngine.shared application:application handleActionWithIdentifier:identifier forLocalNotification:notification completionHandler:completionHandler];
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void (^)())completionHandler NS_DEPRECATED_IOS(9_0, 10_0, "Use UserNotifications Framework's -[UNUserNotificationCenterDelegate didReceiveNotificationResponse:withCompletionHandler:]")__TVOS_PROHIBITED {
    [PHIEngine.shared application:application handleActionWithIdentifier:identifier forRemoteNotification:userInfo withResponseInfo:responseInfo completionHandler:completionHandler];
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void (^)())completionHandler NS_DEPRECATED_IOS(8_0, 10_0, "Use UserNotifications Framework's -[UNUserNotificationCenterDelegate didReceiveNotificationResponse:withCompletionHandler:]")__TVOS_PROHIBITED {
    [PHIEngine.shared application:application handleActionWithIdentifier:identifier forRemoteNotification:userInfo completionHandler:completionHandler];
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forLocalNotification:(UILocalNotification *)notification withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void (^)())completionHandler NS_DEPRECATED_IOS(9_0, 10_0, "Use UserNotifications Framework's -[UNUserNotificationCenterDelegate didReceiveNotificationResponse:withCompletionHandler:]")__TVOS_PROHIBITED {
    [PHIEngine.shared application:application handleActionWithIdentifier:identifier forLocalNotification:notification withResponseInfo:responseInfo completionHandler:completionHandler];
}

#pragma mark - fetch Completion
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    [PHIEngine.shared application:application didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
}

- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler {
    [PHIEngine.shared application:application performFetchWithCompletionHandler:completionHandler];
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL succeeded))completionHandler NS_AVAILABLE_IOS(9_0)__TVOS_PROHIBITED {
    [PHIEngine.shared application:application performActionForShortcutItem:shortcutItem completionHandler:completionHandler];
}

- (void)application:(UIApplication *)application handleEventsForBackgroundURLSession:(NSString *)identifier completionHandler:(void (^)(void))completionHandler {
    [PHIEngine.shared application:application handleEventsForBackgroundURLSession:identifier completionHandler:completionHandler];
}

- (void)application:(UIApplication *)application handleWatchKitExtensionRequest:(nullable NSDictionary *)userInfo reply:(void (^)(NSDictionary *__nullable replyInfo))reply {
    [PHIEngine.shared application:application handleWatchKitExtensionRequest:userInfo reply:reply];
}

- (void)applicationShouldRequestHealthAuthorization:(UIApplication *)application {
    [PHIEngine.shared applicationShouldRequestHealthAuthorization:application];
}

#pragma mark - open url
// iOS9 之前
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [PHIEngine.shared application:application handleOpenURL:url];
}

// iOS9 之前
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [PHIEngine.shared application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
}

//// iOS9 之后
//- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(nonnull NSDictionary *)options {
//    if (@available(iOS 9.0, *)) {
//        return [PHIEngine.shared application:app openURL:url options:options];
//    } else {
//        // Fallback on earlier versions
//        return NO;
//    }
//}

#pragma mark - User Activity Continuation protocol adopted by UIApplication delegate
// Called on the main thread as soon as the user indicates they want to continue an activity in your application. The NSUserActivity object may not be available instantly,
// so use this as an opportunity to show the user that an activity will be continued shortly.
// For each application:willContinueUserActivityWithType: invocation, you are guaranteed to get exactly one invocation of application:continueUserActivity: on success,
// or application:didFailToContinueUserActivityWithType:error: if an error was encountered.
- (BOOL)application:(UIApplication *)application willContinueUserActivityWithType:(NSString *)userActivityType {
    return [PHIEngine.shared application:application willContinueUserActivityWithType:userActivityType];
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray *__nullable restorableObjects))restorationHandler {
    return [PHIEngine.shared application:application continueUserActivity:userActivity restorationHandler:restorationHandler];
}

// If the user activity cannot be fetched after willContinueUserActivityWithType is called, this will be called on the main thread when implemented.
- (void)application:(UIApplication *)application didFailToContinueUserActivityWithType:(NSString *)userActivityType error:(NSError *)error {
    [PHIEngine.shared application:application didFailToContinueUserActivityWithType:userActivityType error:error];
}

- (void)application:(UIApplication *)application didUpdateUserActivity:(NSUserActivity *)userActivity {
    [PHIEngine.shared application:application didUpdateUserActivity:userActivity];
}

#pragma mark - CloudKit Sharing Invitation Handling
- (void)application:(UIApplication *)application userDidAcceptCloudKitShareWithMetadata:(CKShareMetadata *)cloudKitShareMetadata NS_AVAILABLE_IOS(10_0) {
    [PHIEngine.shared application:application userDidAcceptCloudKitShareWithMetadata:cloudKitShareMetadata];
}

@end
