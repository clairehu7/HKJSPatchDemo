//
//  TestTableViewCell.m
//  HKJSPatchDemo
//
//  Created by hukaiyin on 16/9/23.
//  Copyright © 2016年 HKY. All rights reserved.
//

#import "TestTableViewCell.h"
#import <MBProgressHUD/MBProgressHUD.h>

@implementation TestModel

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end

@interface TestTableViewCell ()
@property (nonatomic, strong) UISwitch *switchView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIImageView *imgView;
@end

@implementation TestTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self commonInit];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
    if (!selected) {
        return;
    }
    [self setNeedsLayout];
    if (!_switchView.on) {
        return;
    } else {
        [MBProgressHUD showHUDAddedTo:self.superview animated:YES];
        [self performSelector:@selector(hideHUD) withObject:nil afterDelay:1];
    }
}

- (void)hideHUD {
    [MBProgressHUD hideHUDForView:self.superview animated:YES];
}


- (void)commonInit {
    CGFloat cellWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat cellHeight = [[self class] cellHeight];
    _switchView = [[UISwitch alloc]init];
    _switchView.frame = CGRectMake(cellWidth - 71, (cellHeight - 31)/2, 51, 31);
    _switchView.on = YES;
    [_switchView addTarget:self action:@selector(switchTUI:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_switchView];
    
    _label = [[UILabel alloc]init];
    _label.frame = CGRectMake(100, 0, cellWidth - 200, cellHeight);
    _label.numberOfLines = 0;
    [self.contentView addSubview:_label];
    
    _imgView = [[UIImageView alloc]init];
    _imgView.frame = CGRectMake(20, 10, 60, 60);
    [self.contentView addSubview:_imgView];
    
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = 1.5;
    lpgr.delegate = self;
    [self.contentView addGestureRecognizer:lpgr];
}

-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
      
        NSString *message = @"switchOn";
        if (!_switchView.on) {
            message = @"switchOff";
        } else {
            message = @"switchOn";
        }
        [UIColor colorWithRed:0.3 green:0.5 blue:0.1 alpha:1];
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:okAction];
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];

    }
    
}

- (void)switchTUI:(UISwitch *)sender {
    if (!sender.on) {
        self.backgroundColor = [UIColor blackColor];
        _label.textColor = [UIColor whiteColor];
    } else {
        self.backgroundColor = [UIColor whiteColor];
        _label.textColor = [UIColor blackColor];
    }
}

- (void)updateWithModel:(TestModel *)model {
    self.label.text = model.detail;
    self.imgView.image = [UIImage imageNamed:model.imgName];
}

+(CGFloat)cellHeight {
    return 80;
}

@end
