//
//  TiqiYubaoView.h
//  TangShan
//
//  Created by chemi ios on 1/1/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TianqiContentView.h"


@interface TiqiYubaoView : UIView

@property(strong,nonatomic)UIImageView* backGroudView;

@property(strong,nonatomic)UIImageView* locationImageView;
@property(strong,nonatomic)UILabel* locationLable;
@property(strong,nonatomic)UILabel* logoLableJia;
@property(strong,nonatomic)UIButton* locationButton;



@property(strong,nonatomic)UIScrollView* mScrollView;
@property(strong,nonatomic)UIPageControl* pageControl;

@end
