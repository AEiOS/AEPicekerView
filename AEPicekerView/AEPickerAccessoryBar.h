//
//  AEPickerAccessoryBar.h
//  AEPicekerViewExample
//
//  Created by AirEDoctor on 14/03/2017.
//  Copyright © 2017 AirEDoctor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AEPickerAccessoryBar : UIView

/// 标题标签
@property (nonatomic, strong, readonly, nonnull) UILabel *titleLabel;
/// 取消按钮
@property (nonatomic, strong, readonly, nonnull) UIButton *cancelButton;
/// 确认按钮
@property (nonatomic, strong, readonly, nonnull) UIButton *confirmButton;

@end
