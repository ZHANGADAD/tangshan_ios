//
//  FuwuView.h
//  TangShan
//
//  Created by Tony on 12/21/15.
//  Copyright © 2015 Tang Shan. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol FuwuViewDelegate <NSObject>

-(void)didViewSeleted:(NSInteger)indexTab;

@end

@interface FuwuView : UIView

@property(weak,nonatomic)id<FuwuViewDelegate> delegate;

@property(strong,nonatomic)UIImageView* imageViewBg;

@property(strong,nonatomic)UIScrollView* mScrollView;

@property(strong,nonatomic)UIImageView* imageView;
@property(strong,nonatomic)UIImageView* imageViewTitle;

@property(strong,nonatomic)UIImageView* locationImageView;
@property(strong,nonatomic)UILabel* locationLable;
@property(strong,nonatomic)UILabel* logoLableJia;
@property(strong,nonatomic)UIButton* locationButton;


@property(strong,nonatomic)UIButton* button1;
@property(strong,nonatomic)UIButton* button2;
@property(strong,nonatomic)UIButton* button3;
@property(strong,nonatomic)UIButton* button4;
@property(strong,nonatomic)UIButton* button5;
@property(strong,nonatomic)UIButton* button6;
@property(strong,nonatomic)UIButton* button7;
@property(strong,nonatomic)UIButton* button8;
@property(strong,nonatomic)UIButton* button9;
@property(strong,nonatomic)UIButton* button10;


@end
