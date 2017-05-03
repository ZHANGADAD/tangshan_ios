//
//  NongyeTableViewCell.m
//  TangShan
//
//  Created by Tony on 12/21/15.
//  Copyright © 2015 Tang Shan. All rights reserved.
//

#import "NongyeTableViewCell.h"

@implementation NongyeTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self=[super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
        
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        
        self.contentView.backgroundColor=[UIColor clearColor];
        
        self.nongyeImageView=[[UIImageView alloc]initWithImage:IMAGE(@"shuxian")];
        [self.contentView addSubview:self.nongyeImageView];
        
        self.nongyeTitleLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.nongyeTitleLable.textColor=[UIColor whiteColor];
        self.nongyeTitleLable.font=[UIFont systemFontOfSize:18];
        [self.contentView addSubview:self.nongyeTitleLable];
        
        
        self.nongyeTimeLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.nongyeTimeLable.textColor=[UIColor whiteColor];
        self.nongyeTimeLable.font=[UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.nongyeTimeLable];
        
        
        self.nongyeContentLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.nongyeContentLable.textColor=[UIColor whiteColor];
        self.nongyeContentLable.font=[UIFont systemFontOfSize:16];
        self.nongyeContentLable.numberOfLines=0;
        self.nongyeContentLable.lineBreakMode=NSLineBreakByWordWrapping;
        [self.contentView addSubview:self.nongyeContentLable];
        
        self.nongyeButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
        [self.nongyeButton setBackgroundImage:IMAGE(@"nongyebuttonbg") forState:UIControlStateNormal];
        [self.nongyeButton setBackgroundImage:IMAGE(@"nongyebuttonbg") forState:UIControlStateSelected];
        [self.nongyeButton setTitle:@"查看更多详情" forState:UIControlStateSelected];
        [self.nongyeButton setTitle:@"查看更多详情" forState:UIControlStateNormal];
        [self.nongyeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.nongyeButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        self.nongyeButton.titleLabel.font=[UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.nongyeButton];
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.nongyeImageView.left=self.contentView.left+15;
    self.nongyeImageView.top=self.contentView.top+30;
    
    [self.nongyeTitleLable sizeToFit];
    self.nongyeTitleLable.left=self.nongyeImageView.right+15;
    self.nongyeTitleLable.centerY=self.nongyeImageView.centerY;
    
    [self.nongyeTimeLable sizeToFit];
    self.nongyeTimeLable.right=self.contentView.right-15;
    self.nongyeTimeLable.centerY=self.nongyeTitleLable.centerY;
    
    [self.nongyeContentLable sizeToFit];
    [self hardaResizeUILableContentHeight:self.nongyeContentLable withAlignLable:self.nongyeTitleLable];
    
    self.nongyeButton.centerX=self.contentView.centerX;
    self.nongyeButton.top=self.nongyeContentLable.bottom+40;
}


-(void)hardaResizeUILableContentHeight:(UILabel*)lableContent withAlignLable:(UIView*)lableAlign{
    CGSize maximumSize = CGSizeMake(WIDETH-40, 9999);
    CGSize dateStringSize = [lableContent.text sizeWithFont:lableContent.font
                                          constrainedToSize:maximumSize
                                              lineBreakMode:lableContent.lineBreakMode];
    CGRect dateFrame = CGRectMake(lableAlign.left, lableAlign.bottom+20, WIDETH-40, dateStringSize.height);
    lableContent.frame = dateFrame;
}
@end
