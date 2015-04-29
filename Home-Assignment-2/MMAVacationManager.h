//
//  MMAVacationManager.h
//  Home-Assignment-2
//
//  Created by Desislava Stoyanova on 4/14/15.
//  Copyright (c) 2015 Desislava Stoyanova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMAVacation.h"

@protocol VacationProtocol <NSObject>

@required
- (void)goOnVacation:(MMAVacation*)vacation;
- (BOOL)isVacation:(MMAVacation*)vacation openForDate:(NSDate*)date;
- (void)reviewVacation:(MMAVacation*)vacation;

@end

@interface MMAVacationManager : NSObject {
    NSMutableArray* availableVacations;
    NSMutableArray* bookedVacations;
    vacationAccommodationType chosenType;
}

@property (nonatomic,strong) NSMutableArray* availableVacations;
@property (nonatomic,strong) NSMutableArray* bookedVacations;
@property (nonatomic) vacationAccommodationType chosenType;

@property (nonatomic,weak) id<VacationProtocol> delegate;

+ (id)sharedVacation;

- (void)addVacation:(MMAVacation*)pVacation;
- (void)removeVacation:(MMAVacation*)pVacation;
- (void)bookVacation:(MMAVacation*)pVacation;
- (void)inactiveVacation:(MMAVacation*)pVacation;
- (MMAVacation*)generateVacation;

- (MMAVacation*)getLatestVacationOfType:(vacationAccommodationType) pType;

- (void)increaseReviewCountOfVacation:(MMAVacation*)pVacation;

@end
