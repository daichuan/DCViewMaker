//
//  UILabel+DCMaker.m
//  DCViewMaker
//
//  Created by 戴川 on 2019/4/15.
//  Copyright © 2019 DC. All rights reserved.
//

#import "UILabel+DCMaker.h"

@implementation UILabel (DCMaker)
+(DCLabelMaker *)dcMaker_creat{
    DCLabelMaker *maker = DCLabelMaker.new;
    maker.viewAttribute = DCViewAttribute.new;
    return maker;
}

@end
