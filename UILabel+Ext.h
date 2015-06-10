//
//  UILabel+Ext.h
//  Mobo-iOS-ObjectiveC
//
//  Created by hoann on 11/18/14.
//  Copyright (c) 2014 Nam Truong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UILabel (Ext)
-(void)makeSizeToFixWordWrap:(CGFloat)height;
-(CGRect)rectForText:(NSString*)text;
@end
