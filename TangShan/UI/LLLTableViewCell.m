//
//  LLLTableViewCell.m
//  TangShan
//
//  Created by Tony on 1/31/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "LLLTableViewCell.h"

@implementation LLLTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self=[super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor=[UIColor clearColor];
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor=[UIColor clearColor];
        
 
        self.ADASF=[[UILabel alloc]initWithFrame:CGRectZero];
        self.ADASF.textColor=[UIColor whiteColor];
        self.ADASF.numberOfLines=1;
        self.ADASF.font=[UIFont systemFontOfSize:18];
        [self.contentView addSubview:self.ADASF];
        
        self.ADASF1=[[UILabel alloc]initWithFrame:CGRectZero];
        self.ADASF1.textColor=[UIColor whiteColor];
        self.ADASF1.numberOfLines=1;
        self.ADASF1.font=[UIFont systemFontOfSize:18];
        [self.contentView addSubview:self.ADASF1];
        
        
        self.ADASF2=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDETH-40, 50)];
        self.ADASF2.textColor=[UIColor whiteColor];
        self.ADASF2.numberOfLines=0;
        self.ADASF2.lineBreakMode=NSLineBreakByWordWrapping;
        self.ADASF2.font=[UIFont systemFontOfSize:16];
        [self.contentView addSubview:self.ADASF2];
        
        
        self.shengImageView1=[[UIImageView alloc]initWithImage:[UIImage imageWithColor:[UIColor colorWithRed:60/255.0f green:60/255.0f blue:60/255.0f  alpha:0.9f]]];
        self.shengImageView1.frame=CGRectMake(0, 0, WIDETH, 1);
        [self.contentView addSubview:self.shengImageView1];
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self.ADASF sizeToFit];
    self.ADASF.left=self.contentView.left+20;
    self.ADASF.top=self.contentView.top+10;
    
    [self.ADASF1 sizeToFit];
    self.ADASF1.right=self.contentView.right-20;
    self.ADASF1.centerY=self.ADASF.centerY;
    
    self.ADASF2.centerX=self.contentView.centerX;
    self.ADASF2.top=self.ADASF.bottom+10;
    
    self.shengImageView1.centerX=self.contentView.centerX;
    self.shengImageView1.bottom=self.contentView.bottom;
    
}

@end
