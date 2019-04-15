//
//  DCViewAttribute.m
//  DCViewMaker
//
//  Created by 戴川 on 2019/4/15.
//  Copyright © 2019 DC. All rights reserved.
//

#import "DCViewAttribute.h"

@implementation DCViewAttribute
-(instancetype)init{
    if(self = [super init]){
        _frame = CGRectZero;
        _cornerRadius = 0;
        _backgroundColor = [UIColor whiteColor];

        _text = @"";
        _textColor = [UIColor blackColor];
        _fontWeight = UIFontWeightRegular;
        _font = 17;
        _textAlignment = NSTextAlignmentLeft;
        _numberOfLines = 1;
        
        
    }
    return self;
}
@end
