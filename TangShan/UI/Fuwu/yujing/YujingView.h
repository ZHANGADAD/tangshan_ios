//
//  YujingView.h
//  TangShan
//
//  Created by Tony on 12/22/15.
//  Copyright © 2015 Tang Shan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullTableView.h"


@interface YujingView : UIView
 
@property(strong,nonatomic)UIImageView* bgImageView;

@property(strong,nonatomic)UILabel* locationLable;
@property(strong,nonatomic)UIImageView* locationImageView;
@property(strong,nonatomic)UIButton* locationButton;


@property(strong,nonatomic)UILabel* noData;

@property(strong,nonatomic)PullTableView* mTableView;

@end
