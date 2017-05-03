//
//  SectionDataSource.h
//  Chope
//
//  Created by 王卓譞￼ on 13-12-11.
//
//

#import <Foundation/Foundation.h>

#import "ListDataSource.h"


@interface SectionDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) id items;
@property (nonatomic, strong) NSArray *sections;
@property (nonatomic, strong) NSArray *sectionTitleIndexes;

- (id)initWithItems:(NSArray *)anItems
           sections:(NSArray *)theSections
sectionTitleIndexes:(NSArray *)theSectionTitleIndexes
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(CellConfigureBlock)aConfigureCellBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
