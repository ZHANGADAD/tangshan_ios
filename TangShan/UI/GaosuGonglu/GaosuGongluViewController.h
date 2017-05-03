//
//  GaosuGongluViewController.h
//  TangShan
//
//  Created by Tony on 1/6/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "TSBaseViewController.h"

#import "GaoSuView.h"

@interface GaosuGongluViewController : TSBaseViewController<GaoSuViewDelegate>

@property(strong,nonatomic)GaoSuView* gaoSuView;

@end
