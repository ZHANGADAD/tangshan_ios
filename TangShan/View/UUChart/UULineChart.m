//
//  UULineChart.m
//  UUChartDemo
//
//  Created by shake on 14-7-24.
//  Copyright (c) 2014年 uyiuyao. All rights reserved.
//

#import "UULineChart.h"
#import "UUColor.h"
#import "UUChartLabel.h"


const CGFloat dsadsf=10.0f;

@implementation UULineChart {
    NSHashTable *_chartLabelsForX;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.clipsToBounds = YES;
    }
    return self;
}

-(void)setYValues:(NSArray *)yValues
{
    _yValues = yValues;
    [self setYLabels:yValues];
}

-(void)setYLabels:(NSArray *)yLabels
{
    NSInteger max = 0;
    NSInteger min = 1000000000;
    
    for (NSArray * ary in yLabels) {
        for (NSString *valueString in ary) {
            NSInteger value=0;
            if (!valueString) {
                value  = [valueString integerValue];
            }
            
            if (value > max) {
                max = value;
            }
            if (value < min) {
                min = value;
            }
        }
    }
    max = max<5 ? 5:max;
    _yValueMin = 0;
    _yValueMax = (int)max;
    
    if (_chooseRange.max != _chooseRange.min) {
        _yValueMax = _chooseRange.max;
        _yValueMin = _chooseRange.min;
    }
    
    //    float level = (_yValueMax-_yValueMin) /4.0;
    CGFloat chartCavanHeight = self.frame.size.height - UULabelHeight*3;
    if (self.xLabels.count>6) {
        chartCavanHeight = self.frame.size.height - UULabelHeight*3-GADAFSFF;
    }
    CGFloat levelHeight = chartCavanHeight /4.0;
    
    if ([super respondsToSelector:@selector(setMarkRange:)]) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(UUYLabelwidth, (1-(_markRange.max-_yValueMin)/(_yValueMax-_yValueMin))*chartCavanHeight+UULabelHeight, self.frame.size.width-UUYLabelwidth, (_markRange.max-_markRange.min)/(_yValueMax-_yValueMin)*chartCavanHeight)];
        view.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.1];
        [self addSubview:view];
    }
    
    //画横线
    
    if (self.xLabels.count>6) {
        for (int i=0; i<5; i++) {
            if ([_showHorizonLine[i] integerValue]>0) {
                if (i==2||i==0||i==4) {
                    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
                    UIBezierPath *path = [UIBezierPath bezierPath];
                    [path moveToPoint:CGPointMake(UUYLabelwidth,UULabelHeight+i*levelHeight)];
                    [path addLineToPoint:CGPointMake(self.frame.size.width,UULabelHeight+i*levelHeight)];
                    [path closePath];
                    shapeLayer.path = path.CGPath;
                    shapeLayer.strokeColor = [[[UIColor blackColor] colorWithAlphaComponent:0.1] CGColor];
                    shapeLayer.fillColor = [[UIColor whiteColor] CGColor];
                    shapeLayer.lineWidth = 1;
                    [self.layer addSublayer:shapeLayer];
                }
                
            }
        }
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        UIBezierPath *path = [UIBezierPath bezierPath];
        //UULabelHeight+5*levelHeight+15
        [path moveToPoint:CGPointMake(-UUYLabelwidth,UULabelHeight+5*levelHeight+3)];
        [path addLineToPoint:CGPointMake(self.frame.size.width,UULabelHeight+5*levelHeight+3)];
        [path closePath];
        shapeLayer.path = path.CGPath;
        shapeLayer.strokeColor = [[[UIColor whiteColor] colorWithAlphaComponent:0.1] CGColor];
        shapeLayer.fillColor = [[UIColor whiteColor] CGColor];
        shapeLayer.lineWidth = 1;
        [self.layer addSublayer:shapeLayer];
    }
    
}

-(void)setXLabels:(NSArray *)xLabels
{
    
    if( !_chartLabelsForX ){
        _chartLabelsForX = [NSHashTable weakObjectsHashTable];
    }
    
    _xLabels = xLabels;
    CGFloat num =xLabels.count;
    _xLabelWidth = (self.frame.size.width - UUYLabelwidth)/num;
    
    for (int i=0; i<xLabels.count; i++) {
        
        NSString *labelText = xLabels[i];
        UUChartLabel * label = [[UUChartLabel alloc] initWithFrame:CGRectMake(i * _xLabelWidth+UUYLabelwidth, self.frame.size.height - UULabelHeight, _xLabelWidth, UULabelHeight)];
        label.text = labelText;
        
        if (self.xLabels.count>6) {
            label.font=[UIFont systemFontOfSize:14];
            label.textColor=[UIColor whiteColor];
            [self addSubview:label];
        }
        [_chartLabelsForX addObject:label];
    }
}

