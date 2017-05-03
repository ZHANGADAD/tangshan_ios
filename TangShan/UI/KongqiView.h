//
//  KongqiView.h
//  TangShan
//
//  Created by chemi ios on 2/27/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TiqiIndicatorView.h"


@interface KongqiView : UIView



@property(strong,nonatomic)UIImageView* backGroudView;

@property(strong,nonatomic)UIImageView* locationImageView;
@property(strong,nonatomic)UILabel* locationLable;
@property(strong,nonatomic)UILabel* logoLableJia;
@property(strong,nonatomic)UIButton* locationButton;


@property(strong,nonatomic)UILabel* aaaa;

@property(strong,nonatomic)UIScrollView* mTempScrollView;
@property(strong,nonatomic)TiqiIndicatorView* indicatorView;


@end
