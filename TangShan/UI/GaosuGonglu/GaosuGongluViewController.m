//
//  GaosuGongluViewController.m
//  TangShan
//
//  Created by Tony on 1/6/16.
//  Copyright © 2016 Tang Shan. All rights reserved.
//

#import "GaosuGongluViewController.h"
#import "LLLLViewController.h"
#import "CitySearchViewController.h"
#import "GaosuContentView.h"

#define MAXMAP 11
#define MINMAP 9

@interface GaosuGongluViewController ()<HardaHttpClientDelegate,BMKMapViewDelegate,BMKLocationServiceDelegate,CitySearchViewControllerDelegate>
@property (nonatomic) BMKLocationService *locationService;
@property (nonatomic) NSArray *annotationList;
@property(assign,nonatomic)BOOL isChangeMax;
@property(strong,nonatomic)BMKUserLocation* nowLocation;
@property(strong,nonatomic)NSString* expwyName;
@property(strong,nonatomic)NSMutableDictionary* dictionaryContent;
@property(strong,nonatomic)NSMutableDictionary* dictionaryContentLukuang;
@property(assign,nonatomic) NSInteger indexTab;
@property(strong,nonatomic)GaosuContentView* gaosuContentView;
@end

@implementation GaosuGongluViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.gaoSuView=[[GaoSuView alloc]initWithFrame:self.view.frame];
    self.gaoSuView.delegate=self;
    [self.view addSubview:self.gaoSuView];
    [self.gaoSuView.mScrollView setHidden:YES];
    //    self.gaoSuView.locationLable.text=[GloableInfo getDefaultCityInfo][@"sName"];
    self.gaoSuView.locationLable.text=@"交通气象";
    [self setLocationService:[[BMKLocationService alloc] init]];
    [[self locationService] setDelegate:self];
    
    self.dictionaryContent=[[NSMutableDictionary alloc]init];
    self.dictionaryContentLukuang=[[NSMutableDictionary alloc]init];
    
    [self.gaoSuView.locationButton addTarget:self action:@selector(afsf) forControlEvents:UIControlEventTouchUpInside];
    
    
    [ self.gaoSuView.mapView setDelegate:self];
    [self.gaoSuView.mapView setUserTrackingMode:BMKUserTrackingModeNone];
    [self.gaoSuView.mapView setShowsUserLocation:YES];
    [self.gaoSuView.mapView setZoomLevel:15];
    [self getData:nil];
    
    
    [self.gaoSuView.buttonXingche addTarget:self action:@selector(xingchedddd) forControlEvents:UIControlEventTouchUpInside];
    [self.gaoSuView.buttonLuKuang addTarget:self action:@selector(lukuangdddd) forControlEvents:UIControlEventTouchUpInside];
    
    self.gaoSuView.buttonTianqi.tag=1;
    self.gaoSuView.buttonLukuangTOP.tag=0;
    self.gaoSuView.buttonYubao.tag=2;
    
    [self.gaoSuView.buttonLukuangTOP setSelected:YES];
    
    [self.gaoSuView.buttonTianqi addTarget:self action:@selector(tianqiAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.gaoSuView.buttonLukuangTOP addTarget:self action:@selector(tianqiAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.gaoSuView.buttonYubao addTarget:self action:@selector(tianqiAction:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)tianqiAction:(UIButton*)button{
    NSInteger indexTab=button.tag;
    self.indexTab=indexTab;
    
    if (indexTab==0) {
        [self.gaoSuView.buttonLukuangTOP setSelected:YES];
        [self.gaoSuView.buttonTianqi setSelected:NO];
        [self.gaoSuView.buttonYubao setSelected:NO];
    }else if (indexTab==1){
        [self.gaoSuView.buttonLukuangTOP setSelected:NO];
        [self.gaoSuView.buttonTianqi setSelected:YES];
        [self.gaoSuView.buttonYubao setSelected:NO];
    }else{
        [self.gaoSuView.buttonLukuangTOP setSelected:NO];
        [self.gaoSuView.buttonTianqi setSelected:NO];
        [self.gaoSuView.buttonYubao setSelected:YES];
    }
    [self initWithData:nil];
    
}


-(void)xingchedddd{
    LLLLViewController* SFASF=[[LLLLViewController alloc]initWithNibName:nil bundle:nil];
    SFASF.indexTable=0;
    [self.navigationController pushViewController:SFASF animated:YES];
}

-(void)lukuangdddd{
    
    LLLLViewController* SFASF=[[LLLLViewController alloc]initWithNibName:nil bundle:nil];
    SFASF.indexTable=1;
    [self.navigationController pushViewController:SFASF animated:YES];
}

-(void)afsf{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSString* adsf=self.gaoSuView.locationLable.text;
    if ([adsf isEqualToString:[GloableInfo getLocationCityInfo][@"sName"]]){
        self.gaoSuView.locationImageView.image=IMAGE(@"location");
    }else{
        self.gaoSuView.locationImageView.image=nil;
    }
    
    //    [self checkNeedReloadData];
    [self.gaoSuView.mapView viewWillAppear];
    [[self locationService] startUserLocationService];
}

-(void)checkNeedReloadData{
    NSString* afaf=[[GloableInfo getDefaultCityInfo] objectForKey:@"sName"];
    NSString* adaf= self.gaoSuView.locationLable.text;
    if (![afaf isEqual:adaf]) {
        self.gaoSuView.locationLable.text=afaf;
        [self getData:nil];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.gaoSuView.mapView viewWillDisappear];
    [[self locationService] stopUserLocationService];
    [[self locationService] setDelegate:nil];
}

#pragma mark HardaHttpDelegate
-(void)initWithData:(NSDictionary*)contentData{
    
    [self.gaoSuView.mapView removeAnnotations:[self annotationList]];
    NSMutableArray *pointsArray = [[NSMutableArray alloc] init];
    if (self.indexTab==0) {
        for (int i = 0; i < [self.dictionaryContentLukuang[@"info"] count]; i++) {
            NSDictionary* daF=[self.dictionaryContentLukuang[@"info"] objectAtIndex:i];
            BMKPointAnnotation *point = [[BMKPointAnnotation alloc] init];
            point.title = daF[@"stationName"];
            point.coordinate = CLLocationCoordinate2DMake([daF[@"lat"] doubleValue],[daF[@"lng"] doubleValue]);
            [pointsArray addObject:point];
        }
    }else{
        for (int i = 0; i < [self.dictionaryContent[@"info"] count]; i++) {
            NSDictionary* daF=[self.dictionaryContent[@"info"] objectAtIndex:i];
            BMKPointAnnotation *point = [[BMKPointAnnotation alloc] init];
            point.title = daF[@"stationName"];
            point.coordinate = CLLocationCoordinate2DMake([daF[@"lat"] doubleValue],[daF[@"lng"] doubleValue]);
            [pointsArray addObject:point];
        }
    }
    
    [self setAnnotationList:pointsArray];
    [self.gaoSuView.mapView addAnnotations:pointsArray];
    self.gaoSuView.mapView.zoomLevel=12;
    [self.gaoSuView.mapView setCenterCoordinate:self.nowLocation.location.coordinate animated:YES];
    //    [self.gaoSuView.mapView showAnnotations:pointsArray animated:YES];
}

- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation {
    BMKAnnotationView *view = [[BMKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"cell"];
    //     NSInteger Dad=[[annotation subtitle] integerValue];
    //     NSString* adff=[(NSArray*)self.dictionaryContent[@"info"] objectAtIndex:Dad][@"content"];
    //    if ([mapView getMapStatus].fLevel>=MAXMAP) {
    //        if ([adff containsString:@"关闭"]){
    //            view.image=IMAGE(@"guanbi");
    //        }else{
    //            view.image=IMAGE(@"adsaffs");
    //        }
    //    }else{
    //        if ([adff containsString:@"关闭"]){
    //            view.image=IMAGE(@"guanbis11");
    //        }else{
    //            view.image=IMAGE(@"adsaffs");
    //        }
    //
    //    }
    view.image=IMAGE(@"adsaffs");
    return view;
}


- (void) mapView:(BMKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    for (NSInteger i=0; i<self.annotationList.count; i++) {
        BMKAnnotationView* adasf=   [mapView viewForAnnotation:[self.annotationList objectAtIndex:i]];
        NSString* adff=nil;
        if (self.indexTab==0) {
            adff=[(NSArray*)self.dictionaryContentLukuang[@"info"] objectAtIndex:i][@"content"];
        }else{
            adff=[(NSArray*)self.dictionaryContent[@"info"] objectAtIndex:i][@"content"];
        }
        if ([mapView getMapStatus].fLevel>=MAXMAP) {
            
            if ([adff containsString:@"关闭"]) {
                adasf.image=IMAGE(@"guanbi");
            }else{
                adasf.image=IMAGE(@"adsaffs");
            }
        }else{
            if ([adff containsString:@"关闭"]) {
                adasf.image=IMAGE(@"guanbis11");
            }else{
                adasf.image=IMAGE(@"adsaffs");
            }
        }
        
    }
    
}


- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation {
    self.nowLocation=userLocation;
    [self.gaoSuView.mapView setCenterCoordinate:userLocation.location.coordinate animated:YES];
    [self.gaoSuView.mapView updateLocationData:userLocation];
    [[self locationService] stopUserLocationService];
}


- (void)mapView:(BMKMapView *)mapView didSelectAnnotationView:(BMKAnnotationView *)view {
    [self.gaoSuView.mapView setCenterCoordinate:view.annotation.coordinate animated:YES];
    NSInteger ZFSFD= [self.annotationList indexOfObject:[view annotation]];
    NSDictionary* mDictionary=  nil;
    if (self.indexTab==0) {
        mDictionary=  [self.dictionaryContentLukuang[@"info"] objectAtIndex:ZFSFD];
    }else{
        mDictionary=  [self.dictionaryContent[@"info"] objectAtIndex:ZFSFD];
    }
    
    if (self.gaosuContentView) {
        [self.gaosuContentView removeFromSuperview];
        self.gaosuContentView=nil;
    }
    
    
    self.gaosuContentView=[[GaosuContentView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:self.gaosuContentView];
    self.gaosuContentView.titleLable.text=mDictionary[@"stationName"];
    if (self.indexTab==2) {
        self.gaosuContentView.contentLable.text=mDictionary[@"tianqi"];
    }else{
        self.gaosuContentView.contentLable.text=mDictionary[@"content"];
    }
    
    [self.gaosuContentView.buttton addTarget:self action:@selector(diddddddd:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)diddddddd:(UIButton*)button{
    if (self.gaosuContentView) {
        [self.gaosuContentView removeFromSuperview];
        self.gaosuContentView=nil;
    }
}

-(void)getData:(NSString*)expwyName{
    self.expwyName=expwyName;
    [SVProgressHUD showWithStatus:NSLocalizedString(@"loading", @"") maskType:SVProgressHUDMaskTypeClear];
    NSMutableDictionary* dictionary=[[NSMutableDictionary alloc]init];
    if (expwyName.length>0) {
        [dictionary setObject:expwyName forKey:@"expwyName"];
    }
    
    [[HardaHttpClient sharedClient] getDataWithUrl:getBuchongUrl withParameters:nil deledate:self];
    
    [NSThread sleepForTimeInterval:0.5];
    
    
    [[HardaHttpClient sharedClient] getDataWithUrl:publishCarUrl withParameters:dictionary deledate:self];
    
    
}

-(void)didLoadResponse:(NSDictionary*)response fromUrl:(NSString*)url{
    [SVProgressHUD dismiss];
    if ([url isEqual:getBuchongUrl]) {
        [self.dictionaryContentLukuang removeAllObjects];
        NSArray* DAFFF=  (NSArray*)response;
        NSMutableDictionary* ADF=[[NSMutableDictionary alloc]init];
        NSMutableArray* adaff=[[NSMutableArray alloc]init];
        for (NSDictionary* DASFAFF in DAFFF) {
            NSMutableDictionary* ADSFF=[[NSMutableDictionary alloc]init];
            ADSFF[@"stationName"]=DASFAFF[@"tollStationName"];
            ADSFF[@"lat"]=DASFAFF[@"lat"];
            ADSFF[@"lng"]=DASFAFF[@"lng"];
            ADSFF[@"content"]=[NSString stringWithFormat:@"%@\n%@",DASFAFF[@"offDirection"],DASFAFF[@"desc"]];
            [adaff addObject:ADSFF];
            
        }
        ADF[@"info"]=adaff;
        self.dictionaryContentLukuang=ADF;
        
        [self initWithData:nil];
        
    }else{
        [self.dictionaryContent removeAllObjects];
        
        if ([response isKindOfClass:[NSArray class]]) {
            NSMutableArray* adffs=  [[NSMutableArray alloc]init];
            NSArray* adasf= (NSArray*) response;
            for (NSDictionary* adf in adasf) {
                
                for (NSDictionary* Adaff in adf[@"info"]) {
                    NSMutableDictionary* adafff=[[NSMutableDictionary alloc]init];
                    adafff[@"lat"]=Adaff[@"basic"][@"lat"];
                    adafff[@"lng"]=Adaff[@"basic"][@"lng"];
                    adafff[@"stationName"]=Adaff[@"basic"][@"stationName"];
                    NSString* adsff=[NSString stringWithFormat:@"%.1f",[Adaff[@"now"][@"tmp"] floatValue]];
                    adafff[@"content"]=[NSString stringWithFormat:@"温度:%@℃\n湿度:%@%%\n小时降水量%@mm\n能见度:%@米\n风向:%@\n风速:%@级",adsff,Adaff[@"now"][@"hum"],Adaff[@"now"][@"pcpn"],Adaff[@"now"][@"vis"],Adaff[@"now"][@"wind_dir_txt"],Adaff[@"now"][@"wind_sc"]];
                    NSString* txt_d= Adaff[@"forecast"][@"txt_d"];
                    NSString* txt_n= Adaff[@"forecast"][@"txt_n"];
                    if (![txt_d isEqual:txt_n]) {
                        txt_d=[NSString stringWithFormat:@"%@转%@",txt_d,txt_n];
                    }
                    
                    NSString* wind_b_txt=Adaff[@"forecast"][@"wind_b_txt"];
                    NSString* wind_e_txt=Adaff[@"forecast"][@"wind_e_txt"];
                    
                    if (![wind_b_txt isEqual:wind_e_txt]) {
                        wind_b_txt=[NSString stringWithFormat:@"%@转%@",wind_b_txt,wind_e_txt];
                    }
                    
                    NSString* min_tmp=[NSString stringWithFormat:@"%.1f",[Adaff[@"forecast"][@"min_tmp"] floatValue]];
                    
                    NSString* max_tmp=[NSString stringWithFormat:@"%.1f",[Adaff[@"forecast"][@"max_tmp"] floatValue]];
                    adafff[@"tianqi"]=[NSString stringWithFormat:@"%@,%@~%@℃,%@",txt_d,min_tmp,max_tmp,wind_b_txt];
                    
                    [adffs addObject:adafff];
                }
            }
             self.dictionaryContent[@"info"]=adffs;
            
        }else{
            NSMutableArray* adffs=  [[NSMutableArray alloc]init];
            for (NSDictionary* Adaff in response[@"info"]) {
                NSMutableDictionary* adafff=[[NSMutableDictionary alloc]init];
                adafff[@"lat"]=Adaff[@"basic"][@"lat"];
                adafff[@"lng"]=Adaff[@"basic"][@"lng"];
                adafff[@"stationName"]=Adaff[@"basic"][@"stationName"];
                NSString* adsff=[NSString stringWithFormat:@"%.1f",[Adaff[@"now"][@"tmp"] floatValue]];
                
                adafff[@"content"]=[NSString stringWithFormat:@"温度:%@℃\n湿度:%@%%\n小时降水量%@mm\n能见度:%@米\n风向:%@\n风速:%@级",adsff,Adaff[@"now"][@"hum"],Adaff[@"now"][@"pcpn"],Adaff[@"now"][@"vis"],Adaff[@"now"][@"wind_dir_txt"],Adaff[@"now"][@"wind_sc"]];
                NSString* txt_d= Adaff[@"forecast"][@"txt_d"];
                NSString* txt_n= Adaff[@"forecast"][@"txt_n"];
                if (![txt_d isEqual:txt_n]) {
                    txt_d=[NSString stringWithFormat:@"%@转%@",txt_d,txt_n];
                }
                
                NSString* wind_b_txt=Adaff[@"forecast"][@"wind_b_txt"];
                NSString* wind_e_txt=Adaff[@"forecast"][@"wind_e_txt"];
                
                if (![wind_b_txt isEqual:wind_e_txt]) {
                    wind_b_txt=[NSString stringWithFormat:@"%@转%@",wind_b_txt,wind_e_txt];
                }
                
                NSString* min_tmp=[NSString stringWithFormat:@"%.1f",[Adaff[@"forecast"][@"min_tmp"] floatValue]];
                
                NSString* max_tmp=[NSString stringWithFormat:@"%.1f",[Adaff[@"forecast"][@"max_tmp"] floatValue]];
                adafff[@"tianqi"]=[NSString stringWithFormat:@"%@,%@~%@℃,%@",txt_d,min_tmp,max_tmp,wind_b_txt];
                
                [adffs addObject:adafff];
            }
            self.dictionaryContent[@"info"]=adffs;
        }
      
    }
}
-(void)didFailLoadWithResponse:(NSDictionary*)response{
    [SVProgressHUD dismissWithError:response[@"MESSAGE"]];
}
-(void)didLoadTimeOut{
    [SVProgressHUD dismissWithError:@"网络请求超时,请稍后再试"];
}

-(void)viewCancel:(NSInteger)index
{
    if(index==0){
        [self.gaoSuView.mScrollView setHidden:YES];
    }else{
        CitySearchViewController* DAfsAS=[[CitySearchViewController alloc]initWithNibName:nil bundle:nil];
        DAfsAS.type=1;
        DAfsAS.delegate=self;
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:DAfsAS];
        [nav.navigationBar setOpaque:NO];
        [self presentViewController:nav animated:YES completion:nil];
    }
}

-(void)afaffaf:(NSDictionary*)adaff{
    NSLog(@"-------------%@",adaff[@"sName"]);
    self.gaoSuView.locationLable.text=adaff[@"sName"];
    [self getData:adaff[@"sName"]];
}

@end
