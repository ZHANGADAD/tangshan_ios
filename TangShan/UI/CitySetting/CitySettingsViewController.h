//
//  CitySettingsViewController.h
//  TangShan
//
//  Created by Tony on 1/5/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "TSBaseViewController.h"
#import "CityView.h"



@interface CitySettingsViewController : TSBaseViewController

@property(strong,nonatomic)CityView* cityView;

@property(strong,nonatomic)NSDictionary* chooseCity;

@end
