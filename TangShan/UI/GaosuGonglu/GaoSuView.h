//
//  GaoSuView.h
//  TangShan
//
//  Created by Tony on 1/6/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GaoSuViewDelegate <NSObject>

-(void)viewCancel:(NSInteger)index;

@end

@interface GaoSuView : UIView

@property(weak,nonatomic)id<GaoSuViewDelegate> delegate;

@property(strong,nonatomic)UIImageView* bgImageView;
@property(strong,nonatomic)UIImageView* locationImageView;
@property(strong,nonatomic)UILabel* locationLable;
@property(strong,nonatomic)UILabel* logoLableJia;
@property(strong,nonatomic)UIButton* locationButton;


//@property(strong,nonatomic)UIImageView* bgSearch;
//@property(strong,nonatomic)UIButton* btSeach;
@property(strong,nonatomic)BMKMapView* mapView;

@property(strong,nonatomic)UIImageView* lukuang;
@property(strong,nonatomic)UIImageView* xingche;
@property(strong,nonatomic)UIButton* buttonLuKuang;
@property(strong,nonatomic)UIButton* buttonXingche;

@property(strong,nonatomic)UIButton* buttonLukuangTOP;
@property(strong,nonatomic)UIButton* buttonTianqi;
@property(strong,nonatomic)UIButton* buttonYubao;



@property(strong,nonatomic)UIScrollView* mScrollView;

@property(strong,nonatomic)UILabel* conyentLable;

@property(strong,nonatomic)UIImageView* bgImd;

@property(strong,nonatomic)UIButton* buttonCancle;

@end
