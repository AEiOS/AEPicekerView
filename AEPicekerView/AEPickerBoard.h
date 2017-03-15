//
//  AEPickerBoard.h
//  AEPicekerViewExample
//
//  Created by AirEDoctor on 15/03/2017.
//  Copyright © 2017 AirEDoctor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AEPickerItem.h"

@interface AEPickerBoard : UIView

@property (nonatomic, copy, readwrite, nullable) NSString *title;
/// 数据
@property (nonatomic, copy, readwrite, nullable) AEPickerItem *item;
/// 数据数组
@property (nonatomic, copy, readwrite, nullable) NSArray<id<AEPickerItemProtocol>> *array;

@property (nonatomic, copy, readwrite, nullable) void(^confirmButtonDidClickedAction)(AEPickerBoard *_Nonnull pickerBoard, UIButton *_Nonnull confirmButton);
@property (nonatomic, copy, readwrite, nullable) void(^cancelButtonDidClickedAction)(AEPickerBoard *_Nonnull pickerBoard, UIButton *_Nonnull cancelButton);


- (instancetype _Nonnull)initWithItem:(AEPickerItem *_Nonnull)item;
- (instancetype _Nonnull)initWithArray:(NSArray<id<AEPickerItemProtocol>> *_Nonnull)array;

- (void)setConfirmButtonDidClickedAction:(void (^ _Nullable)(AEPickerBoard * _Nonnull pickerBoard, UIButton * _Nonnull confirmButton))confirmButtonDidClickedAction;
- (void)setCancelButtonDidClickedAction:(void (^ _Nullable)(AEPickerBoard * _Nonnull pickerBoard, UIButton * _Nonnull confirmButton))cancelButtonDidClickedAction;

@end
