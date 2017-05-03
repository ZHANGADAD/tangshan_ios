//
//  TimeChooseViewController.h
//  TangShan
//
//  Created by Tony on 1/12/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "TSBaseViewController.h"
#import "TimeView.h"


@protocol TimeChooseViewControllerDelegate <NSObject>

-(void)getTimne:(NSString*)adsaff withString:(NSString*)adFAS;

@end

@interface TimeChooseViewController : TSBaseViewController


@property(weak,nonatomic)id<TimeChooseViewControllerDelegate> delegate;


@property(strong,nonatomic)TimeView* DAAsf;
@end
