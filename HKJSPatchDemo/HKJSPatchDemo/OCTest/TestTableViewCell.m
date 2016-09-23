//
//  TestTableViewCell.m
//  HKJSPatchDemo
//
//  Created by hukaiyin on 16/9/23.
//  Copyright © 2016年 HKY. All rights reserved.
//

#import "TestTableViewCell.h"

@interface TestTableViewCell ()

@end

@implementation TestModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end

@implementation TestTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)init {
    self = [super init];
    if (!self) {
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)commonInit {
    
}


- (void)updateWithModel:(TestModel *)model {
    
}

@end