-(void)setColors:(NSArray *)colors
{
    _colors = colors;
}

- (void)setMarkRange:(CGRange)markRange
{
    _markRange = markRange;
}

- (void)setChooseRange:(CGRange)chooseRange
{
    _chooseRange = chooseRange;
}

- (void)setshowHorizonLine:(NSMutableArray *)showHorizonLine
{
    _showHorizonLine = showHorizonLine;
}


-(void)strokeChart
{
    for (int i=0; i<_yValues.count; i++) {
        NSArray *childAry = _yValues[i];
        if (childAry.count==0) {
            return;
        }
        //获取最大最小位置
        CGFloat max = [childAry[0] floatValue];
        CGFloat min = [childAry[0] floatValue];
        NSInteger max_i = 0;
        NSInteger min_i = 0;
        
        for (int j=0; j<childAry.count; j++){
            CGFloat num =0.0f;
            if (!childAry[j]) {
                
                num=[childAry[j] floatValue];
                
            }
            if (max<=num){
                max = num;
                max_i = j;
            }
            if (min>=num){
                min = num;
                min_i = j;
            }
        }
        
        //划线
        CAShapeLayer *_chartLine = [CAShapeLayer layer];
        _chartLine.lineCap = kCALineCapRound;
        _chartLine.lineJoin = kCALineJoinBevel;
        _chartLine.fillColor   = [[UIColor whiteColor] CGColor];
        _chartLine.lineWidth   = 2.0;
        [self.layer addSublayer:_chartLine];
        
        UIBezierPath *progressline = [UIBezierPath bezierPath];
        [progressline setLineWidth:2.0];
        [progressline setLineCapStyle:kCGLineCapRound];
        [progressline setLineJoinStyle:kCGLineJoinRound];
        
        CGFloat firstValue = [[childAry objectAtIndex:0] floatValue];
        CGFloat xPosition = (UUYLabelwidth + _xLabelWidth/2.0);
        CGFloat chartCavanHeight = self.frame.size.height - UULabelHeight*3;
        if (self.xLabels.count>6) {
            chartCavanHeight = self.frame.size.height - UULabelHeight*3-GADAFSFF;
        }
        
        
        
        //第一个点
        BOOL isShowMaxAndMinPoint = YES;
        
        
        if (childAry.count>10) {
            
            float grade = ((float)firstValue-_yValueMin) / ((float)_yValueMax-_yValueMin);
            //第一个点
            BOOL isShowMaxAndMinPoint = YES;
            [self addPoint:CGPointMake(xPosition, chartCavanHeight - grade * chartCavanHeight+UULabelHeight)
                     index:i
                    isShow:isShowMaxAndMinPoint
                     value:firstValue
             withDataIndex:0];
            
            [progressline moveToPoint:CGPointMake(xPosition, chartCavanHeight - grade * chartCavanHeight+UULabelHeight)];
            
            for (NSInteger index=1; index<childAry.count; index++) {
                CGFloat asfsaf=0.0f;
                NSString* valueString=[childAry objectAtIndex:index];
                asfsaf=[valueString floatValue];
                
                float grade =(asfsaf-_yValueMin) / ((float)_yValueMax-_yValueMin);
                
                
                CGPoint point = CGPointMake(xPosition+index*_xLabelWidth, chartCavanHeight - grade * chartCavanHeight+UULabelHeight);
                
                [progressline addLineToPoint:point];
                
                BOOL isShowMaxAndMinPoint = YES;
                if (self.showMaxMinArray) {
                    if ([self.showMaxMinArray[i] intValue]>0) {
                        isShowMaxAndMinPoint = (max_i==index || min_i==index)?NO:YES;
                    }else{
                        isShowMaxAndMinPoint = YES;
                    }
                }
                [progressline moveToPoint:point];
                CGFloat Fassf=0.0f;
                
                Fassf=[valueString floatValue];
                
                [progressline stroke];
                
                [self addPoint:point
                         index:i
                        isShow:isShowMaxAndMinPoint
                         value:Fassf
                 withDataIndex:index];
            }
            if (self.chooseColor==1) {
                _chartLine.strokeColor = [UUColor red].CGColor;
            }else if(self.chooseColor==0){
                _chartLine.strokeColor = [UUColor green].CGColor;
            }else{
                _chartLine.strokeColor = [UIColor whiteColor].CGColor;
            }
            
            _chartLine.path = progressline.CGPath;
            
        }else{
            
            
            NSString* valueString=[childAry objectAtIndex:1];
            
            CGFloat  asfsaf=[valueString floatValue];
            
            float grade =(asfsaf-_yValueMin) / ((float)_yValueMax-_yValueMin);
            
            
            CGPoint point11111 =CGPointMake(xPosition+_xLabelWidth, chartCavanHeight - grade * chartCavanHeight+UULabelHeight);
            [progressline moveToPoint:point11111];
            
            
            
            for (NSInteger index=2; index<childAry.count; index++) {
                CGFloat asfsaf=0.0f;
                NSString* valueString=[childAry objectAtIndex:index];
                if (![valueString isEqual:[NSNull null]]) {
                    asfsaf=[valueString floatValue];
                    
                    float grade =(asfsaf-_yValueMin) / ((float)_yValueMax-_yValueMin);
                    
                    
                    CGPoint point = CGPointMake(xPosition+index*_xLabelWidth, chartCavanHeight - grade * chartCavanHeight+UULabelHeight);
                    
                    [progressline addLineToPoint:point];
                    
                    BOOL isShowMaxAndMinPoint = YES;
                    if (self.showMaxMinArray) {
                        if ([self.showMaxMinArray[i] intValue]>0) {
                            isShowMaxAndMinPoint = (max_i==index || min_i==index)?NO:YES;
                        }else{
                            isShowMaxAndMinPoint = YES;
                        }
                    }
                    [progressline moveToPoint:point];
                    CGFloat Fassf=0.0f;
                    
                    Fassf=[valueString floatValue];
                    
                    [progressline stroke];
                    
                    [self addPoint:point
                             index:i
                            isShow:isShowMaxAndMinPoint
                             value:Fassf
                     withDataIndex:index];
                    
                }
            }
            if (self.chooseColor==1) {
                _chartLine.strokeColor = [UUColor red].CGColor;
            }else if(self.chooseColor==0){
                _chartLine.strokeColor = [UUColor green].CGColor;
            }else{
                _chartLine.strokeColor = [UIColor whiteColor].CGColor;
            }
            
            _chartLine.path = progressline.CGPath;
            
            
            CAShapeLayer *_chartLine1 = [CAShapeLayer layer];
            _chartLine1.lineCap = kCALineCapRound;
            _chartLine1.lineJoin = kCALineJoinBevel;
            _chartLine1.fillColor   = [[UIColor whiteColor] CGColor];
            _chartLine1.lineWidth   = 2.0;
            if (self.chooseColor==1) {
                _chartLine1.strokeColor = [UUColor red].CGColor;
            }else if(self.chooseColor==0){
                _chartLine1.strokeColor = [UUColor green].CGColor;
            }else{
                _chartLine1.strokeColor = [UIColor whiteColor].CGColor;
            }
            _chartLine1.lineDashPattern=@[@8,@4];
            [self.layer addSublayer:_chartLine1];
            
            
            
            
            NSString* valueString1=[childAry objectAtIndex:0];
            CGFloat  asfsaf1=[valueString1 floatValue];
            
            float grade1 =(asfsaf1-_yValueMin) / ((float)_yValueMax-_yValueMin);
            
            CGPoint point1 = CGPointMake(xPosition, chartCavanHeight - grade1 * chartCavanHeight+UULabelHeight);
            
            UIBezierPath *progressline1 = [UIBezierPath bezierPath];
            [progressline1 moveToPoint:point1];
            [progressline1 setLineWidth:2.0];
            [progressline1 setLineCapStyle:kCGLineCapRound];
            [progressline1 setLineJoinStyle:kCGLineJoinMiter];
            [progressline1 addLineToPoint:point11111];
            
            _chartLine1.path=progressline1.CGPath;
            
            [self addPoint:point1
                     index:i
                    isShow:isShowMaxAndMinPoint
                     value:firstValue
             withDataIndex:1];
            
            [self addPoint:point11111
                     index:i
                    isShow:isShowMaxAndMinPoint
                     value:[valueString floatValue]
             withDataIndex:0];
            
        }
        
    }
}

