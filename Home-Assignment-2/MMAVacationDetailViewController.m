//
//  MMAVacationDetailViewController.m
//  Home-Assignment-2
//
//  Created by Desislava Stoyanova on 4/14/15.
//  Copyright (c) 2015 Desislava Stoyanova. All rights reserved.
//

#import "MMAVacationDetailViewController.h"

@interface MMAVacationDetailViewController () <VacationProtocol>

@end

@implementation MMAVacationDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = _receivedTitle;
    
    MMAVacationManager* sharedMyVacation = [MMAVacationManager sharedVacation];
    
    sharedMyVacation.delegate = self;
    
    [self.vacationImage setImage:[UIImage imageNamed:_receivedImageName]];
    self.vacationNameLabel.text = _receivedName;
    self.vacationLocationLabel.text = _receivedLocation;
    self.vacationPriceLabel.text = _receivedPrice;
    self.vacationOpenDaysLabel.text = _receivedOpenDays;
    self.vacationDescriptionTextView.text = _receivedDescription;
    
    UIScrollView* detailScreenScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    detailScreenScrollView.contentSize = CGSizeMake(320, 950);
    [self.view addSubview:detailScreenScrollView];
    
    [detailScreenScrollView addSubview:self.bookVacationButton];
    [detailScreenScrollView addSubview:self.vacationImage];
    [detailScreenScrollView addSubview:self.vacationNameLabel];
    [detailScreenScrollView addSubview:self.vacationLocationLabel];
    [detailScreenScrollView addSubview:self.vacationPriceLabel];
    [detailScreenScrollView addSubview:self.vacationOpenDaysLabel];
    [detailScreenScrollView addSubview:self.vacationDescriptionTextView];
    
    [sharedMyVacation increaseReviewCountOfVacation:_receivedVacation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)goOnVacation:(MMAVacation*)vacation {
    NSLog(@"Vacation %@ has been booked successfully.",[vacation name]);
}

- (BOOL)isVacation:(MMAVacation*)vacation openForDate:(NSDate*)date {
    NSDateFormatter* df = [[NSDateFormatter alloc] init];
    df.dateFormat = @"EEEE";
    NSString* weekday = [[df stringFromDate:date] capitalizedString];
    if ([[vacation openDays] containsObject:weekday]) {
        return YES;
    }
    return NO;
}

- (void)reviewVacation:(MMAVacation*)vacation {
    NSLog(@"The review count of %@ has been increased successfully.",[vacation name]);
}

- (IBAction)bookVacation:(id)sender {
    [[MMAVacationManager sharedVacation] bookVacation:_receivedVacation];
}

@end
