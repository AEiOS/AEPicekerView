//
//  AEPickerItem.h
//  AEPicekerViewExample
//
//  Created by AirEDoctor on 14/03/2017.
//  Copyright © 2017 AirEDoctor. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AEPickerItemProtocol <NSObject>

/// 在piclerView上显示的文字
@property (nonatomic, copy, readonly, nonnull) NSString *ae_pickerText;

@end

@interface AEPickerItem : NSObject <NSCopying, AEPickerItemProtocol>

/// 值
@property (nonatomic, strong, readwrite, nonnull) id<AEPickerItemProtocol> value;

/// 子数据
@property (nonatomic, copy, readonly, nullable) NSArray<AEPickerItem *> *subItems;
/// 选中数据的索引
@property (nonatomic, assign, readwrite) NSInteger selectedIndex;
/// 选中的子数据
@property (nonatomic, strong, readonly, nullable) AEPickerItem *selectedSubItem;
/// 当前选中的值
@property (nonatomic, strong, readonly, nullable) id<AEPickerItemProtocol> selectedValue;

- (instancetype _Nonnull)initWithArray:(NSArray<id<AEPickerItemProtocol>> *_Nonnull)array;
- (instancetype _Nonnull)initWithArray:(NSArray<id<AEPickerItemProtocol>> *_Nonnull)array value:(id<AEPickerItemProtocol> _Nullable)value;
+ (instancetype _Nonnull)itemWithArray:(NSArray<id<AEPickerItemProtocol>> *_Nonnull)array;
+ (instancetype _Nonnull)itemWithArray:(NSArray<id<AEPickerItemProtocol>> *_Nonnull)array value:(id<AEPickerItemProtocol> _Nullable)value;

@end


@interface NSString (AEPickerItem)<AEPickerItemProtocol>

- (NSString *_Nonnull)ae_pickerText;

@end
