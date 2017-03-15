//
//  ViewController+AEPickerBoardExample.m
//  AEPicekerViewExample
//
//  Created by AirEDoctor on 15/03/2017.
//  Copyright © 2017 AirEDoctor. All rights reserved.
//

#import "ViewController+AEPickerBoardExample.h"
#import "AEPickerBoard.h"

@implementation ViewController (AEPickerBoardExample)

#pragma mark - setter / getter

- (AEPickerBoard *)weightPickerBoard
{
    if (_weightPickerBoard == nil) {
        _weightPickerBoard = [[AEPickerBoard alloc] initWithArray:@[@"30kg以下", @"30kg~40kg", @"40kg~50kg", @"50~60kg", @"60kg~70kg", @"70kg以上"]];
        _weightPickerBoard.title = @"体重";
        typeof(self) weakSelf = self;
        [_weightPickerBoard setConfirmButtonDidClickedAction:^(AEPickerBoard * _Nonnull pickerBoard, UIButton * _Nonnull confirmButton) {
            weakSelf.weightTextField.text = [pickerBoard.item ae_pickerText];
            [weakSelf.view endEditing:YES];
        }];
        [_weightPickerBoard setCancelButtonDidClickedAction:^(AEPickerBoard * _Nonnull pickerBoard, UIButton * _Nonnull confirmButton) {
            [weakSelf.view endEditing:YES];
        }];
    }
    
    return _weightPickerBoard;
}

@end
