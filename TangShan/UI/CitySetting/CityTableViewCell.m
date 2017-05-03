//
//  CityTableViewCell.m
//  TangShan
//
//  Created by Tony on 1/5/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "CityTableViewCell.h"

@implementation CityTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self=[super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.imegaerad=[[UIImageView alloc]initWithImage:IMAGE(@"locationada")];
        self.imegaerad.contentMode=UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.imegaerad];
        
        
        self.LABEAE=[[UILabel alloc]initWithFrame:CGRectZero];
        self.LABEAE.textColor=[UIColor colorWithHexString:@"0x333333"];
        self.LABEAE.font=[UIFont systemFontOfSize:18];
        [self.contentView addSubview:self.LABEAE];
        
        
        self.zafsaf=[[UIImageView alloc]initWithImage:IMAGE(@"homdadee")];
        [self.contentView addSubview:self.zafsaf];
        [self.zafsaf setHidden:YES];
        
        
        self.DASSFsf=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        self.DASSFsf.backgroundColor=[UIColor clearColor];
        [self.contentView addSubview:self.DASSFsf];
        
        self.adsadS=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        self.adsadS.backgroundColor=[UIColor clearColor];
        [self.contentView addSubview:self.adsadS];

        
        

    }

    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.imegaerad.left=self.contentView.left+20;
    self.imegaerad.centerY=self.contentView.centerY;
    
    
    [self.LABEAE sizeToFit];
    self.LABEAE.left=self.imegaerad.right+10;
    self.LABEAE.centerY=self.contentView.centerY;
    
    self.zafsaf.right=self.contentView.right-10;
    self.zafsaf.centerY=self.contentView.centerY;
    
    
    self.DASSFsf.right=self.contentView.right;
    self.DASSFsf.centerY=self.contentView.centerY;
    
    self.adsadS.left=self.contentView.left;
    self.adsadS.centerY=self.contentView.centerY;
}

@end
