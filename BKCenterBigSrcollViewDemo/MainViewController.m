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
    
    /**框架外[核心代码]**/
    NSArray *imgNameArray = @[@"StarCraft1",@"StarCraft2",@"StarCraft3",@"StarCraft4",@"StarCraft5"];
    BKCenterBigSrcollView *mainScrollView = [[BKCenterBigSrcollView centerBigScroll] initWithImageNameArray:imgNameArray];
    [mainScrollView loadCenterBigSrcollViewMainFunction];
    /**--------------------------------------**/
    
    [self.view addSubview:mainScrollView];
    
}



@end
