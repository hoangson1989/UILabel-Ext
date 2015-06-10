//
//  UILabel+Ext.m
//  Mobo-iOS-ObjectiveC
//
//  Created by hoann on 11/18/14.
//  Copyright (c) 2014 Nam Truong. All rights reserved.
//

#import "UILabel+Ext.h"
#import "NSString+Ext.h"

@implementation UILabel (Ext)

-(void)makeSizeToFixWordWrap:(CGFloat)height{
    self.lineBreakMode = NSLineBreakByWordWrapping;
    self.numberOfLines = 0;
    self.frame = CGRectMake(0, 0, height, 0);
    [self sizeToFit];
}
-(CGRect)rectForText:(NSString*)text{
    NSRange range = [[self text]rangeOfString:text];
    NSString* str = [[self text]substringToIndex:(range.location+ range.length)];
    NSString* str1 = [[self text]substringToIndex:range.location-1];
    NSMutableParagraphStyle *titleParagraphStyle = [[NSMutableParagraphStyle alloc] init];
    titleParagraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    
    CGRect rect = [str boundingRectWithSize:CGSizeMake(self.frame.size.width, 99999.0)
                                                   options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading
                                                attributes:@{
                                                             NSFontAttributeName: self.font,
                                                             NSParagraphStyleAttributeName: titleParagraphStyle
                                                             }
                                                   context:nil];
    CGRect rectNoText = [str1 boundingRectWithSize:CGSizeMake(self.frame.size.width, 99999.0)
                                    options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading
                                 attributes:@{
                                              NSFontAttributeName: self.font,
                                              NSParagraphStyleAttributeName: titleParagraphStyle
                                              }
                                    context:nil];
    
    CGRect textRect = [text boundingRectWithSize:CGSizeMake(self.frame.size.width, 99999.0)
                                    options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading
                                 attributes:@{
                                              NSFontAttributeName: self.font,
                                              NSParagraphStyleAttributeName: titleParagraphStyle
                                              }
                                    context:nil];
    textRect.origin.x = rect.size.width - textRect.size.width;
    if (round(rect.size.height) == round(rectNoText.size.height)) {
        textRect.origin.y = round(rect.size.height) - textRect.size.height;
    }else{
        textRect.origin.y = round(rectNoText.size.height);
    }
    if (textRect.origin.y < 0) {
        textRect.origin.y = 0;
    }
    return textRect;
}
@end
