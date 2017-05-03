//
//  CitySeachTableViewCell.m
//  TangShan
//
//  Created by Tony on 1/7/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "CitySeachTableViewCell.h"

@implementation CitySeachTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        self.cityLable=[[UILabel alloc]initWithFrame:CGRectZero];
        self.cityLable.textColor=[UIColor colorWithHexString:@"0x333333"];
        self.cityLable.font=[UIFont systemFontOfSize:16];
        [self.contentView addSubview:self.cityLable];
    }
    return self;

}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self.cityLable sizeToFit];
    self.cityLable.left=self.contentView.left+20;
    self.cityLable.centerY=self.contentView.centerY;
}

@end
