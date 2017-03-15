//
//  AEPickerView.m
//  AEPicekerViewExample
//
//  Created by AirEDoctor on 14/03/2017.
//  Copyright © 2017 AirEDoctor. All rights reserved.
//

#import "AEPickerView.h"

@implementation AEPickerItem (AEPickerView)

- (NSString *)textAtIndex:(NSInteger)index
{
    return [self.subItems[index].value ae_pickerText];
}

@end

@interface AEPickerView () <UIPickerViewDelegate, UIPickerViewDataSource>

/// 选择器
@property (nonatomic, strong, readonly, nonnull) UIPickerView *pickerView;
/// 数据源
@property (nonatomic, strong, readonly, nullable) NSMutableArray<AEPickerItem *> *dataSource;


@end

@implementation AEPickerView

@dynamic array;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.translatesAutoresizingMaskIntoConstraints = NO;
        
        [self initAllSubViews];
    }
    
    return self;
}

- (instancetype)initWithArray:(NSArray *)array
{
    self = [self init];
    if (self) {
        self.array = array;
    }
    
    return self;
}

- (instancetype)initWithItem:(AEPickerItem *)item
{
    self = [self init];
    if (self) {
        self.item = item;
    }
    
    return self;
}


#pragma mark - 初始化

- (void)initAllSubViews
{
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    _pickerView = pickerView;
    pickerView.backgroundColor = [UIColor whiteColor];
    pickerView.dataSource = self;
    pickerView.delegate = self;
    pickerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:pickerView];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:pickerView
                                                          attribute:NSLayoutAttributeLeading
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self
                                                          attribute:NSLayoutAttributeLeading
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:pickerView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:pickerView
                                                          attribute:NSLayoutAttributeTrailing
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self
                                                          attribute:NSLayoutAttributeTrailing
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:pickerView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0.0]];
}


#pragma mark - setter / getter

- (void)setArray:(NSArray<id<AEPickerItemProtocol>> *)array
{
    self.item = [AEPickerItem itemWithArray:array];
}

- (void)setItem:(AEPickerItem *)item
{
    if (_item != item) {
        _item = [item copy];
    }
    
    [self reloadData];
}


#pragma mark - UIPickerViewDelegate, UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return self.dataSource.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    AEPickerItem *item = self.dataSource[component];
    return item.subItems.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.dataSource[component] textAtIndex:row];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return CGRectGetWidth(self.bounds) / self.dataSource.count;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40.0;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    ///  ********重要提示： 这里只能和dataSource交互，不要去动data及其属性，data及其必须confirm函数执行时更改
    AEPickerItem *item = self.dataSource[component];
    NSInteger selectedIndex = row;
    for (NSInteger i = component + 1; i < self.dataSource.count; i += 1) {
        // 获取旧数据
        AEPickerItem *oldData = self.dataSource[i];
        
        // 更新数据
        self.dataSource[i] = item.subItems[selectedIndex];
        [pickerView reloadComponent:i];
        
        // 获取索引值
        selectedIndex = oldData.selectedIndex;
        
        // 保证索引值不越界
        item = self.dataSource[i];
        if (selectedIndex > item.subItems.count) {
            selectedIndex = item.subItems.count - 1;
        }
    }
}


#pragma mark - 公有方法

- (void)confirm
{
    AEPickerItem *item = self.item;
    for (NSInteger i = 0; i < self.dataSource.count; i += 1) { // 这里是用datasource是因为它的元素个数代表着pickerView的列输，也代表着data的subData层数
        item.selectedIndex = [self.pickerView selectedRowInComponent:i];
        item = item.selectedSubItem;
    }
}

- (void)cancel
{
    AEPickerItem *item = self.item;
    for (NSInteger i = 0; i < self.dataSource.count; i += 1) { // 这里是用datasource是因为它的元素个数代表着pickerView的列输，也代表着data的subData层数
        // 还原数据源
        self.dataSource[i] = item;
        
        // 还原pickerView
        [self.pickerView reloadComponent:i];
        [self.pickerView selectRow:item.selectedIndex inComponent:i animated:NO];
        
        item = item.selectedSubItem;
    }
}


#pragma mark - 私有方法

- (void)reloadData
{
    // 将数据转换成便于选择器使用的数据源
    AEPickerItem *temp = self.item;
    NSMutableArray<AEPickerItem *> *dataSource = [[NSMutableArray alloc] init];
    while (temp.subItems.count > 0) {
        [dataSource addObject:temp];
        
        temp = temp.selectedSubItem;
    }
    _dataSource = dataSource;
    
    [self.pickerView reloadAllComponents];
}


@end
