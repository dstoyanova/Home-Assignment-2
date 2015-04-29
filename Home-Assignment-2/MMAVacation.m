//
//  MMAVacation.m
//  Home-Assignment-2
//
//  Created by Desislava Stoyanova on 4/14/15.
//  Copyright (c) 2015 Desislava Stoyanova. All rights reserved.
//

#import "MMAVacation.h"

@implementation MMAVacation

- (id)init {
    return [self initWithType:(vacationAccommodationType) (arc4random() % (int) vacationAccommodationTypeMAX)
                         name:@"Default name"
                         info:@"Default description"
                     location:@"Default location"
                     openDays:[NSArray arrayWithObjects:@"Monday",@"Tuesday",@"Wednesday",@"Thursday",@"Friday", nil]
                        price:[NSNumber numberWithDouble:0]
                  reviewCount:[NSNumber numberWithInt:0]
                imageWithName:@"Default.jpg"];
}

- (id)initWithType:(vacationAccommodationType)pType name:(NSString *)pName info:(NSString *)pInfo location:(NSString *)pLocation openDays:(NSArray *)pOpenDays price:(NSNumber *)pPrice reviewCount:(NSNumber *)pReviewCount  imageWithName:(NSString *)pImageName {
    if (self = [super init]) {
        _type = pType;
        _name = pName;
        _info = pInfo;
        _location = pLocation;
        _openDays = pOpenDays;
        _price = pPrice;
        _reviewCount = pReviewCount;
        _vacationImageName = pImageName;
    }
    return self;
}

@end