- (void)addPoint:(CGPoint)point index:(NSInteger)index isShow:(BOOL)isHollow value:(CGFloat)value withDataIndex:(NSInteger)indexData
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(5, 5, 8, 8)];
    view.center = point;
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 4;
    view.layer.borderWidth = 2;
    view.layer.borderColor =[UIColor whiteColor].CGColor;
    view.backgroundColor = [_colors objectAtIndex:index]?[_colors objectAtIndex:index]:[UIColor whiteColor];
    if (self.chooseColor==2) {
        
        UIImageView* adafasf=[[UIImageView alloc]initWithImage:[self getIndddImage:indexData]];
        adafasf.frame=CGRectMake(point.x-7, point.y-UULabelHeight*2, 13, 13);
        [self addSubview:adafasf];
        
    }else{
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(point.x-UUTagLabelwidth/2.0, point.y-UULabelHeight*2, UUTagLabelwidth, UULabelHeight)];
        label.font = [UIFont systemFontOfSize:14];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        NSString* ADFFS=  [NSString stringWithFormat:@"%@",[NSNumber numberWithFloat:value]];
        
        label.text = ADFFS;
        
        [self addSubview:label];
        
        
        UILabel *labelDu = [[UILabel alloc]initWithFrame:CGRectMake(label.centerX+[self getTextLength:label]/2+1,label.top-1,5,7)];
        labelDu.font = [UIFont systemFontOfSize:10];
        labelDu.textAlignment = NSTextAlignmentCenter;
        labelDu.textColor = [UIColor whiteColor];
        labelDu.text = @"o";
        [self addSubview:labelDu];
        
    }
    [self addSubview:view];
}

