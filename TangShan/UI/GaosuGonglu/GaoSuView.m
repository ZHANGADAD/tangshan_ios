//
//  GaoSuView.m
//  TangShan
//
//  Created by Tony on 1/6/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "GaoSuView.h"

@implementation GaoSuView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        
        self.bgImageView=[[UIImageView alloc]initWithImage:IMAGE(@"dsffsf")];
        self.bgImageView.frame=CGRectMake(0, 0, WIDETH, HEIGHTH-44);
        [self addSubview:self.bgImageView];
        
        self.locationImageView=[[UIImageView alloc]initWithImage:IMAGE(@"location")];
        [self addSubview:self.locationImageView];
        
        self.locationButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        self.locationButton.backgroundColor=[UIColor clearColor];
        [self addSubview:self.locationButton];
        
        self.locationLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.locationLable.textColor=[UIColor whiteColor];
        self.locationLable.font=[UIFont boldSystemFontOfSize:18];
        [self addSubview:self.locationLable];
        
        self.logoLableJia=[[UILabel alloc]initWithFrame:CGRectZero];
        self.logoLableJia.textColor=[UIColor whiteColor];
        self.logoLableJia.font=[UIFont systemFontOfSize:16];
        self.logoLableJia.text=@"+";
        [self addSubview:self.logoLableJia];
        [self.logoLableJia setHidden:YES];
        
        self.mapView=[[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, WIDETH, HEIGHTH)];
        [self addSubview:self.mapView];
        
//        self.btSeach=[[UIButton alloc]initWithFrame:CGRectMake(0,0,WIDETH-80,60)];
//        self.btSeach.backgroundColor=[UIColor clearColor];
//        [self addSubview:self.btSeach];
//        self.btSeach.tag=1;
//        [self.btSeach addTarget:self action:@selector(afsa:) forControlEvents:UIControlEventTouchUpInside];
//        
//        self.bgSearch=[[UIImageView alloc]initWithImage:IMAGE(@"gaosusaoou")];
//        self.bgSearch.frame=CGRectMake(0, 0, WIDETH-40, 40);
//        self.bgSearch.contentMode=UIViewContentModeScaleAspectFit;
//        [self addSubview:self.bgSearch];
        
    
        self.buttonLukuangTOP=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        [self.buttonLukuangTOP setTitle:@"交通路况" forState:UIControlStateNormal];
        [self.buttonLukuangTOP setTitle:@"交通路况" forState:UIControlStateHighlighted];
        [self.buttonLukuangTOP setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"0xffffff"]] forState:UIControlStateNormal];
         [self.buttonLukuangTOP setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"0xfc645b"]] forState:UIControlStateSelected];
        [self.buttonLukuangTOP setTitleColor:[UIColor colorWithHexString:@"0x333333"] forState:UIControlStateNormal];
         [self.buttonLukuangTOP setTitleColor:[UIColor colorWithHexString:@"0xffffff"] forState:UIControlStateSelected];
        self.buttonLukuangTOP.titleLabel.font=[UIFont systemFontOfSize:16];
        self.buttonLukuangTOP.layer.cornerRadius=5;
        self.buttonLukuangTOP.layer.borderColor=[UIColor colorWithHexString:@"0xe2e2e2"].CGColor;
        self.buttonLukuangTOP.layer.borderWidth=0.8f;
        self.buttonLukuangTOP.clipsToBounds=YES;
        [self addSubview:self.buttonLukuangTOP];
        
        self.buttonYubao=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        [self.buttonYubao setTitle:@"天气预报" forState:UIControlStateNormal];
        [self.buttonYubao setTitle:@"天气预报" forState:UIControlStateHighlighted];
        [self.buttonYubao setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"0xffffff"]] forState:UIControlStateNormal];
        [self.buttonYubao setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"0xfc645b"]] forState:UIControlStateSelected];
        [self.buttonYubao setTitleColor:[UIColor colorWithHexString:@"0x333333"] forState:UIControlStateNormal];
        [self.buttonYubao setTitleColor:[UIColor colorWithHexString:@"0xffffff"] forState:UIControlStateSelected];
        self.buttonYubao.titleLabel.font=[UIFont systemFontOfSize:16];
        self.buttonYubao.layer.cornerRadius=5;
        self.buttonYubao.layer.borderColor=[UIColor colorWithHexString:@"0xe2e2e2"].CGColor;
        self.buttonYubao.layer.borderWidth=0.8f;
        self.buttonYubao.clipsToBounds=YES;
        [self addSubview:self.buttonYubao];
        
        self.buttonTianqi=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        [self.buttonTianqi setTitle:@"天气实况" forState:UIControlStateNormal];
        [self.buttonTianqi setTitle:@"天气实况" forState:UIControlStateHighlighted];
        [self.buttonTianqi setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"0xffffff"]] forState:UIControlStateNormal];
        [self.buttonTianqi setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"0xfc645b"]] forState:UIControlStateSelected];
        [self.buttonTianqi setTitleColor:[UIColor colorWithHexString:@"0x333333"] forState:UIControlStateNormal];
        [self.buttonTianqi setTitleColor:[UIColor colorWithHexString:@"0xffffff"] forState:UIControlStateSelected];
        self.buttonTianqi.titleLabel.font=[UIFont systemFontOfSize:16];
        self.buttonTianqi.layer.cornerRadius=5;
        self.buttonTianqi.layer.borderColor=[UIColor colorWithHexString:@"0xe2e2e2"].CGColor;
        self.buttonTianqi.layer.borderWidth=0.8f;
        self.buttonTianqi.clipsToBounds=YES;
        [self addSubview:self.buttonTianqi];
        

        
        self.mScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDETH, 80)];
        [self addSubview:self.mScrollView];
        
        self.conyentLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.conyentLable.textColor=[UIColor whiteColor];
        self.conyentLable.numberOfLines=0;
        self.conyentLable.lineBreakMode=NSLineBreakByWordWrapping;
        self.conyentLable.font=[UIFont systemFontOfSize:18];
        [self.mScrollView addSubview:self.conyentLable];
        
        
        self.bgImd=[[UIImageView alloc]initWithImage:IMAGE(@"'")];
        [self.mScrollView addSubview:self.bgImd];
        
        self.buttonCancle=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
        self.buttonCancle.backgroundColor=[UIColor redColor];
        [self.buttonCancle addTarget:self action:@selector(afsa:) forControlEvents:UIControlEventTouchUpInside];
        [self.mScrollView addSubview:self.buttonCancle];
        self.buttonCancle.tag=0;
        
        
        self.xingche=[[UIImageView alloc]initWithImage:IMAGE(@"xingchge")];
        [self addSubview:self.xingche];
        
        self.buttonLuKuang=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        self.buttonLuKuang.backgroundColor=[UIColor clearColor];
        [self addSubview:self.buttonLuKuang];
        
        self.lukuang=[[UIImageView alloc]initWithImage:IMAGE(@"daadasf")];
        [self addSubview:self.lukuang];
        
        
        self.buttonXingche=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        self.buttonXingche.backgroundColor=[UIColor clearColor];
        [self addSubview:self.buttonXingche];
        
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
    
    [self.logoLableJia sizeToFit];
    self.logoLableJia.centerY=self.locationLable.centerY;
    self.logoLableJia.left=self.locationLable.right+10;
    
    
    self.mapView.centerX=self.centerX;
    self.mapView.top=self.top+64+5;
    
