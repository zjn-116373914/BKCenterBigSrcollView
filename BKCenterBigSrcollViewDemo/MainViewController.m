//
//  MainViewController.m
//  BKCenterBigSrcollViewDemo
//
//  Created by 张加宁 on 2017/3/25.
//  Copyright © 2017年 BlackKnife. All rights reserved.
//

#import "MainViewController.h"
#import "BKCenterBigSrcollView.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //框架外[核心代码]
    NSArray *imgNameArray = @[@"ScrollViewImage_1",@"ScrollViewImage_2",@"ScrollViewImage_3",@"ScrollViewImage_4"];
    NSArray *backgroundNameArray = @[@"Background_1",@"Background_2",@"Background_3",@"Background_4"];
    BKCenterBigSrcollView *mainScrollView = [[BKCenterBigSrcollView centerBigScroll] initWithImageNameArray:imgNameArray withBackgroundNameArray:backgroundNameArray];
    [mainScrollView loadCenterBigSrcollViewMainFunction];
    //--------------------------------------------------------------------------------
    
    [self.view addSubview:mainScrollView];
    
}



@end
