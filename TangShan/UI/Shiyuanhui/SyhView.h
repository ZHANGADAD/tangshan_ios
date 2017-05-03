//
//  SyhView.h
//  TangShan
//
//  Created by Tony on 12/17/15.
//  Copyright © 2015 Tang Shan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SyhViewDelegate <NSObject>

@optional


-(void)didShareSelect;

-(void)didShowMain;

-(void)didSHOwSound;

-(void)showZhexian;

@end



@interface SyhView : UIView

@property(weak,nonatomic)id<SyhViewDelegate> delegate;

@property(strong,nonatomic)UIImageView* ADFF;

@property(strong,nonatomic)UIImageView* backGroudView;

@property(strong,nonatomic)UIImageView* locationImageView;
@property(strong,nonatomic)UILabel* locationLable;
@property(strong,nonatomic)UILabel* logoLableJia;
@property(strong,nonatomic)UIButton* locationButton;

//@property(strong,nonatomic)UIImageView* logoImageView;
//@property(strong,nonatomic)UILabel* logoLable;
//@property(strong,nonatomic)UIImageView* shareImageView;
@property(strong,nonatomic)UIButton* shareButton;

@property(strong,nonatomic)UIScrollView* afdsafsafdsgsagsagd;
@property(strong,nonatomic)UIPageControl* adsaFFSAF;

@property(strong,nonatomic)UIImageView* conditionImage;
@property(strong,nonatomic)UILabel* conditionLable;
@property(strong,nonatomic)UIButton* conditionButton;




@property(strong,nonatomic)UIImageView* homeImage;
@property(strong,nonatomic)UIButton* homeButton;
@property(strong,nonatomic)UIImageView* souundImage;
@property(strong,nonatomic)UIButton* soundButton;
@property(strong,nonatomic)UIImageView* zhexianImage;
@property(strong,nonatomic)UIButton* zhexianButton;




@property(strong,nonatomic)UILabel* yubaoLable;
@property(strong,nonatomic)UIImageView* coverImageView;
@property(strong,nonatomic)UIImageView* dividerImageView;

@end
