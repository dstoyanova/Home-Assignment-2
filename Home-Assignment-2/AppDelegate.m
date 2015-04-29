//
//  AppDelegate.m
//  Home-Assignment-2
//
//  Created by Desislava Stoyanova on 4/14/15.
//  Copyright (c) 2015 Desislava Stoyanova. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate () {
    
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // When a single user enters application into background,
    // the prices of all available vacations will be increased by 20 per cent
    NSMutableArray* vacations = [[MMAVacationManager sharedVacation] availableVacations];
    for (int i=0; i<[vacations count]; i++) {
        MMAVacation* temp = [vacations objectAtIndex:i];
        temp.price = [NSNumber numberWithDouble:[[temp price] doubleValue] * 1.20];
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

@end
