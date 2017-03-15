//
//  AEPickerView.h
//  AEPicekerViewExample
//
//  Created by AirEDoctor on 14/03/2017.
//  Copyright © 2017 AirEDoctor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AEPickerItem.h"

@interface AEPickerView : UIView

/// 数据
@property (nonatomic, copy, readwrite, nullable) AEPickerItem *item;
/// 数据数组
@property (nonatomic, copy, readwrite, nullable) NSArray<id<AEPickerItemProtocol>> *array;

/// 确认，选中的值改成最新的
- (void)confirm;
/// 取消，选中的值变回原来的
- (void)cancel;

- (instancetype _Nonnull)initWithItem:(AEPickerItem *_Nonnull)item;
- (instancetype _Nonnull)initWithArray:(NSArray *_Nonnull)array;

@end

@interface AEPickerItem (AEPickerView)

- (NSString *_Nonnull)textAtIndex:(NSInteger)index;

@end
