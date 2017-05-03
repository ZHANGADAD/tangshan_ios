//
//  CityView.h
//  TangShan
//
//  Created by Tony on 1/5/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CityViewDelegate <NSObject>

-(void)buttonClicked:(NSInteger)index;

@end


@interface CityView : UIView

@property(strong,nonatomic)UIImageView* BADAD;

@property(weak,nonatomic)id<CityViewDelegate>delegate;

@property(strong,nonatomic)UIImageView* editImageView;
@property(strong,nonatomic)UIImageView* editImageViewCCC;

@property(strong,nonatomic)UIButton* backButton;
@property(strong,nonatomic)UIButton* editButton;
@property(strong,nonatomic)UIButton* addButton;

@property(strong,nonatomic)UITableView* mTableView;

@end
