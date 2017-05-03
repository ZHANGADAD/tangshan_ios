//
//  CommonlistTableViewCell.m
//  TangShan
//
//  Created by Tony on 1/27/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "CommonlistTableViewCell.h"

@implementation CommonlistTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self=[super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor=[UIColor clearColor];
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor=[UIColor clearColor];
        
        
        self.ADASF=[[UIImageView alloc]initWithImage:[UIImage imageWithColor:[UIColor whiteColor]]];
        self.ADASF.frame=CGRectMake(0, 0, WIDETH, 1);
        [self.contentView addSubview:self.ADASF];
        
        self.lable1=[[UILabel alloc]initWithFrame:CGRectZero];
        self.lable1.textColor=[UIColor whiteColor];
        self.lable1.numberOfLines=1;
        self.lable1.font=[UIFont systemFontOfSize:18];
        [self.contentView addSubview:self.lable1];
        
        self.lable2=[[UILabel alloc]initWithFrame:CGRectZero];
        self.lable2.textColor=[UIColor whiteColor];
        self.lable2.numberOfLines=1;
        self.lable2.font=[UIFont systemFontOfSize:16];
        [self.contentView addSubview:self.lable2];
        
        
        self.lable3=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDETH-100, 60)];
        self.lable3.textColor=[UIColor whiteColor];
        self.lable3.numberOfLines=0;
        self.lable3.lineBreakMode=NSLineBreakByWordWrapping;
        self.lable3.font=[UIFont systemFontOfSize:16];
        [self.contentView addSubview:self.lable3];
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self.lable1 sizeToFit];
    self.lable1.left=self.contentView.left+10;
    self.lable1.top=self.contentView.top+15;
    
    [self.lable2 sizeToFit];
    self.lable2.right=self.contentView.right-15;
    
    self.ADASF.centerX=self.contentView.centerX;
    self.ADASF.top=self.lable1.bottom+10;
    
    self.lable3.left=self.lable1.left;
    self.lable3.top=self.ADASF.bottom+10;
}

@end
