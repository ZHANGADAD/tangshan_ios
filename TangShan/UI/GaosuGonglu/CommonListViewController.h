//
//  CommonListViewController.h
//  TangShan
//
//  Created by Tony on 1/27/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "TSBaseViewController.h"
#import "CommonListView.h"

@interface CommonListViewController : TSBaseViewController

@property(assign,nonatomic)NSInteger indexTable;
@property(strong,nonatomic)CommonListView* mCommonView;

@end
