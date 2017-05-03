//
//  CityListViewController.h
//  TangShan
//
//  Created by Tony on 1/5/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "TSBaseViewController.h"
#import "CityListView.h"



@protocol CityListViewControllerDelegate <NSObject>

-(void)getChooseCity:(NSDictionary*)diction;

@end

@interface CityListViewController : TSBaseViewController

@property(strong,nonatomic)CityListView* cityListView;


@property(weak,nonatomic)id<CityListViewControllerDelegate> delegate;

@end
