//
//  UITextView+Placeholder.m
//  ApplyDemo
//
//  Created by Golden on 2018/9/6.
//  Copyright © 2018年 Golden. All rights reserved.
//

#import "UITextView+Placeholder.h"
#import <objc/runtime.h>

@implementation UITextView (Placeholder)

- (void)setPlaceholder:(NSString *)placeholder placeholderColor:(UIColor *)placeholderColor {

    static char keyPlaceHolderLabel = '\0';
    UILabel *placeHolderLbl = objc_getAssociatedObject(self, &keyPlaceHolderLabel);
    if (placeHolderLbl) {
        return;
    }
    UILabel *placeHolderLabel = [[UILabel alloc]init];
    placeHolderLabel.text = placeholder;
    placeHolderLabel.numberOfLines = 0;
    placeHolderLabel.textColor = placeholderColor;
    placeHolderLabel.font = self.font;
    placeHolderLabel.textAlignment = self.textAlignment;
    [placeHolderLabel sizeToFit];
    objc_setAssociatedObject(self, &keyPlaceHolderLabel, placeHolderLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addSubview:placeHolderLabel];
    
    //KVC键值编码，对UITextView的私有属性进行修改
    [self setValue:placeHolderLabel forKey:@"_placeholderLabel"];
}

@end
