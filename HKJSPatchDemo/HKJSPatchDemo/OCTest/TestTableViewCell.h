//
//  TestTableViewCell.h
//  HKJSPatchDemo
//
//  Created by hukaiyin on 16/9/23.
//  Copyright © 2016年 HKY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JSONModel/JSONModel.h>

@interface TestModel : JSONModel
@property (nonatomic, copy) NSString *detail;
@property (nonatomic, copy) NSString *imgName;
@end

@interface TestTableViewCell : UITableViewCell

+ (CGFloat)cellHeight;
- (void)updateWithModel:(TestModel *)model;
@end
