//
//  ViewController.h
//  AEPicekerViewExample
//
//  Created by AirEDoctor on 14/03/2017.
//  Copyright © 2017 AirEDoctor. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AEPickerBoard;
@class AEPickerView;
@class AEPickerAccessoryBar;

@interface ViewController : UIViewController
{
    UITextField *_areaTextField;
    AEPickerView *_areaPickerView;
    UITextField *_heightTextField;
    AEPickerView *_heightPickerView;
    UITextField *_gradeTextField;
    AEPickerView *_gradePickerView;
    UITextField *_weightTextField;
    AEPickerBoard *_weightPickerBoard;
    AEPickerAccessoryBar *_pickerAccessoryBar;
}

@property (nonatomic, strong, readwrite, nullable) UITextField *editingTextField;

@property (nonatomic, strong, readonly, nonnull) UITextField *areaTextField;
@property (nonatomic, strong, readonly, nonnull) AEPickerView *areaPickerView;
@property (nonatomic, strong, readonly, nonnull) UITextField *heightTextField;
@property (nonatomic, strong, readonly, nonnull) AEPickerView *heightPickerView;
@property (nonatomic, strong, readonly, nonnull) UITextField *gradeTextField;
@property (nonatomic, strong, readonly, nonnull) AEPickerView *gradePickerView;
@property (nonatomic, strong, readonly, nonnull) UITextField *weightTextField;
@property (nonatomic, strong, readonly, nonnull) AEPickerBoard *weightPickerBoard;

@property (nonatomic, strong, readonly, nonnull) AEPickerAccessoryBar *pickerAccessoryBar;

@end
