# BKCenterBigSrcollView
该框架是一个能够加载小型图标的滑动试图.滑动试图最多能够显示3个加载的小型图标,并且中间的那个图标会有变大特性.

例如:

    //框架外[核心代码]
    NSArray *imgNameArray = @[@"ScrollViewImage_1",@"ScrollViewImage_2",@"ScrollViewImage_3",@"ScrollViewImage_4"];
    NSArray *backgroundNameArray = @[@"Background_1",@"Background_2",@"Background_3",@"Background_4"];
    BKCenterBigSrcollView *mainScrollView = [[BKCenterBigSrcollView centerBigScroll] initWithImageNameArray:imgNameArray withBackgroundNameArray:backgroundNameArray];
    [mainScrollView loadCenterBigSrcollViewMainFunction];
    //--------------------------------------------------------------------------------
    
    [self.view addSubview:mainScrollView];
