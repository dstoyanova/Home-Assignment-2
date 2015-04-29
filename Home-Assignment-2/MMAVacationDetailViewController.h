//
//  MMAVacationDetailViewController.h
//  Home-Assignment-2
//
//  Created by Desislava Stoyanova on 4/14/15.
//  Copyright (c) 2015 Desislava Stoyanova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMAVacationManager.h"

@interface MMAVacationDetailViewController : UIViewController

@property (nonatomic) NSString* receivedTitle;

@property (nonatomic) MMAVacation* receivedVacation;

@property (weak, nonatomic) IBOutlet UIButton *bookVacationButton;

@property (weak, nonatomic) IBOutlet UIImageView* vacationImage;
@property (nonatomic) NSString* receivedImageName;

@property (weak, nonatomic) IBOutlet UILabel* vacationNameLabel;
@property (nonatomic) NSString* receivedName;

@property (weak, nonatomic) IBOutlet UILabel* vacationLocationLabel;
@property (nonatomic) NSString* receivedLocation;

@property (weak, nonatomic) IBOutlet UILabel* vacationPriceLabel;
@property (nonatomic) NSString* receivedPrice;

@property (weak, nonatomic) IBOutlet UILabel* vacationOpenDaysLabel;
@property (nonatomic) NSString* receivedOpenDays;

@property (weak, nonatomic) IBOutlet UITextView* vacationDescriptionTextView;
@property (nonatomic) NSString* receivedDescription;

@end
