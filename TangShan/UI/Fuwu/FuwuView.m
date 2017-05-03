//
//  FuwuView.m
//  TangShan
//
//  Created by Tony on 12/21/15.
//  Copyright © 2015 Tang Shan. All rights reserved.
//

#import "FuwuView.h"

@implementation FuwuView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self=[super initWithFrame:frame];
    if (self) {
        NSInteger height=130;
        if (IS_IPHONE_5_HEIGHT) {
            height=100;
        }
        self.imageViewBg=[[UIImageView alloc]initWithImage:IMAGE(@"fuffff")];
        [self addSubview:self.imageViewBg];
    
        self.imageViewTitle=[[UIImageView alloc]initWithImage:IMAGE(@"fuwubgtitle")];
        [self addSubview:self.imageViewTitle];
        
        self.locationImageView=[[UIImageView alloc]initWithImage:IMAGE(@"location")];
        [self addSubview:self.locationImageView];
        self.locationImageView.contentMode=UIViewContentModeScaleAspectFit;
        
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
        
        
        self.mScrollView=[[UIScrollView alloc]initWithFrame:self.frame];
        self.mScrollView.backgroundColor=[UIColor clearColor];
        [self addSubview:self.mScrollView];
        self.mScrollView.contentSize=CGSizeMake(WIDETH, HEIGHTH+height);
        
        self.imageView=[[UIImageView alloc]initWithImage:IMAGE(@"fuwubg")];
        [self.mScrollView addSubview:self.imageView];
        
        
        
        self.button1=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, (WIDETH-100)/3, height)];
        self.button1.tag=0;
        self.button1.backgroundColor=[UIColor clearColor];
        [self.button1 addTarget:self action:@selector(BUTTONcLI:) forControlEvents:UIControlEventTouchUpInside];
        [self.mScrollView addSubview:self.button1];
        
        
        self.button2=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, (WIDETH-100)/3, height)];
        self.button2.tag=1;
        self.button2.backgroundColor=[UIColor clearColor];
        [self.button2 addTarget:self action:@selector(BUTTONcLI:) forControlEvents:UIControlEventTouchUpInside];
        [self.mScrollView addSubview:self.button2];
        
        
        self.button3=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, (WIDETH-100)/3, height)];
        self.button3.tag=2;
        self.button3.backgroundColor=[UIColor clearColor];
        [self.button3 addTarget:self action:@selector(BUTTONcLI:) forControlEvents:UIControlEventTouchUpInside];
        [self.mScrollView addSubview:self.button3];
        
        
        self.button4=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, (WIDETH-100)/3, height)];
        self.button4.tag=3;
        self.button4.backgroundColor=[UIColor clearColor];
        [self.button4 addTarget:self action:@selector(BUTTONcLI:) forControlEvents:UIControlEventTouchUpInside];
        [self.mScrollView addSubview:self.button4];
        
        
        self.button5=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, (WIDETH-100)/3, height)];
        self.button5.tag=4;
        self.button5.backgroundColor=[UIColor clearColor];
        [self.button5 addTarget:self action:@selector(BUTTONcLI:) forControlEvents:UIControlEventTouchUpInside];
        [self.mScrollView addSubview:self.button5];
        
        
        self.button6=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, (WIDETH-100)/3, height)];
        self.button6.tag=5;
        self.button6.backgroundColor=[UIColor clearColor];
        [self.button6 addTarget:self action:@selector(BUTTONcLI:) forControlEvents:UIControlEventTouchUpInside];
        [self.mScrollView addSubview:self.button6];
        
        
        self.button7=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, (WIDETH-100)/3, height)];
        self.button7.tag=6;
        self.button7.backgroundColor=[UIColor clearColor];
        [self.button7 addTarget:self action:@selector(BUTTONcLI:) forControlEvents:UIControlEventTouchUpInside];
        [self.mScrollView addSubview:self.button7];
        
        self.button8=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, (WIDETH-100)/3, height)];
        self.button8.tag=7;
        self.button8.backgroundColor=[UIColor clearColor];
        [self.button8 addTarget:self action:@selector(BUTTONcLI:) forControlEvents:UIControlEventTouchUpInside];
        [self.mScrollView addSubview:self.button8];
        
        
        self.button9=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, (WIDETH-100)/3, height)];
        self.button9.tag=8;
        self.button9.backgroundColor=[UIColor clearColor];
        [self.button9 addTarget:self action:@selector(BUTTONcLI:) forControlEvents:UIControlEventTouchUpInside];
        [self.mScrollView addSubview:self.button9];
        
        self.button10=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, (WIDETH-100)/3, height)];
        self.button10.tag=9;
        self.button10.backgroundColor=[UIColor clearColor];
        [self.button10 addTarget:self action:@selector(BUTTONcLI:) forControlEvents:UIControlEventTouchUpInside];
        [self.mScrollView addSubview:self.button10];
        
    }
    return self;
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageViewBg.top=self.top;
    self.imageViewBg.centerX=self.centerX;
    
    self.imageViewTitle.top=self.top;
    self.imageViewTitle.centerX=self.centerX;
    
    self.mScrollView.top=self.imageViewTitle.bottom;
    self.mScrollView.centerX=self.centerX;
    
    self.imageView.top=self.mScrollView.top-66;
    self.imageView.centerX=self.centerX;
    
    
    
    [self.locationLable sizeToFit];
    self.locationLable.centerX=self.centerX+6;
    if (IS_IPHONE_5_HEIGHT) {
        self.locationLable.top=25;
    }else if(IS_IPHONE_6P_HEIGHT){
        self.locationLable.top=35;
    }else{
        self.locationLable.top=30;
    }
    
    
    
    self.locationImageView.centerY=self.locationLable.centerY;
    self.locationImageView.right=self.locationLable.left-10;
    
    [self.logoLableJia sizeToFit];
    self.logoLableJia.centerY=self.locationLable.centerY;
    self.logoLableJia.left=self.locationLable.right+10;
    

    
    
    self.button1.left=self.left+20;
    
    if (IS_IPHONE_5_HEIGHT) {
        self.button1.top=self.top;
    }else{
        self.button1.top=self.top+20;
    }
    
    self.button2.left=self.button1.right+40;
    self.button2.top=self.button1.top;
    
    self.button3.left=self.button2.right+10;
    self.button3.top=self.button1.top;
    
    if (IS_IPHONE_5_HEIGHT) {
        self.button4.top=self.button1.bottom+50;
    }else{
        self.button4.top=self.button1.bottom+40;
    }
    self.button4.left=self.button1.left;
    
    
    self.button5.left=self.button2.left;
    self.button5.top=self.button4.top;
    
    self.button6.left=self.button3.left;
    self.button6.top=self.button4.top;
    
    if (IS_IPHONE_5_HEIGHT) {
        self.button7.top=self.button4.bottom+50;
    }else{
        self.button7.top=self.button4.bottom+40;
    }
    self.button7.left=self.button1.left;
    
    
    self.button8.left=self.button2.left;
    self.button8.top=self.button7.top;
    
    self.button9.left=self.button3.left;
    self.button9.top=self.button7.top;
    
    
    if (IS_IPHONE_5_HEIGHT) {
        self.button10.top=self.button7.bottom+50;
    }else{
        self.button10.top=self.button7.bottom+40;
    }
    self.button10.left=self.button1.left;
}

-(void)BUTTONcLI:(UIButton*)button{
    if (self.delegate) {
        [self.delegate didViewSeleted:button.tag];
    }
}

@end
