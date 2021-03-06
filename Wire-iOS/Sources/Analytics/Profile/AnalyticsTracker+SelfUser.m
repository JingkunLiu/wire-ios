// 
// Wire
// Copyright (C) 2016 Wire Swiss GmbH
// 
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program. If not, see http://www.gnu.org/licenses/.
// 


#import "AnalyticsTracker+SelfUser.h"

@implementation AnalyticsTracker (SelfUser)


- (void)tagNameChanged:(NSString *)name
{
    NSUInteger components = [name componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].count;
    
    NSDictionary *attributes = @{
                                 AnalyticsEventTypeEditSelfUserFieldKey : AnalyticsEventTypeEditSelfUserFieldName,
                                 AnalyticsEventTypeEditSelfUserActionKey : AnalyticsEventTypeEditSelfUserActionModified,
                                 AnalyticsEventTypeEditSelfUserComponentsKey : @(components)
                                 };
    
    [self tagEvent:AnalyticsEventTypeEditSelfUser attributes:attributes];
}

- (void)tagPictureChanged
{

    NSDictionary *attributes = @{
                                 AnalyticsEventTypeEditSelfUserFieldKey : AnalyticsEventTypeEditSelfUserFieldPicture,
                                 AnalyticsEventTypeEditSelfUserActionKey : AnalyticsEventTypeEditSelfUserActionModified,
                                 };
    
    [self tagEvent:AnalyticsEventTypeEditSelfUser attributes:attributes];
    
}

- (void)tagSwitchColorScheme:(SettingsColorScheme)colorScheme
{
    NSDictionary *attributes = @{ AnalyticsEventTypeThemeSelectedKey : colorScheme == SettingsColorSchemeLight ? AnalyticsEventTypeThemeLight : AnalyticsEventTypeThemeDark };
    
    [self tagEvent:AnalyticsEventTypeTheme attributes:attributes];
}


@end
