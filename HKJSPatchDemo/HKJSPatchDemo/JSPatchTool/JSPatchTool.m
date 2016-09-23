//
//  JSPatchTool.m
//  HKJSPatchDemo
//
//  Created by hukaiyin on 16/9/23.
//  Copyright © 2016年 HKY. All rights reserved.
//

#import "JSPatchTool.h"
#import "JPEngine.h"

@implementation JSPatchTool

+ (void)updateWithJSFileName:(NSString *)fileName {
    [JPEngine startEngine];
    //读取js文件
    NSString *sourcePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"js"];
    NSString *script = [NSString stringWithContentsOfFile:sourcePath encoding:NSUTF8StringEncoding error:nil];
    //运行js文件
    [JPEngine evaluateScript:script];
}

@end
