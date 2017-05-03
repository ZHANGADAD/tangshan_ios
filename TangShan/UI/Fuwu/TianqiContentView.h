//
//  TianqiContentView.h
//  TangShan
//
//  Created by chemi ios on 2/27/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMSegmentedControl.h"
#import "TiqiIndicatorView.h"
#import "UULineChart.h"

#define GraphViewWenDuHeight 150

@interface TianqiContentView : UIView

-(instancetype)initWithFrame:(CGRect)frame isFuture:(BOOL)isFuture;

@property(strong,nonatomic)HMSegmentedControl* segementWendu;
@property(strong,nonatomic)UILabel* lableWenDuTime;
@property(strong,nonatomic)UIScrollView* mTempScrollView;
@property(strong,nonatomic)TiqiIndicatorView* indicatorView;

@end
