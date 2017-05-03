//
//  TimeView.h
//  TangShan
//
//  Created by Tony on 1/12/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface TimeView : UIView<UIPickerViewDelegate>

@property(strong,nonatomic)UIImageView* bgImageView;
@property(strong,nonatomic)UIButton* button2;
@property(strong,nonatomic)UIButton* button3;



@property(strong,nonatomic)UIDatePicker* picker1;

@property(strong,nonatomic)UIDatePicker* picker2;

@end
