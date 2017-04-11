//
//  NSString+CYExtention.h
//  DialogView
//
//  Created by Charles Yao on 2017/4/10.
//  Copyright © 2017年 Charles Yao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface UILabel (CYExtention)

- (CGSize)boundingRectWithSize:(CGSize)size;

- (CGSize)boundingRectWithSize:(CGSize)size lineSpacing:(CGFloat)lineSpacing paragraphSpacing:(CGFloat)paragraphSpacing;


@end

