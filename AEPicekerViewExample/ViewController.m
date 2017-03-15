//
//  ViewController.m
//  AEPicekerViewExample
//
//  Created by AirEDoctor on 14/03/2017.
//  Copyright © 2017 AirEDoctor. All rights reserved.
//

#import "ViewController.h"
#import "AEPickerView.h"
#import "AEPickerAccessoryBar.h"
#import "Area.h"
#import "AEPickerBoard.h"

@interface Area (AEPickerItem)<AEPickerItemProtocol>

@end

@implementation Area (AEPickerItem)

- (NSString *)ae_pickerText
{
    return self.areaName;
}

@end


@interface ViewController () <UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.areaTextField];
    [self.view addSubview:self.heightTextField];
    [self.view addSubview:self.gradeTextField];
    [self.view addSubview:self.weightTextField];
}


#pragma mark - setter / getter

- (AEPickerAccessoryBar *)pickerAccessoryBar
{
    if (_pickerAccessoryBar == nil) {
        _pickerAccessoryBar = [[AEPickerAccessoryBar alloc] initWithFrame:CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width, 40.0)];
        _pickerAccessoryBar.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.0];
        [_pickerAccessoryBar.cancelButton addTarget:self action:@selector(accessoryBarCancelButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_pickerAccessoryBar.confirmButton addTarget:self action:@selector(accessoryBarConfirmButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _pickerAccessoryBar;
}

- (UITextField *)areaTextField
{
    if (_areaTextField == nil) {
        _areaTextField = [self createTextFieldWithFrame:CGRectMake(20.0, 20.0, 300.0, 30.0) inputView:self.areaPickerView];
        _areaTextField.inputAccessoryView = self.pickerAccessoryBar;
        _areaTextField.delegate = self;
    }
    
    return _areaTextField;
}

- (UITextField *)heightTextField
{
    if (_heightTextField == nil) {
        _heightTextField = [self createTextFieldWithFrame:CGRectMake(20.0, 60.0, 300.0, 30.0) inputView:self.heightPickerView];
        _heightTextField.inputAccessoryView = self.pickerAccessoryBar;
        _heightTextField.delegate = self;
    }
    
    return _heightTextField;
}

- (UITextField *)gradeTextField
{
    if (_gradeTextField == nil) {
        _gradeTextField = [self createTextFieldWithFrame:CGRectMake(20.0, 100.0, 300.0, 30.0) inputView:self.gradePickerView];
        _gradeTextField.inputAccessoryView = self.pickerAccessoryBar;
        _gradeTextField.delegate = self;
    }
    
    return _gradeTextField;
}

- (UITextField *)weightTextField
{
    if (_weightTextField == nil) {
        _weightTextField = [self createTextFieldWithFrame:CGRectMake(20.0, 140.0, 300.0, 30.0) inputView:self.weightPickerBoard];
    }
    
    return _weightTextField;
}


#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.editingTextField = textField;
    
    if (textField == self.areaTextField) {
        self.pickerAccessoryBar.titleLabel.text = @"地址";
    }
    else if (textField == self.heightTextField) {
        self.pickerAccessoryBar.titleLabel.text = @"身高";
    }
    else if (textField == self.gradeTextField) {
        self.pickerAccessoryBar.titleLabel.text = @"等级";
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.editingTextField = nil;
}


#pragma mark - 私有方法

- (UITextField *)createTextFieldWithFrame:(CGRect)frame inputView:(UIView *)inputView
{
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.inputView = inputView;
    
    return textField;
}

- (void)accessoryBarConfirmButtonDidClicked:(UIButton *)button
{
    if (self.editingTextField == self.areaTextField) {
        [self.areaPickerView confirm];
        
        self.areaTextField.text = [self.areaPickerView.item ae_pickerText];
    }
    else if (self.editingTextField == self.heightTextField) {
        [self.heightPickerView confirm];
        
        AEPickerItem *item = self.heightPickerView.item;
        self.heightTextField.text = [[item ae_pickerText] stringByAppendingString:[item.selectedSubItem ae_pickerText]];
    }
    else if (self.editingTextField == self.gradeTextField) {
        [self.gradePickerView confirm];
        
        self.gradeTextField.text = [self.gradePickerView.item ae_pickerText];
    }
    
    [self.view endEditing:YES];
}

- (void)accessoryBarCancelButtonDidClicked:(UIButton *)button
{
    if (self.editingTextField == self.areaTextField) {
        [self.areaPickerView cancel];
    }
    else if (self.editingTextField == self.heightTextField) {
        [self.heightPickerView cancel];
    }
    else if (self.editingTextField == self.gradeTextField) {
        [self.gradePickerView cancel];
    }
    
    [self.view endEditing:YES];
}


@end
