//
//  ViewController+AEPickerViewExample.m
//  AEPicekerViewExample
//
//  Created by AirEDoctor on 15/03/2017.
//  Copyright © 2017 AirEDoctor. All rights reserved.
//

#import "ViewController+AEPickerViewExample.h"
#import "AEPickerView.h"

@implementation ViewController (AEPickerViewExample)

#pragma mark - setter / getter

- (AEPickerView *)heightPickerView
{
    if (_heightPickerView == nil) {
        NSMutableArray *height = [NSMutableArray array];
        for (NSInteger i = 10; i < 22; i += 1) {
            AEPickerItem *item = [AEPickerItem itemWithArray:@[@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9"] value:[NSString stringWithFormat:@"%ld", i]];
            [height addObject:item];
        }
        
        _heightPickerView = [[AEPickerView alloc] initWithArray:height];
        _heightPickerView.frame = CGRectMake(0.0, 0.0, 320.0, 100.0);
    }
    
    return _heightPickerView;
}

- (AEPickerView *)gradePickerView
{
    if (_gradePickerView == nil) {
        _gradePickerView = [[AEPickerView alloc] initWithArray:@[@"初级", @"中级", @"高级", @"金牌"]];
        _gradePickerView.frame = CGRectMake(0.0, 0.0, 320.0, 100.0);
    }
    
    return _gradePickerView;
}


@end
