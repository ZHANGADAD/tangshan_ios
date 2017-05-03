//
//  SettingsView.h
//  TangShan
//
//  Created by Tony on 1/12/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//


#import <UIKit/UIKit.h>

@protocol SettingsViewDelegate <NSObject>

-(void)didSelect:(NSInteger)index;

@end

@interface SettingsView : UIView

@property(weak,nonatomic)id<SettingsViewDelegate> delegate;

@property(strong,nonatomic)UIImageView* bgImageView;

@property(strong,nonatomic)UIScrollView* mScrollView;
@property(strong,nonatomic)UILabel* locationLable;

@property(strong,nonatomic)UILabel* lable1;
@property(strong,nonatomic)UIImageView* imageView1;
@property(strong,nonatomic)UIButton* button1;
@property(strong,nonatomic)UIView* view1;


@property(strong,nonatomic)UILabel* lable2;
@property(strong,nonatomic)UISwitch* uiSwitch;
@property(strong,nonatomic)UIView* view2;
@property(strong,nonatomic)UIView* view1111;

@property(strong,nonatomic)UILabel* lable3;
@property(strong,nonatomic)UIImageView* imageView3;
@property(strong,nonatomic)UIButton* button3;
@property(strong,nonatomic)UIView* view3;

@property(strong,nonatomic)UILabel* lable4;
@property(strong,nonatomic)UIButton* button4;
@property(strong,nonatomic)UIView* view4;

@property(strong,nonatomic)UILabel* lable6;
@property(strong,nonatomic)UIImageView* imageView6;
@property(strong,nonatomic)UIButton* button6;


@end
