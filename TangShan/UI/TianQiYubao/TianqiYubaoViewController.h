//
//  TianqiYubaoViewController.h
//  TangShan
//
//  Created by chemi ios on 1/1/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "TSBaseViewController.h"
#import "TiqiYubaoView.h"

@interface TianqiYubaoViewController : TSBaseViewController

@property(strong,nonatomic)TiqiYubaoView* tianQiYubaoView;

@property(strong,nonatomic)NSDictionary* dictionary;

@property(assign,nonatomic)BOOL isFuture;


@property(strong,nonatomic)NSString* sNum;

@property(strong,nonatomic)NSString* sName;




@end
