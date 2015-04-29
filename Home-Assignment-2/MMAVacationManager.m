//
//  MMAVacationManager.m
//  Home-Assignment-2
//
//  Created by Desislava Stoyanova on 4/14/15.
//  Copyright (c) 2015 Desislava Stoyanova. All rights reserved.
//

#import "MMAVacationManager.h"

@implementation MMAVacationManager

@synthesize availableVacations;
@synthesize bookedVacations;
@synthesize chosenType;

- (id)init {
    if (self = [super init]) {
        availableVacations = [NSMutableArray array];
        bookedVacations = [NSMutableArray array];
        chosenType = (arc4random() % (int) vacationAccommodationTypeMAX);
    }
    return self;
}

+ (id)sharedVacation {
    static MMAVacationManager *sharedMyVacation = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyVacation = [[self alloc] init];
    });
    return sharedMyVacation;
}

- (void)addVacation:(MMAVacation*)pVacation {
    [availableVacations addObject:pVacation];
}

- (void)removeVacation:(MMAVacation*)pVacation {
    [availableVacations removeObject:pVacation];
    if ([bookedVacations containsObject:pVacation]) {
        [bookedVacations removeObject:pVacation];
    }
}

- (void)bookVacation:(MMAVacation*)pVacation {
    if ([self.delegate isVacation:pVacation openForDate:[NSDate date]]) {
        [bookedVacations addObject:pVacation];
        
        [self.delegate goOnVacation:pVacation];
    }
    else {
        NSLog(@"%@ is not available for today.",[pVacation name]);
    }
}

- (void)inactiveVacation:(MMAVacation*)pVacation {
    if ([bookedVacations containsObject:pVacation]) {
        [bookedVacations removeObject:pVacation];
    }
}

- (MMAVacation*)generateVacation {
    NSUInteger randomIndex = arc4random() % [availableVacations count];
    MMAVacation* randomVacation = [availableVacations objectAtIndex:randomIndex];
    return randomVacation;
}

- (MMAVacation*)getLatestVacationOfType:(vacationAccommodationType)pType {
    NSUInteger latestIndex = -1;
    for (int i=0; i < [availableVacations count]; i++) {
        MMAVacation* pVacation = [availableVacations objectAtIndex:i];
        if (pVacation.type == pType) {
            latestIndex = i;
        }
    }
    return [availableVacations objectAtIndex:latestIndex];
}

- (void)increaseReviewCountOfVacation:(MMAVacation *)pVacation {
    if (pVacation) {
        NSLog(@"Old value: %i",[pVacation.reviewCount intValue]);
        pVacation.reviewCount = [NSNumber numberWithInt:[pVacation.reviewCount intValue] + 1];
        NSLog(@"New value: %i",[pVacation.reviewCount intValue]);
        [self.delegate reviewVacation:pVacation];
    }
}

@end
