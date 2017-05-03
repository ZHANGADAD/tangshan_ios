//
//  YujingDetailsViewController.h
//  TangShan
//
//  Created by Tony on 1/25/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "TSBaseViewController.h"
#import "YujingDetailsView.h"


@interface YujingDetailsViewController : TSBaseViewController

@property(strong,nonatomic)NSDictionary* mDictionary;


@property(strong,nonatomic)YujingDetailsView* yujingDetailsView;
@end
