//
//  CitySearchViewController.h
//  TangShan
//
//  Created by Tony on 1/7/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "TSBaseViewController.h"

#import "CitySearchView.h"

@protocol CitySearchViewControllerDelegate <NSObject>


-(void)afaffaf:(NSDictionary*)adaff;

@end

@interface CitySearchViewController : TSBaseViewController

@property(assign,nonatomic)NSInteger type;

@property(strong,nonatomic)CitySearchView* citySearchView;

@property(weak,nonatomic)id<CitySearchViewControllerDelegate> delegate;

@end
