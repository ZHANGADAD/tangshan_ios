
//
//  CityView.m
//  TangShan
//
//  Created by Tony on 1/5/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "CityView.h"

@implementation CityView


-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        
        self.BADAD=[[UIImageView alloc]initWithFrame:self.frame];
        self.BADAD.image=IMAGE(@"citybg");
        [self addSubview:self.BADAD];
 
        
        self.editImageViewCCC=[[UIImageView alloc]initWithImage:[UIImage imageWithColor:[UIColor whiteColor]]];
        self.editImageViewCCC.frame=CGRectMake(0, 0, 60, 40);
        [self addSubview:self.editImageViewCCC];
        
        
        self.editImageView=[[UIImageView alloc]initWithImage:IMAGE(@"eidtads")];
        [self addSubview:self.editImageView];
        
        self.backButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 40)];
        self.backButton.tag=0;
        [self.backButton addTarget:self action:@selector(adaf:) forControlEvents:UIControlEventTouchUpInside];
        self.backButton.backgroundColor=[UIColor clearColor];
        [self addSubview:self.backButton];
        
        self.editButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
        self.editButton.tag=1;
        [self.editButton addTarget:self action:@selector(adaf:) forControlEvents:UIControlEventTouchUpInside];
        self.editButton.backgroundColor=[UIColor clearColor];
        [self addSubview:self.editButton];
        
        
        self.addButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
        self.addButton.tag=2;
        [self.addButton addTarget:self action:@selector(adaf:) forControlEvents:UIControlEventTouchUpInside];
        self.addButton.backgroundColor=[UIColor clearColor];
        [self addSubview:self.addButton];
        
        
        self.mTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDETH, HEIGHTH) style:UITableViewStylePlain];
        [self addSubview:self.mTableView];
        
    }
    return self;
}

-(void)adaf:(UIButton*)BUTTON{
    if (self.delegate) {
        [self.delegate buttonClicked:BUTTON.tag];
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.BADAD.top=self.top;
    self.BADAD.centerX=self.centerX;
    
    
    self.backButton.left=self.left;
    self.backButton.top=self.top+24;
    
    
    self.addButton.right=self.right;
    self.addButton.top=self.backButton.top;
    
    self.editButton.right=self.addButton.left;
    self.editButton.top=self.backButton.top;
    
    self.editImageViewCCC.right=self.addButton.left;
    self.editImageViewCCC.centerY=self.addButton.centerY;
    
    self.editImageView.right=self.addButton.left-20;
    self.editImageView.centerY=self.addButton.centerY;
    
    self.mTableView.top=self.backButton.bottom;
    self.mTableView.centerX=self.centerX;
}

@end