-(UIImage*)getIndddImage:(NSInteger)indexxx{
    
    NSDictionary* adsffaf= [self.commonDataSource objectAtIndex:indexxx];
    if (self.indexChooseItem==0) {
        if (![[adsffaf allKeys] containsObject:@"code"])
            return nil;
        NSString* qing=  adsffaf[@"code"];
        if ([qing containsString:@"00"]) {
            NSInteger indexTime=  [[[[_xLabels objectAtIndex:indexxx] componentsSeparatedByString:@":"] objectAtIndex:0] integerValue];
            if(indexTime>=18||indexTime<6){
                qing=@"qingnns";
            }else{
                qing=@"qingicons";
                
            }
            
        }else if ([qing containsString:@"02"]){
            qing=@"yinicons";
        }else if ([qing containsString:@"01"]){
            
            NSInteger indexTime=  [[[[_xLabels objectAtIndex:indexxx] componentsSeparatedByString:@":"] objectAtIndex:0] integerValue];
            if(indexTime>=18||indexTime<6){
                qing=@"duoyunicons";
            }else{
                qing=@"qingzhuanyuicons";
                
            }
        }else if([qing containsString:@"18"]){
            qing=@"wuicons";
        }else if ([qing containsString:@"14"]){
            qing=@"xiaoxueicons";
        }else if ([qing containsString:@"15"]){
            qing=@"zhongxueicons";
        }else if ([qing containsString:@"16"]||[qing containsString:@"26"]||[qing containsString:@"27"]||[qing containsString:@"28"]){
            qing=@"daxueicons";
        }else if ([qing containsString:@"17"]){
            qing=@"baoxueicons";
        }else if ([qing containsString:@"04"]){
            qing=@"leizhenyuicons";
        }else if ([qing containsString:@"08"]||[qing containsString:@"21"]||[qing containsString:@"22"]||[qing containsString:@"23"]||[qing containsString:@"24"]||[qing containsString:@"25"]){
            qing=@"zhongyuicons";
        }else if ([qing containsString:@"09"]||[qing containsString:@"10"]||[qing containsString:@"11"]||[qing containsString:@"12"]||[qing containsString:@"19"]){
            qing=@"dayuicons";
        }else if ([qing containsString:@"03"]){
            qing=@"zhenyuicons";
        }else if ([qing containsString:@"13"]){
            qing=@"zhenxueicons";
        }else if ([qing containsString:@"53"]||[qing containsString:@"54"]||[qing containsString:@"55"]){
            qing=@"wumaiicons";
        }else if ([qing containsString:@"06"]||[qing containsString:@"07"]){
            qing=@"yuicons";
        }
        return IMAGE(qing);
        
    }else if (self.indexChooseItem==1){
        NSString* qing=  adsffaf[@"wind_dir_txt"];
        if ([qing isEqualToString:@"东北风"]){
            qing=@"dongbei";
        }else if ([qing isEqualToString:@"西北风"]){
            qing=@"xibei";
        }else if ([qing isEqualToString:@"东南风"]){
            qing=@"dongnan";
        }else if ([qing isEqualToString:@"西南风"]){
            qing=@"xinan";
        }else if ([qing containsString:@"南"]){
            qing=@"piannan";
        }else if ([qing containsString:@"西"]){
            qing=@"pianxi";
        } else if ([qing containsString:@"东"]){
            qing=@"piandong";
        }else if ([qing containsString:@"北"]) {
            qing=@"pianbei";
        }
        return IMAGE(qing);
    }
    
    return nil;
}

-(float)getTextLength:(UILabel*)adad{
    CGSize titleSize = [adad.text sizeWithFont:adad.font constrainedToSize:CGSizeMake(MAXFLOAT, adad.frame.size.height) lineBreakMode:NSLineBreakByWordWrapping];
    return titleSize.width;
}

- (NSArray *)chartLabelsForX
{
    return [_chartLabelsForX allObjects];
}

@end
