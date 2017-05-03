//
//  NongyeView.h
//  TangShan
//
//  Created by Tony on 12/21/15.
//  Copyright © 2015 Tang Shan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullTableView.h"



@protocol NongyeViewDelegate <NSObject>

@optional

-(void)didLocationSelect;

-(void)didShareSelect;

@end



@interface NongyeView : UIView

@property(weak,nonatomic)id<NongyeViewDelegate> delegate;

@property(strong,nonatomic)UIImageView* bgImageView;


@property(strong,nonatomic)UIImageView* locationImageView;
@property(strong,nonatomic)UILabel* locationLable;
@property(strong,nonatomic)UIButton* locationButton;

//@property(strong,nonatomic)UIImageView* logoImageView;
//@property(strong,nonatomic)UILabel* logoLable;

@property(strong,nonatomic)UIImageView* shareImageView;
@property(strong,nonatomic)UIButton* shareButton;


@property(strong,nonatomic)PullTableView* mTableView;

@end
