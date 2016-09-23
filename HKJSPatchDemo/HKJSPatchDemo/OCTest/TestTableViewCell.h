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

@end

@interface TestTableViewCell : UITableViewCell
- (void)updateWithModel:(TestModel *)model;
@end
