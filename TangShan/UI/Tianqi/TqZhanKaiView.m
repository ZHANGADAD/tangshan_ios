//
//  TqZhanKaiView.m
//  TangShan
//
//  Created by Tony on 12/17/15.
//  Copyright © 2015 Tang Shan. All rights reserved.
//

#import "TqZhanKaiView.h"

@implementation TqZhanKaiView


-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        
        
        
        self.imageViewBg=[[UIImageView alloc]initWithImage:IMAGE(@"dsffsf")];
        self.imageViewBg.frame=self.frame;
        [self addSubview:self.imageViewBg];
        
        
        
        self.locationImageView=[[UIImageView alloc]initWithImage:IMAGE(@"location")];
        [self addSubview:self.locationImageView];
        
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
        
        //        self.logoImageView=[[UIImageView alloc]initWithImage:IMAGE(@"daohangicon")];
        //        [self addSubview:self.logoImageView];
        
        //        self.logoLable=[[UILabel alloc]initWithFrame:CGRectZero];
        //        self.logoLable.textColor=[UIColor whiteColor];
        //        self.logoLable.text=@"唐山气象局";
        //        self.logoLable.font=[UIFont systemFontOfSize:22];
        //        [self addSubview:self.logoLable];
        
        
        //        self.shareImageView=[[UIImageView alloc]initWithImage:IMAGE(@"share")];
        //        [self addSubview:self.shareImageView];
        
        
       
        
        
        self.tempLabel=[[UILabel alloc]initWithFrame:CGRectZero];
        self.tempLabel.textColor=[UIColor whiteColor];
        self.tempLabel.font=[UIFont systemFontOfSize:60];
        [self addSubview:self.tempLabel];
        
        
        self.tempLabeluIY=[[UILabel alloc]initWithFrame:CGRectZero];
        self.tempLabeluIY.textColor=[UIColor whiteColor];
        self.tempLabeluIY.font=[UIFont boldSystemFontOfSize:20];
        [self addSubview:self.tempLabeluIY];
        
        
        
        self.qingyinLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.qingyinLable.textColor=[UIColor whiteColor];
        self.qingyinLable.font=[UIFont systemFontOfSize:22];
        [self addSubview:self.qingyinLable];
        
        
        
        self.fengLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.fengLable.textColor=[UIColor whiteColor];
        self.fengLable.font=[UIFont systemFontOfSize:18];
        [self addSubview:self.fengLable];
        self.fengLable.text=@"风";
        
        self.fengLableContent=[[UILabel alloc]initWithFrame:CGRectZero];
        self.fengLableContent.textColor=[UIColor whiteColor];
        self.fengLableContent.font=[UIFont systemFontOfSize:18];
        [self addSubview:self.fengLableContent];
        
        
        self.imageView1=[[UIImageView alloc]initWithImage:[UIImage imageWithColor:[UIColor colorWithRed:163/255.0f green:163/255.0f blue:163/255.0f alpha:70/255.0f]]];
        self.imageView1.frame=CGRectMake(0, 0, WIDETH-100, 1);
        [self addSubview:self.imageView1];
        
        
        self.shiduLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.shiduLable.textColor=[UIColor whiteColor];
        self.shiduLable.font=[UIFont systemFontOfSize:18];
        [self addSubview:self.shiduLable];
        self.shiduLable.text=@"湿度";
        
        self.shiduLableContent=[[UILabel alloc]initWithFrame:CGRectZero];
        self.shiduLableContent.textColor=[UIColor whiteColor];
        self.shiduLableContent.font=[UIFont systemFontOfSize:18];
        [self addSubview:self.shiduLableContent];
        
        
        
        self.imageView2=[[UIImageView alloc]initWithImage:[UIImage imageWithColor:[UIColor colorWithRed:163/255.0f green:163/255.0f blue:163/255.0f alpha:70/255.0f]]];
        self.imageView2.frame=CGRectMake(0, 0, WIDETH-100, 1);
        [self addSubview:self.imageView2];
        
        
        self.qiyaLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.qiyaLable.textColor=[UIColor whiteColor];
        self.qiyaLable.font=[UIFont systemFontOfSize:18];
        [self addSubview:self.qiyaLable];
        self.qiyaLable.text=@"气压";
        
        self.qiyaLableContent=[[UILabel alloc]initWithFrame:CGRectZero];
        self.qiyaLableContent.textColor=[UIColor whiteColor];
        self.qiyaLableContent.font=[UIFont systemFontOfSize:18];
        [self addSubview:self.qiyaLableContent];
        
        
        
        self.imageView3=[[UIImageView alloc]initWithImage:[UIImage imageWithColor:[UIColor colorWithRed:163/255.0f green:163/255.0f blue:163/255.0f alpha:70/255.0f]]];         self.imageView3.frame=CGRectMake(0, 0, WIDETH-100, 1);
        [self addSubview:self.imageView3];
        
        
        
        self.jiangshuiLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.jiangshuiLable.textColor=[UIColor whiteColor];
        self.jiangshuiLable.font=[UIFont systemFontOfSize:18];
        [self addSubview:self.jiangshuiLable];
        self.jiangshuiLable.text=@"降水量";
        
        self.jiangshuiLableContent=[[UILabel alloc]initWithFrame:CGRectZero];
        self.jiangshuiLableContent.textColor=[UIColor whiteColor];
        self.jiangshuiLableContent.font=[UIFont systemFontOfSize:18];
        [self addSubview:self.jiangshuiLableContent];
        
        self.imageView4=[[UIImageView alloc]initWithImage:[UIImage imageWithColor:[UIColor colorWithRed:163/255.0f green:163/255.0f blue:163/255.0f alpha:70/255.0f]]];
        self.imageView4.frame=CGRectMake(0, 0, WIDETH-100, 1);
        [self addSubview:self.imageView4];
        
        
        
        
        self.richuLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.richuLable.textColor=[UIColor whiteColor];
        self.richuLable.font=[UIFont systemFontOfSize:18];
        [self addSubview:self.richuLable];
        self.richuLable.text=@"日出";
        
        self.richuLableContent=[[UILabel alloc]initWithFrame:CGRectZero];
        self.richuLableContent.textColor=[UIColor whiteColor];
        self.richuLableContent.font=[UIFont systemFontOfSize:18];
        [self addSubview:self.richuLableContent];
        
        
        self.imageView5=[[UIImageView alloc]initWithImage:[UIImage imageWithColor:[UIColor colorWithRed:163/255.0f green:163/255.0f blue:163/255.0f alpha:70/255.0f]]];
        
        self.imageView5.frame=CGRectMake(0, 0, WIDETH-100, 1);
        [self addSubview:self.imageView5];
        
        
        self.riluoLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.riluoLable.textColor=[UIColor whiteColor];
        self.riluoLable.font=[UIFont systemFontOfSize:18];
        [self addSubview:self.riluoLable];
        self.riluoLable.text=@"日落";
        
        self.riluoLableContent=[[UILabel alloc]initWithFrame:CGRectZero];
        self.riluoLableContent.textColor=[UIColor whiteColor];
        self.riluoLableContent.font=[UIFont systemFontOfSize:18];
        [self addSubview:self.riluoLableContent];
        
        
        self.imageView6=[[UIImageView alloc]initWithImage:[UIImage imageWithColor:[UIColor colorWithRed:163/255.0f green:163/255.0f blue:163/255.0f alpha:70/255.0f]]];
        
        self.imageView6.frame=CGRectMake(0, 0, WIDETH-100, 1);
        [self addSubview:self.imageView6];
        
        
        
        
        self.kongqiLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.kongqiLable.textColor=[UIColor whiteColor];
        self.kongqiLable.font=[UIFont systemFontOfSize:18];
        [self addSubview:self.kongqiLable];
        self.kongqiLable.text=@"空气质量";
        
        self.kongqiLableContent=[[UILabel alloc]initWithFrame:CGRectZero];
        self.kongqiLableContent.textColor=[UIColor whiteColor];
        self.kongqiLableContent.font=[UIFont systemFontOfSize:18];
        [self addSubview:self.kongqiLableContent];
        
        
        
        self.imageView=[[UIImageView alloc]initWithImage:IMAGE(@"time")];
        [self addSubview:self.imageView];
        
        self.timeLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.timeLable.textColor=[UIColor colorWithHexString:@"0xa3a3a3"];
        self.timeLable.font=[UIFont systemFontOfSize:18];
        [self addSubview:self.timeLable];
        self.timeLable.text=@"5分钟前发布";
        
        
        self.imageViewBgCover=[[UIImageView alloc]initWithImage:[UIImage imageWithColor:[UIColor clearColor]]];
        self.imageViewBgCover.frame=self.frame;
        [self addSubview:self.imageViewBgCover];
        
        
        self.TEEE=[[UILabel alloc]initWithFrame:CGRectZero];
        self.TEEE.textColor=[UIColor whiteColor];
        self.TEEE.font=[UIFont systemFontOfSize:18];
        [self addSubview:self.TEEE];
   
        
        self.TEEE1=[[UILabel alloc]initWithFrame:CGRectZero];
        self.TEEE1.textColor=[UIColor whiteColor];
        self.TEEE1.font=[UIFont systemFontOfSize:18];
        [self addSubview:self.TEEE1];
      
        
        
        self.TEEE2=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDETH-40, HEIGHTH)];
        self.TEEE2.textColor=[UIColor whiteColor];
        self.TEEE2.numberOfLines=0;
        self.TEEE2.lineBreakMode=NSLineBreakByWordWrapping;
        self.TEEE2.font=[UIFont systemFontOfSize:16];
        [self addSubview:self.TEEE2];
        
        self.imageViewee=[[UIImageView alloc]initWithImage:[UIImage imageWithColor:[UIColor colorWithRed:163/255.0f green:163/255.0f blue:163/255.0f alpha:70/255.0f]]];
        self.imageViewee.frame=CGRectMake(0, 0, WIDETH, 1);
        [self addSubview:self.imageViewee];
        
        
        self.button=[[UIButton alloc]initWithFrame:self.frame];
        [self.button setBackgroundColor:[UIColor clearColor]];
        [self.button addTarget:self action:@selector(touches:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.button];
        
    }
    return self;
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.button.center=self.center;
    
    self.imageViewBg.top=self.top;
    self.imageViewBg.left=self.left;
    
    self.imageViewBgCover.center=self.center;
    
    [self.locationLable sizeToFit];
    self.locationLable.centerX=self.centerX+6;
    if (IS_IPHONE_5_HEIGHT) {
        self.locationLable.top=25;
    }else if(IS_IPHONE_6P_HEIGHT){
        self.locationLable.top=40;
    }else{
        self.locationLable.top=30;
    }
    
    
    self.locationImageView.centerY=self.locationLable.centerY;
    self.locationImageView.right=self.locationLable.left-10;
    
    [self.logoLableJia sizeToFit];
    self.logoLableJia.centerY=self.locationLable.centerY;
    self.logoLableJia.left=self.locationLable.right+10;
    
    
    //    self.logoImageView.centerX=self.centerX-45;
    //    self.logoImageView.centerY=self.locationImageView.centerY;
    //
    //    [self.logoLable sizeToFit];
    //    self.logoLable.left=self.logoImageView.right+5;
    //    self.logoLable.centerY=self.locationImageView.centerY;
    //
    //    self.shareImageView.right=self.right-15;
    //    self.shareImageView.centerY=self.locationImageView.centerY;
    //
    [self.tempLabel sizeToFit];
    self.tempLabel.centerX=self.centerX;
    self.tempLabel.top=self.locationImageView.bottom+50;
    
    
    [self.tempLabeluIY sizeToFit];
    self.tempLabeluIY.top=self.tempLabel.top+5;
    self.tempLabeluIY.left=self.tempLabel.right+10;
    
    
    [self.qingyinLable sizeToFit];
    self.qingyinLable.centerX=self.centerX;
    self.qingyinLable.top=self.tempLabel.bottom+10;
    
    
    
    [self.fengLable sizeToFit];
    self.fengLable.left=self.left+50;
    self.fengLable.top=self.qingyinLable.bottom+40;
    
    [self.fengLableContent sizeToFit];
    self.fengLableContent.right=self.right-50;
    self.fengLableContent.centerY=self.fengLable.centerY;
    
    self.imageView1.top=self.fengLable.bottom+15;
    self.imageView1.centerX=self.centerX;
    
    
    
    [self.shiduLable sizeToFit];
    self.shiduLable.left=self.fengLable.left;
    self.shiduLable.top=self.imageView1.bottom+10;
    
    [self.shiduLableContent sizeToFit];
    self.shiduLableContent.right=self.fengLableContent.right;
    self.shiduLableContent.centerY=self.shiduLable.centerY;
    
    self.imageView2.top=self.shiduLable.bottom+15;
    self.imageView2.centerX=self.centerX;
    
    
    
    [self.qiyaLable sizeToFit];
    self.qiyaLable.left=self.fengLable.left;
    self.qiyaLable.top=self.imageView2.bottom+10;
    
    [self.qiyaLableContent sizeToFit];
    self.qiyaLableContent.right=self.fengLableContent.right;
    self.qiyaLableContent.centerY=self.qiyaLable.centerY;
    
    self.imageView3.top=self.qiyaLable.bottom+15;
    self.imageView3.centerX=self.centerX;
    
    
    
    [self.jiangshuiLable sizeToFit];
    self.jiangshuiLable.left=self.fengLable.left;
    self.jiangshuiLable.top=self.imageView3.bottom+10;
    
    [self.jiangshuiLableContent sizeToFit];
    self.jiangshuiLableContent.right=self.fengLableContent.right;
    self.jiangshuiLableContent.centerY=self.jiangshuiLable.centerY;
    
    self.imageView4.top=self.jiangshuiLable.bottom+15;
    self.imageView4.centerX=self.centerX;
    
    
    [self.richuLable sizeToFit];
    self.richuLable.left=self.fengLable.left;
    self.richuLable.top=self.imageView4.bottom+10;
    
    [self.richuLableContent sizeToFit];
    self.richuLableContent.right=self.fengLableContent.right;
    self.richuLableContent.centerY=self.richuLable.centerY;
    
    self.imageView5.top=self.richuLable.bottom+15;
    self.imageView5.centerX=self.centerX;
    
    
    
    [self.riluoLable sizeToFit];
    self.riluoLable.left=self.fengLable.left;
    self.riluoLable.top=self.imageView5.bottom+10;
    
    [self.riluoLableContent sizeToFit];
    self.riluoLableContent.right=self.fengLableContent.right;
    self.riluoLableContent.centerY=self.riluoLable.centerY;
    
    self.imageView6.top=self.riluoLable.bottom+15;
    self.imageView6.centerX=self.centerX;
    
    
    [self.kongqiLable sizeToFit];
    self.kongqiLable.left=self.fengLable.left;
    self.kongqiLable.top=self.imageView6.bottom+10;
    
    [self.kongqiLableContent sizeToFit];
    self.kongqiLableContent.right=self.fengLableContent.right;
    self.kongqiLableContent.centerY=self.kongqiLable.centerY;
    
    
    self.imageView.left=self.fengLable.left;
    self.imageView.top=self.kongqiLable.bottom+15;
    [self.timeLable sizeToFit];
    self.timeLable.left=self.imageView.right+5;
    self.timeLable.centerY=self.imageView.centerY;
    
    
    [self.TEEE sizeToFit];
    self.TEEE.left=self.left+20;
    self.TEEE.top=self.locationImageView.bottom+40;
    
    [self.TEEE1 sizeToFit];
    self.TEEE1.right=self.right-20;
    self.TEEE1.centerY=self.TEEE.centerY;

    self.imageViewee.centerX=self.centerX;
    self.imageViewee.top=self.TEEE1.bottom+10;

    self.TEEE2.left=self.TEEE.left;
    self.TEEE2.top=self.imageViewee.bottom+10;
}

