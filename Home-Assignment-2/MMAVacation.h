//
//  MMAVacation.h
//  Home-Assignment-2
//
//  Created by Desislava Stoyanova on 4/14/15.
//  Copyright (c) 2015 Desislava Stoyanova. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMAVacation : NSObject

typedef enum {
    Monastery = 0,
    Villa,
    Hotel,
    vacationAccommodationTypeMAX
} vacationAccommodationType;

@property (nonatomic,readwrite) vacationAccommodationType type;
@property (nonatomic,readwrite,strong) NSString* name;
@property (nonatomic,readwrite,strong) NSString* info;
@property (nonatomic,readwrite,strong) NSString* location;
@property (nonatomic,readwrite,strong) NSArray* openDays;
@property (nonatomic,readwrite,strong) NSNumber* price;
@property (nonatomic,readwrite,strong) NSNumber* reviewCount;
@property (nonatomic,readwrite,strong) NSString* vacationImageName;

- (id)initWithType:(vacationAccommodationType)pType name:(NSString*)pName info:(NSString*)pInfo location:(NSString*)pLocation openDays:(NSArray*)pOpenDays price:(NSNumber*)pPrice reviewCount:(NSNumber*)pReviewCount imageWithName:(NSString*) pImageName;

@end
