//
//  NongyeView.m
//  TangShan
//
//  Created by Tony on 12/21/15.
//  Copyright © 2015 Tang Shan. All rights reserved.
//

#import "NongyeView.h"

@implementation NongyeView


-(instancetype)initWithFrame:(CGRect)frame{

    self=[super initWithFrame:frame];
    if (self) {
        
        self.bgImageView=[[UIImageView alloc]initWithImage:IMAGE(@"dsffsf")];
        self.bgImageView.frame=self.frame;
        [self addSubview:self.bgImageView];
        
        
        self.locationImageView=[[UIImageView alloc]initWithImage:IMAGE(@"location")];
        [self addSubview:self.locationImageView];
        
        self.locationLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.locationLable.textColor=[UIColor whiteColor];
        self.locationLable.font=[UIFont boldSystemFontOfSize:18];
        [self addSubview:self.locationLable];
        
        self.locationButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        [self.locationButton setBackgroundColor:[UIColor clearColor]];
        self.locationButton.tag=0;
        [self.locationButton addTarget:self action:@selector(DIDselect:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.locationButton];
        
//        self.logoImageView=[[UIImageView alloc]initWithImage:IMAGE(@"daohangicon")];
//        [self addSubview:self.logoImageView];
//        
//        self.logoLable=[[UILabel alloc]initWithFrame:CGRectZero];
//        self.logoLable.textColor=[UIColor whiteColor];
//        self.logoLable.text=@"唐山气象局";
//        self.logoLable.font=[UIFont systemFontOfSize:22];
//        [self addSubview:self.logoLable];
        
        
        self.shareImageView=[[UIImageView alloc]initWithImage:IMAGE(@"share")];
        [self addSubview:self.shareImageView];
        [self.shareImageView setHidden:YES];
        
        self.shareButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
        [self.shareButton setBackgroundColor:[UIColor clearColor]];
        self.shareButton.tag=1;
        [self.shareButton addTarget:self action:@selector(DIDselect:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.shareButton];
        [self.shareButton setHidden:YES];
        
        
        
        self.mTableView=[[PullTableView alloc]initWithFrame:CGRectMake(0, 0, WIDETH, HEIGHTH-50)];
        self.mTableView.backgroundColor=[UIColor clearColor];
        [self addSubview:self.mTableView];
        
        
    }
    return self;

}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.bgImageView.top=self.top;
    self.bgImageView.centerX=self.centerX;
    [self.locationLable sizeToFit];
    self.locationLable.centerX=self.centerX+6;
    if (IS_IPHONE_5_HEIGHT) {
        self.locationLable.top=25;
    }else if(IS_IPHONE_6P_HEIGHT){
        self.locationLable.top=35;
    }else{
        self.locationLable.top=30;
    }
    

    
    self.locationButton.centerY=self.locationLable.centerY;
    self.locationButton.left=self.left;
    
    self.locationImageView.centerY=self.locationLable.centerY;
    self.locationImageView.right=self.locationLable.left-10;
    
    
    self.shareImageView.right=self.right-15;
    self.shareImageView.centerY=self.locationImageView.centerY;
    
    self.shareButton.right=self.shareImageView.right;
    self.shareButton.centerY=self.locationImageView.centerY;
    
    self.mTableView.top=self.shareButton.bottom+10;
    self.mTableView.centerX=self.centerX;

}

-(void)DIDselect:(UIButton*)button{
    if (self.delegate) {
        NSInteger index=button.tag;
        switch (index) {
            case 0:
                if ([self.delegate respondsToSelector:@selector(didLocationSelect)]) {
                    [self.delegate didLocationSelect];
                }
                break;
            case 1:
                if ([self.delegate respondsToSelector:@selector(didShareSelect)]) {
                    [self.delegate didShareSelect];
                }
                break;
        }
        
    }
    
    
}
@end
