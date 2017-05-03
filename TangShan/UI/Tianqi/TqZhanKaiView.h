//
//  TqZhanKaiView.h
//  TangShan
//
//  Created by Tony on 12/17/15.
//  Copyright © 2015 Tang Shan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TqZhanKaiViewDelegate <NSObject>

-(void)dismissView;

@end

@interface TqZhanKaiView : UIView

@property(weak,nonatomic)id<TqZhanKaiViewDelegate> delegate;

@property(strong,nonatomic)UIButton* button;

@property(strong,nonatomic)UIImageView* imageViewBg;
@property(strong,nonatomic)UIImageView* imageViewBgCover;


@property(strong,nonatomic)UIImageView* locationImageView;
@property(strong,nonatomic)UILabel* locationLable;
//@property(strong,nonatomic)UIImageView* logoImageView;
//@property(strong,nonatomic)UILabel* logoLable;
//@property(strong,nonatomic)UIImageView* shareImageView;
@property(strong,nonatomic)UILabel* logoLableJia;


@property(strong,nonatomic)UILabel* tempLabel;
@property(strong,nonatomic)UILabel* tempLabeluIY;


@property(strong,nonatomic)UILabel* qingyinLable;

@property(strong,nonatomic)UILabel* fengLable;
@property(strong,nonatomic)UILabel* fengLableContent;


@property(strong,nonatomic)UILabel* shiduLable;
@property(strong,nonatomic)UILabel* shiduLableContent;

@property(strong,nonatomic)UILabel* qiyaLable;
@property(strong,nonatomic)UILabel* qiyaLableContent;

@property(strong,nonatomic)UILabel* jiangshuiLable;
@property(strong,nonatomic)UILabel* jiangshuiLableContent;


@property(strong,nonatomic)UILabel* richuLable;
@property(strong,nonatomic)UILabel* richuLableContent;

@property(strong,nonatomic)UILabel* riluoLable;
@property(strong,nonatomic)UILabel* riluoLableContent;

@property(strong,nonatomic)UILabel* kongqiLable;
@property(strong,nonatomic)UILabel* kongqiLableContent;

@property(strong,nonatomic)UILabel* timeLable;

@property(strong,nonatomic)UIImageView* imageView;
@property(strong,nonatomic)UIImageView* imageView1;
@property(strong,nonatomic)UIImageView* imageView2;
@property(strong,nonatomic)UIImageView* imageView3;
@property(strong,nonatomic)UIImageView* imageView4;
@property(strong,nonatomic)UIImageView* imageView5;
@property(strong,nonatomic)UIImageView* imageView6;


@property(strong,nonatomic)UILabel* TEEE;
@property(strong,nonatomic)UILabel* TEEE1;
@property(strong,nonatomic)UILabel* TEEE2;
@property(strong,nonatomic)UIImageView* imageViewee;


-(void)INITwIDADAD:(NSDictionary*)content withCondition:(NSString*)condition;

-(void)getDtaa;

@end
