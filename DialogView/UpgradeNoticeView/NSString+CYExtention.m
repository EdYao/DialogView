//
//  NSString+CYExtention.m
//  DialogView
//
//  Created by Charles Yao on 2017/4/10.
//  Copyright © 2017年 Charles Yao. All rights reserved.
//
#import "NSString+CYExtention.h"


@implementation UILabel (CYExtention)

- (CGSize)boundingRectWithSize:(CGSize)size
{
    if (![self isKindOfClass:[UILabel class]] || self == nil|| self == NULL) {
        return CGSizeMake(0, 0);
    }
    
    NSDictionary *attribute = @{NSFontAttributeName: self.font};
    
    CGSize retSize = CGSizeZero;
    retSize = [self.text boundingRectWithSize:size
                                      options:\
               NSStringDrawingTruncatesLastVisibleLine |
               NSStringDrawingUsesLineFragmentOrigin |
               NSStringDrawingUsesFontLeading
                                   attributes:attribute
                                      context:nil].size;
    
    return retSize;
}

- (CGSize)boundingRectWithSize:(CGSize)size lineSpacing:(CGFloat)lineSpacing paragraphSpacing:(CGFloat)paragraphSpacing{
    if (![self isKindOfClass:[UILabel class]] || self == nil|| self == NULL) {
        return CGSizeMake(0, 0);
    }
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    /** 行高 */
    // NSKernAttributeName字体间距
    paraStyle.lineSpacing = lineSpacing;
    paraStyle.paragraphSpacing = paragraphSpacing;
    
    NSDictionary *attribute = @{NSFontAttributeName:self.font, NSParagraphStyleAttributeName:paraStyle};
    
    CGSize retSize = CGSizeZero;
    retSize = [self.text boundingRectWithSize:size
                                      options:\
               NSStringDrawingTruncatesLastVisibleLine |
               NSStringDrawingUsesLineFragmentOrigin |
               NSStringDrawingUsesFontLeading
                                   attributes:attribute
                                      context:nil].size;
    
    return retSize;
    
}


@end
