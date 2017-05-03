//
//  CityListView.h
//  TangShan
//
//  Created by Tony on 1/5/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol CityListViewDelegate <NSObject>

-(void)buttonClicked:(NSInteger)indexButton;

@end

@interface CityListView : UIView

@property(weak,nonatomic)id<CityListViewDelegate> delegate;

@property(strong,nonatomic)UIImageView* imdasDF;

@property(strong,nonatomic)UIButton* buttonSearch;

@property(strong,nonatomic)UIButton* cancelButton;

@property(strong,nonatomic)UICollectionView* collectionmView;

@property(strong,nonatomic)UIButton* moreButton;

@property(strong,nonatomic)UILabel* lableCity;

@end
