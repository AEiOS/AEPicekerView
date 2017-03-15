//
//  ViewController+CustomObjectExample.m
//  AEPicekerViewExample
//
//  Created by AirEDoctor on 15/03/2017.
//  Copyright © 2017 AirEDoctor. All rights reserved.
//

#import "ViewController+CustomObjectExample.h"
#import "Area.h"
#import "AEPickerView.h"

@implementation ViewController (CustomObjectExample)

#pragma mark - setter / getter

- (AEPickerView *)areaPickerView
{
    if (_areaPickerView == nil) {
        
        NSMutableArray *provinces = [[NSMutableArray alloc] init];
        for (NSString *province in @[@"北京市", @"上海市", @"广东省", @"江苏省"]) {
            Area *area = [[Area alloc] init];
            area.areaName = province;
            [provinces addObject:area];
        }
        
        _areaPickerView = [[AEPickerView alloc] initWithArray:provinces];
    }
    
    return _areaPickerView;
}


@end
