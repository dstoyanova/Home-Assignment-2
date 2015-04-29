//
//  ViewController.m
//  Home-Assignment-2
//
//  Created by Desislava Stoyanova on 4/14/15.
//  Copyright (c) 2015 Desislava Stoyanova. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Accommodation";
    
    MMAVacationManager* sharedMyVacation = [MMAVacationManager sharedVacation];
    
    MMAVacation* v1 = [[MMAVacation alloc] initWithType:Monastery
                                                   name:@"St. Mina"
                                                   info:[NSString stringWithFormat:@"Mного чудеса са станали пред чудотворната иконата на свети Мина в Обрадовския манастир. Той се намира само на 7 километра североизточно от центъра на София, в квартал Бенковски. Местният свещеник и стопанин на обителта разказва, че голямата икона на свети мъченик Мина е източник на Божия милост. 'Не са един или двама изцелените тук. Знаете ли за какви чудеса зная - косите ви могат да настръхнат!' - споделя отецът. 'От няколко години се опитваме да описваме чудните разкази. Хората не искат имената им да се знаят, но на драго сърце споделят, защото искат така да благодарят на Бога за милостта и да го прославят. Да, тук са се изцелявали от рак по молитвите на свети Мина. Но за мен е по-важно, че всички са се излекували от неверие и идват пак', разказва свещеникът. Жени от цялата страна идват да се помолят на светията да им помогне за рожба и сполучлив брак. Поклонниците казват, че иконата има могъща изцелителна сила и ако човек силно вярва, може да се избави от тежки болести."]
                                               location:@"Sofia"
                                               openDays:[NSArray arrayWithObjects:@"Wednesday", @"Thursday", @"Friday", @"Saturday", @"Sunday", nil]
                                                  price:[NSNumber numberWithDouble:20]
                                            reviewCount:[NSNumber numberWithInt:0]
                                          imageWithName:@"Monastery.jpg"];
    MMAVacation* v2 = [[MMAVacation alloc] initWithType:Villa
                                                   name:@"Beklemeto"
                                                   info:[NSString stringWithFormat:@"Ловният дом се намира в планинския курортен комплекс Беклемето - 1360 м надморска височина, разположен в една от най-красивите части на Национален парк Централен Балкан, който е запазил очарованието и девствеността на дивата природа, предлага прекрасни възможности за активни развлечения и пълноценен отдих. Ловният дом е отлично място за активна почивка, бизнес срещи, семинари, тийм билдинг, приятелски и семейни тържества и почивки, зелени и бели училища, детски лагери. Курортът разполага с 2 км писти за алпийски ски, както и отлична писта за ски-бягане. Беклемето предлага удобни за зимни и летни преходи планински терени - от тук тръгват туристически маршрути към хижа 'Дерменка', хижа 'Козя стена', хижа 'Чучул', заслон 'Орлово гнездо', хижа 'Ехо' и др."]
                                               location:@"Troyan"
                                               openDays:[NSArray arrayWithObjects:@"Friday", @"Saturday", @"Sunday", @"Monday", nil]
                                                  price:[NSNumber numberWithDouble:60]
                                            reviewCount:[NSNumber numberWithInt:0]
                                          imageWithName:@"Beklemeto.jpg"];
    MMAVacation* v3 = [[MMAVacation alloc] initWithType:Hotel
                                                   name:@"Grand Hotel Velingrad"
                                                   info:[NSString stringWithFormat:@"The town of Velingrad is located in a most picturesque valley of the Chepinska river at a height of 750 meters above sea level. The mild and lovely climate is a perfect addition to the beautiful nature around. Winter is not hard, summer cool while autumn is warmer than spring. The sun is shining in this town for the better part of the year. Velingrad is rich in mineral springs suitable for treatment of different diseases such as ones of the nervous system, gynaecological diseases, diseases of the lungs and many others. With its variety of the types of mineral springs Velingrad occupies the first place in Bulgaria. The area surrounding Velingrad is extremely lovely – deep pine-tree forests, beautiful meadows and crystal clear rivers."]
                                               location:@"Velingrad"
                                               openDays:[NSArray arrayWithObjects:@"Monday", @"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday", @"Sunday", nil]
                                                  price:[NSNumber numberWithDouble:130]
                                            reviewCount:[NSNumber numberWithInt:0]
                                          imageWithName:@"Hotel.jpg"];
    [sharedMyVacation addVacation:v1];
    [sharedMyVacation addVacation:v2];
    [sharedMyVacation addVacation:v3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    MMAVacationDetailViewController* destViewController = segue.destinationViewController;
    MMAVacation* vacation = nil;
    if ([segue.identifier isEqualToString:@"monastery"]) {
        destViewController.receivedTitle = @"Monastery";
        vacation = [[MMAVacationManager sharedVacation] getLatestVacationOfType:Monastery];
    }
    else if ([segue.identifier isEqualToString:@"villa"]) {
        destViewController.receivedTitle = @"Villa";
        vacation = [[MMAVacationManager sharedVacation] getLatestVacationOfType:Villa];
    }
    else if ([segue.identifier isEqualToString:@"hotel"]) {
        destViewController.receivedTitle = @"Hotel";
        vacation = [[MMAVacationManager sharedVacation] getLatestVacationOfType:Hotel];
    }
    destViewController.receivedVacation = vacation;
    destViewController.receivedImageName = [vacation vacationImageName];
    destViewController.receivedName = [vacation name];
    destViewController.receivedLocation = [vacation location];
    destViewController.receivedPrice = [NSString stringWithFormat:@"%.2f BGN",[[vacation price] doubleValue]];
    destViewController.receivedOpenDays = [NSString stringWithFormat:@"%@ to %@", [[vacation openDays] firstObject], [[vacation openDays] lastObject]];
    destViewController.receivedDescription = [vacation info];
}

@end
