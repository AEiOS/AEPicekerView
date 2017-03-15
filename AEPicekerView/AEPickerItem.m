//
//  AEPickerItem.m
//  AEPicekerViewExample
//
//  Created by AirEDoctor on 14/03/2017.
//  Copyright © 2017 AirEDoctor. All rights reserved.
//

#import "AEPickerItem.h"

@implementation AEPickerItem

@dynamic selectedSubItem;
@dynamic selectedValue;

- (instancetype)initWithArray:(NSArray<id<AEPickerItemProtocol>> *)array value:(id<AEPickerItemProtocol>)value
{
    self = [super init];
    if (self) {
        NSMutableArray *subItems = [[NSMutableArray alloc] initWithCapacity:array.count];
        for (id obj in array) {
            if ([obj conformsToProtocol:@protocol(AEPickerItemProtocol)]) {
                if ([obj isKindOfClass:[AEPickerItem class]]) {
                    [subItems addObject:obj];
                }
                else {
                    [subItems addObject:[[self class] itemWithValue:obj]];
                }
            }
#ifdef DEBUG
            else {
                NSString *message = [NSString stringWithFormat:@"%@未遵守AEPickerItemProtocol协议", [obj class]];
                NSAssert(0, message);
            }
#endif
        }
        _subItems = [subItems copy];
        
        if (value != nil) {
            self.value = value;
        }
    }
    
    return self;

}
- (instancetype)initWithArray:(NSArray<id<AEPickerItemProtocol>> *)array
{
    return [self initWithArray:array value:nil];
}

- (instancetype)initWithValue:(id<AEPickerItemProtocol>)value
{
    self = [super init];
    if (self) {
        self.value = value;
    }
    
    return self;
}

+ (instancetype)itemWithArray:(NSArray<id<AEPickerItemProtocol>> *)array value:(id<AEPickerItemProtocol>)value
{
    return [[self alloc] initWithArray:array value:value];
}

+ (instancetype)itemWithArray:(NSArray<id<AEPickerItemProtocol>> *)array
{
    return [self itemWithArray:array value:nil];
}

+ (instancetype)itemWithValue:(id<AEPickerItemProtocol>)value
{
    return [[self alloc] initWithValue:value];
}


#pragma mark - setter / getter

- (id<AEPickerItemProtocol>)selectedValue
{
    return self.selectedSubItem.value;
}

- (AEPickerItem *)selectedSubItem
{
    return self.subItems[self.selectedIndex];
}

- (void)setSelectedIndex:(NSInteger)selectedIndex
{
    if (_selectedIndex != selectedIndex) {
        if (selectedIndex >= self.subItems.count) {
            _selectedIndex = self.subItems.count - 1;
        }
        else {
            _selectedIndex = selectedIndex;
        }
    }
}

- (void)setSubItems:(NSArray<AEPickerItem *> *)subItems
{
    if (_subItems != subItems) {
        _subItems = [subItems copy];
        
        if (self.selectedIndex >= subItems.count) {
            self.selectedIndex = subItems.count - 1;
        }
    }
}

- (id<AEPickerItemProtocol>)value
{
    if (_value == nil) {
        return @"";
    }
    
    return _value;
}


#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    typeof(self) copy = [[[self class] allocWithZone:zone] init];
    copy.value = self.value;
    copy.subItems = self.subItems;
    copy.selectedIndex = self.selectedIndex;
    return copy;
}


#pragma mark - AEPickerItemProtocol

- (NSString *)ae_pickerText
{
    return [self.selectedValue ae_pickerText];
}


@end


@implementation NSString (AEPickerItem)

- (NSString *_Nonnull)ae_pickerText
{
    return self;
}

@end
