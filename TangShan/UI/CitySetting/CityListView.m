//
//  CityListView.m
//  TangShan
//
//  Created by Tony on 1/5/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "CityListView.h"

@interface CityListView()
@property(assign,nonatomic)NSInteger viewHeight;

@end

@implementation CityListView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        
        self.imdasDF=[[UIImageView alloc]initWithImage:IMAGE(@"citylist")];
        self.imdasDF.frame=self.frame;
        [self addSubview:self.imdasDF];
        
        if (IS_IPHONE_6P_HEIGHT) {
            self.viewHeight=400;
        }else{
            self.viewHeight=300;
        }
        
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        self.collectionmView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, WIDETH-40, self.viewHeight) collectionViewLayout:flowLayout];
        self.collectionmView.backgroundColor=[UIColor clearColor];
        [self addSubview:self.collectionmView];
        
        self.moreButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, WIDETH-40, 40)];
        [self.moreButton setTitle:@"更多城市" forState:UIControlStateNormal];
        [self.moreButton setTitle:@"更多城市" forState:UIControlStateHighlighted];
        [self.moreButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.moreButton setTitleColor:[UIColor colorWithHexString:@"0x333333"] forState:UIControlStateHighlighted];
        self.moreButton.tag=1;
        [self.moreButton addTarget:self action:@selector(butrrr:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.moreButton];
        
        self.buttonSearch=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, WIDETH, 80)];
        [self.buttonSearch setBackgroundColor:[UIColor clearColor]];
        self.buttonSearch.tag=2;
        [self.buttonSearch addTarget:self action:@selector(butrrr:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.buttonSearch];
        
        
        self.cancelButton=[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
        [self.cancelButton setBackgroundColor:[UIColor clearColor]];
        self.cancelButton.tag=0;
        [self.cancelButton addTarget:self action:@selector(butrrr:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.cancelButton];
        
        
        self.lableCity=[[UILabel alloc]initWithFrame:CGRectZero];
        self.lableCity.text=@"热门城市";
        self.lableCity.textColor=[UIColor colorWithHexString:@"0x333333"];
        self.lableCity.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.lableCity];
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.imdasDF.top=self.top;
    self.imdasDF.centerX=self.centerX;
    

    self.moreButton.centerX=self.centerX;
    self.moreButton.top=self.collectionmView.bottom+16;
    
    
    self.cancelButton.left=self.left;
    self.cancelButton.top=self.top+20;
    
    self.buttonSearch.centerX=self.centerX;
    self.buttonSearch.top=self.cancelButton.bottom;
    
    [self.lableCity sizeToFit];
    if (IS_IPHONE_6P_HEIGHT) {
        self.lableCity.top=self.buttonSearch.bottom+90;
    }else{
        self.lableCity.top=self.buttonSearch.bottom+70;
    }
    self.lableCity.left=self.left+20;
    
    
    self.collectionmView.top=self.lableCity.bottom+10;
    self.collectionmView.centerX=self.centerX;
}


-(void)butrrr:(UIButton*)BUU{
    if (self.delegate) {
        [self.delegate buttonClicked:BUU.tag];
    }
}
@end
