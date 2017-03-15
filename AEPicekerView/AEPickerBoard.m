//
//  AEPickerBoard.m
//  AEPicekerViewExample
//
//  Created by AirEDoctor on 15/03/2017.
//  Copyright © 2017 AirEDoctor. All rights reserved.
//

#import "AEPickerBoard.h"
#import "AEPickerAccessoryBar.h"
#import "AEPickerView.h"

@interface AEPickerBoard ()

@property (nonatomic, strong, readonly, nonnull) AEPickerAccessoryBar *pickerAccessoryBar;
@property (nonatomic, strong, readonly, nonnull) AEPickerView *pickerView;

@end

@implementation AEPickerBoard

@dynamic item;
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
    AEPickerAccessoryBar *pickerAccessoryBar = [[AEPickerAccessoryBar alloc] init];
    _pickerAccessoryBar = pickerAccessoryBar;
    pickerAccessoryBar.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.0];
    [pickerAccessoryBar.cancelButton addTarget:self action:@selector(accessoryBarCancelButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    [pickerAccessoryBar.confirmButton addTarget:self action:@selector(accessoryBarConfirmButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    pickerAccessoryBar.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:pickerAccessoryBar];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:pickerAccessoryBar
                                                    attribute:NSLayoutAttributeLeading
                                                    relatedBy:NSLayoutRelationEqual
                                                       toItem:self
                                                    attribute:NSLayoutAttributeLeading
                                                   multiplier:1.0
                                                      constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:pickerAccessoryBar
                                                     attribute:NSLayoutAttributeTrailing
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTrailing
                                                    multiplier:1.0
                                                      constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:pickerAccessoryBar
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.0
                                                      constant:0.0]];
    [pickerAccessoryBar addConstraint:[NSLayoutConstraint constraintWithItem:pickerAccessoryBar
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                    multiplier:1.0
                                                      constant:40.0]];
    
    AEPickerView *pickerView = [[AEPickerView alloc] init];
    _pickerView = pickerView;
    pickerView.backgroundColor = [UIColor whiteColor];
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
                                                        toItem:pickerAccessoryBar
                                                     attribute:NSLayoutAttributeBottom
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

- (void)setTitle:(NSString *)title
{
    if (_title != title) {
        _title = [title copy];
        self.pickerAccessoryBar.titleLabel.text = title;
    }
}

- (NSArray<id<AEPickerItemProtocol>> *)array
{
    return self.pickerView.array;
}

- (void)setArray:(NSArray<id<AEPickerItemProtocol>> *)array
{
    self.pickerView.array = array;
}

- (void)setItem:(AEPickerItem *)item
{
    self.pickerView.item = item;
}

- (AEPickerItem *)item
{
    return self.pickerView.item;
}


#pragma mark - 私有方法

- (void)accessoryBarConfirmButtonDidClicked:(UIButton *)button
{
    [self.pickerView confirm];
    if (self.confirmButtonDidClickedAction != nil) {
        self.confirmButtonDidClickedAction(self, button);
    }
    
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

- (void)accessoryBarCancelButtonDidClicked:(UIButton *)button
{
    [self.pickerView cancel];
    if (self.cancelButtonDidClickedAction != nil) {
        self.cancelButtonDidClickedAction(self, button);
    }
    
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}


@end