//    self.btSeach.top= self.top+64+10;
//    self.btSeach.left=self.left+60;
//    
//    self.bgSearch.centerX=self.centerX;
//    self.bgSearch.top=self.top+64+10;
    
    self.buttonTianqi.centerX=self.centerX;
    self.buttonTianqi.top=self.top+64+10;
    
    self.buttonLukuangTOP.right=self.buttonTianqi.left-30;
    self.buttonLukuangTOP.centerY=self.buttonTianqi.centerY;
    
    self.buttonYubao.left=self.buttonTianqi.right+30;
    self.buttonYubao.centerY=self.buttonTianqi.centerY;
    
    self.lukuang.right=self.right-10;
    self.lukuang.top=self.buttonTianqi.bottom+15;
    
    self.buttonLuKuang.right=self.right;
    self.buttonLuKuang.centerY=self.lukuang.centerY;
    
    self.xingche.right=self.lukuang.right;
    self.xingche.top=self.lukuang.bottom+10;
    
    self.buttonXingche.right=self.right;
    self.buttonXingche.centerY=self.xingche.centerY;
    
    
    self.mScrollView.bottom=self.bottom;
    self.mScrollView.centerX=self.centerX;
    
    self.conyentLable.left=self.left+10;
    self.conyentLable.top=self.mScrollView.top;
    
    self.bgImd.top=self.mScrollView.top+30;
    self.bgImd.right=self.right-40;
    self.buttonCancle.right=self.right;
    self.buttonCancle.top=self.bgImd.top;
    
}

-(void)afsa:(UIButton*)dsafssf{
    if (self.delegate) {
        [self.delegate viewCancel:dsafssf.tag];
    }
    
}
@end
