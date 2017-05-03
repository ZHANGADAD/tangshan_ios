//
//  ShenghuoTableViewCell.m
//  TangShan
//
//  Created by Tony on 12/22/15.
//  Copyright © 2015 Tang Shan. All rights reserved.
//

#import "ShenghuoTableViewCell.h"

@implementation ShenghuoTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self=[super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
    
        self.backgroundColor=[UIColor clearColor];
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor=[UIColor clearColor];
    
        self.shengImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
        [self.contentView addSubview:self.imageView];
        
        self.shengTitleLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDETH-30, 40)];
        self.shengTitleLable.textColor=[UIColor whiteColor];
        self.shengTitleLable.numberOfLines=1;
        self.shengTitleLable.lineBreakMode=NSLineBreakByTruncatingTail;
        self.shengTitleLable.font=[UIFont systemFontOfSize:18];
        [self.contentView addSubview:self.shengTitleLable];

        self.shengContentLable=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, WIDETH-100, 40)];
        self.shengContentLable.textColor=[UIColor whiteColor];
        self.shengContentLable.numberOfLines=2;
        self.shengContentLable.lineBreakMode=NSLineBreakByTruncatingTail;
        self.shengContentLable.font=[UIFont systemFontOfSize:16];
        [self.contentView addSubview:self.shengContentLable];
        
        
        self.shengImageView1=[[UIImageView alloc]initWithImage:[UIImage imageWithColor:[UIColor colorWithRed:60/255.0f green:60/255.0f blue:60/255.0f  alpha:0.9f]]];
        self.shengImageView1.frame=CGRectMake(0, 0, WIDETH, 1);
        [self.contentView addSubview:self.shengImageView1];
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.shengImageView.centerY=self.contentView.centerY;
    self.shengImageView.left=self.contentView.left+10;
    
    self.shengTitleLable.left=self.shengImageView.right+30;
    self.shengTitleLable.top=self.shengImageView.top-10;
    
    self.shengContentLable.left=self.shengTitleLable.left;
    self.shengContentLable.top=self.shengTitleLable.bottom+15;
    
    self.shengImageView1.centerX=self.contentView.centerX;
    self.shengImageView1.bottom=self.contentView.bottom;

}
@end