-(void)touches:(UIButton*)button{
    if(self.delegate&&[self.delegate respondsToSelector:@selector(dismissView)]){
        [self.delegate dismissView];
    }
    
}


-(void)getDtaa{
    [self.TEEE sizeToFit];
     [self.TEEE1 sizeToFit];
    [self.TEEE setHidden:NO];
    [self.TEEE1  setHidden:NO];
    
    [self.TEEE2 sizeToFit];
    [self.TEEE2 setHidden:NO];
    [self.imageViewee  setHidden:NO];
    
    
    [self.tempLabel setHidden:YES];
    [self.tempLabeluIY setHidden:YES];
    [self.qingyinLable setHidden:YES];
    [self.fengLable setHidden:YES];
    [self.fengLableContent setHidden:YES];
    [self.shiduLable setHidden:YES];
    [self.shiduLableContent setHidden:YES];
    [self.qiyaLable setHidden:YES];
    [self.qiyaLableContent setHidden:YES];
    [self.jiangshuiLable setHidden:YES];
    [self.jiangshuiLableContent setHidden:YES];
    [self.richuLable setHidden:YES];
    [self.richuLableContent setHidden:YES];
    [self.riluoLable setHidden:YES];
    [self.riluoLableContent setHidden:YES];
    [self.kongqiLable setHidden:YES];
    [self.kongqiLableContent setHidden:YES];
    [self.timeLable setHidden:YES];
    
    [self.imageView setHidden:YES];
    [self.imageView1 setHidden:YES];
    [self.imageView2 setHidden:YES];
    [self.imageView3 setHidden:YES];
    [self.imageView4 setHidden:YES];
    [self.imageView5 setHidden:YES];
    [self.imageView6 setHidden:YES];
    

    
}

