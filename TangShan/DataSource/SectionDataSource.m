//
//  SectionDataSource.m
//  Chope
//
//  Created by 王卓譞￼ on 13-12-11.
//
//

#import "SectionDataSource.h"


@interface SectionDataSource ()

@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) CellConfigureBlock configureCellBlock;

@end
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation SectionDataSource


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithItems:(id)items
           sections:(NSArray *)theSections
sectionTitleIndexes:(NSArray *)theSectionTitleIndexes
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(CellConfigureBlock)aConfigureCellBlock
{
  self = [super init];
  if (self) {
    _items = items;
    _cellIdentifier = aCellIdentifier;
    _configureCellBlock = [aConfigureCellBlock copy];
    _sections = theSections;
    _sectionTitleIndexes = theSectionTitleIndexes;
  }
  return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark UITableViewDataSource


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  if (self.sections) {
    NSArray *items = nil;

    if ([self.items isKindOfClass:[NSArray class]]) {
      items = [self.items objectAtIndex:section];

    } else {
      items = [self.items objectForKey:self.sections[section]];
    }

    return items.count;

  } else {
    return [self.items count];
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
                                                          forIndexPath:indexPath];
  id item = [self itemAtIndexPath:indexPath];
  self.configureCellBlock(cell, item);
  return cell;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return self.sections ? self.sections.count : 1;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  if (self.sections.count) {
    return [self.sections objectAtIndex:section];

  } else {
    return nil;
  }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
  if (self.sectionTitleIndexes) {
    return self.sectionTitleIndexes;
  }

  return nil;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSInteger)tableView:(UITableView *)tableView
sectionForSectionIndexTitle:(NSString *)title
               atIndex:(NSInteger)index {

  if (!self.sections || !self.sectionTitleIndexes) {
    return 0;
  }

  NSInteger count = 0;

  for (NSString *idx in self.sectionTitleIndexes) {

    if ([idx isEqualToString:title]) {
      return count;
    }

    count ++;
  }

  return (index - 1) > 0 ? (index - 1) : 0;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Public


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
  if (self.sections) {

    NSArray *section = nil;
    if ([self.items isKindOfClass:[NSArray class]]) {
      section = [self.items objectAtIndex:indexPath.section];

    } else {
      section = [self.items objectForKey:self.sections[indexPath.section]];
    }

    return [section objectAtIndex:indexPath.row];

  } else {
    return [self.items objectAtIndex:indexPath.row];
  }
}

@end
