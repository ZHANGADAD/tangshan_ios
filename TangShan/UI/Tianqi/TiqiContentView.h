//
//  TiqiContentView.h
//  TangShan
//
//  Created by Tony on 1/31/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol TqViewDelegate <NSObject>

@optional

-(void)didZhanKaiSelect;

-(void)didShowTianQiYubao;

-(void)didShowYujing;

@end


@interface TiqiContentView : UIView

@property(weak,nonatomic)id<TqViewDelegate> delegate;

@property(strong,nonatomic)UIImageView* ADFF;

@property(strong,nonatomic)UILabel* cityLable;
@property(strong,nonatomic)UIImageView* cityImage;
@property(strong,nonatomic)UIButton* cityButton;


@property(strong,nonatomic)UILabel* weekLable;
@property(strong,nonatomic)UILabel* timeLable;

@property(strong,nonatomic)UILabel* tempLabel;
@property(strong,nonatomic)UILabel* tempLabelUnit;
@property(strong,nonatomic)UILabel* tempQingyinLable;
@property(strong,nonatomic)UIImageView* tempImage;
@property(strong,nonatomic)UILabel* fengxiangLable;
@property(strong,nonatomic)UILabel* qiyaLable;
@property(strong,nonatomic)UIButton* buttonNext;



@property(strong,nonatomic)UILabel* onedayLable;
@property(strong,nonatomic)UILabel* twodayLable;
@property(strong,nonatomic)UILabel* threedayLable;
@property(strong,nonatomic)UILabel* fourdayLable;
@property(strong,nonatomic)UILabel* fivedayLable;
@property(strong,nonatomic)UILabel* sixdayLable;

@property(strong,nonatomic)UILabel* onedayLableY;
@property(strong,nonatomic)UILabel* twodayLableY;
@property(strong,nonatomic)UILabel* threedayLableY;
@property(strong,nonatomic)UILabel* fourdayLableY;
@property(strong,nonatomic)UILabel* fivedayLableY;
@property(strong,nonatomic)UILabel* sixdayLableY;

@property(strong,nonatomic)UIImageView* oneImage;
@property(strong,nonatomic)UIImageView* twoImage;
@property(strong,nonatomic)UIImageView* threeImage;
@property(strong,nonatomic)UIImageView* fourImage;
@property(strong,nonatomic)UIImageView* fiveImage;
@property(strong,nonatomic)UIImageView* sixImage;


@property(strong,nonatomic)UILabel* onedayLableYN;
@property(strong,nonatomic)UILabel* twodayLableYN;
@property(strong,nonatomic)UILabel* threedayLableYN;
@property(strong,nonatomic)UILabel* fourdayLableYN;
@property(strong,nonatomic)UILabel* fivedayLableYN;
@property(strong,nonatomic)UILabel* sixdayLableYN;

@property(strong,nonatomic)UIImageView* oneImageN;
@property(strong,nonatomic)UIImageView* twoImageN;
@property(strong,nonatomic)UIImageView* threeImageN;
@property(strong,nonatomic)UIImageView* fourImageN;
@property(strong,nonatomic)UIImageView* fiveImageN;
@property(strong,nonatomic)UIImageView* sixImageN;


@property(strong,nonatomic)UILabel* oneTempLable;
@property(strong,nonatomic)UILabel* twoTempLable;
@property(strong,nonatomic)UILabel* threeTempLable;
@property(strong,nonatomic)UILabel* fourTempLable;
@property(strong,nonatomic)UILabel* fiveTempLable;
@property(strong,nonatomic)UILabel* sixTempLable;

@property(strong,nonatomic)UILabel* oneTempLableR;
@property(strong,nonatomic)UILabel* twoTempLableR;
@property(strong,nonatomic)UILabel* threeTempLableR;
@property(strong,nonatomic)UILabel* fourTempLableR;
@property(strong,nonatomic)UILabel* fiveTempLableR;
@property(strong,nonatomic)UILabel* sixTempLableR;

@property(strong,nonatomic)UIButton* ADASFSF;

-(void)recalView;

@end