-(void)INITwIDADAD:(NSDictionary*)content withCondition:(NSString*)condition{

    [self.tempLabel setHidden:NO];
    [self.tempLabeluIY setHidden:NO];
    [self.qingyinLable setHidden:NO];
    [self.fengLable setHidden:NO];
    [self.fengLableContent setHidden:NO];
    [self.shiduLable setHidden:NO];
    [self.shiduLableContent setHidden:NO];
    [self.qiyaLable setHidden:NO];
    [self.qiyaLableContent setHidden:NO];
    [self.jiangshuiLable setHidden:NO];
    [self.jiangshuiLableContent setHidden:NO];
    [self.richuLable setHidden:NO];
    [self.richuLableContent setHidden:NO];
    [self.riluoLable setHidden:NO];
    [self.riluoLableContent setHidden:NO];
    [self.kongqiLable setHidden:NO];
    [self.kongqiLableContent setHidden:NO];
    [self.timeLable setHidden:NO];
    
    [self.imageView setHidden:NO];
    [self.imageView1 setHidden:NO];
    [self.imageView2 setHidden:NO];
    [self.imageView3 setHidden:NO];
    [self.imageView4 setHidden:NO];
    [self.imageView5 setHidden:NO];
    [self.imageView6 setHidden:NO];
    
    [self.TEEE setHidden:YES];
    [self.TEEE1  setHidden:YES];
    [self.TEEE2 setHidden:YES];
    [self.imageViewee  setHidden:YES];
    
    NSString* adsf=self.locationLable.text;
    if ([adsf isEqualToString:[GloableInfo getLocationCityInfo][@"sName"]]){
        self.locationImageView.image=IMAGE(@"location");
    }else{
        self.locationImageView.image=nil;
    }
    
    self.tempLabel.text=[NSString stringWithFormat:@"%@",content[@"now"][@"tmp"]];
    self.tempLabeluIY.text=@"o";
    
    CGSize titleSize = [self.tempLabel.text sizeWithFont:self.tempLabel.font constrainedToSize:CGSizeMake(MAXFLOAT, 80) lineBreakMode:NSLineBreakByWordWrapping];
    self.tempLabel.frame=CGRectMake(self.centerX-titleSize.width/2, self.locationImageView.bottom+50, titleSize.width,titleSize.height);
    self.tempLabel.centerX=self.centerX;
    self.tempLabel.top=self.locationImageView.bottom+50;
    self.qiyaLableContent.text=[NSString stringWithFormat:@"%@ hpa",content[@"now"][@"pres"]];
    self.qingyinLable.text=[content[@"daily_forecast"] objectAtIndex:0][@"txt_n"];
    self.fengLableContent.text=[NSString stringWithFormat:@"%@ %@ 级",content[@"now"][@"wind_dir_txt"],content[@"now"][@"wind_sc"]];
    self.shiduLableContent.text=[NSString stringWithFormat:@"%@ %%",content[@"now"][@"hum"]];
    self.jiangshuiLableContent.text=[NSString stringWithFormat:@"%@ mm",content[@"now"][@"pcpn"]];
    self.richuLableContent.text=content[@"now"][@"sunrise"];
    self.riluoLableContent.text=content[@"now"][@"sunset"];
    self.kongqiLableContent.text=condition;
    
}
@end
