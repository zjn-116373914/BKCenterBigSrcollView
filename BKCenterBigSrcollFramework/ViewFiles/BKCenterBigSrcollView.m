#import "BKCenterBigSrcollView.h"


//宏定义屏幕长宽以及其他参数
#define ScreenWidth   [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
#define HeadHeight    20
#define NavigationItemHeight 44
#define TabBarItemHeight     49

@interface BKCenterBigSrcollView()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *mainScrollView;
@property (nonatomic, assign) NSInteger numOfDisplayImageView;
@property (nonatomic, strong) NSMutableArray *mainImageNameMarray;
@property (nonatomic, strong) NSMutableArray *backgroundNameMarray;
@property (nonatomic, strong) UIScrollView *gestureControlScrollView;

@property (nonatomic, strong) NSMutableArray *mArrayOfDisplayImageView;
@property (nonatomic, strong) UIImageView *currentSelectImgView;


@end

@implementation BKCenterBigSrcollView
#pragma mark - 系统方法
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.mainImageNameMarray = [[NSMutableArray alloc] init];
        self.backgroundNameMarray = [[NSMutableArray alloc] init];
        self.mArrayOfDisplayImageView = [[NSMutableArray array] init];
    }
    return self;
}

#pragma mark ---------------------------------------------------------------------------

#pragma mark - [外部开放]方法
//[初始化]方法
+ (instancetype)centerBigScroll
{
    return  [[self alloc] init];
}


- (instancetype)initWithImageNameArray:(NSArray*)imageNameArray withBackgroundNameArray:(NSArray*)backgroundNameArray
{
    self = [super init];
    if (self)
    {
        self.mainImageNameMarray = [NSMutableArray arrayWithArray:imageNameArray];
        self.backgroundNameMarray = [NSMutableArray arrayWithArray:backgroundNameArray];
        self.mArrayOfDisplayImageView = [[NSMutableArray array] init];
        
    }
    return self;
}


//[设置主试图坐标]方法
- (void)setPositionWithX:(CGFloat)x Y:(CGFloat)y
{
    self.x = x;
    self.y = y;
}


//[设置主试图大小]方法
- (void)setSizeWithWidth:(CGFloat)width Height:(CGFloat)height
{
    self.width = width;
    self.height = height;
}


//[添加小型图标]放入滑动试图方法
- (void)addImageNameToCenterBigSrcollView:(NSString*)imageName
{
    [self.mainImageNameMarray addObject:imageName];
}


//[添加背景图像]放入滑动试图方法
- (void)addBackgroundNameToCenterBigSrcollView:(NSString*)backgroundName
{
    [self.backgroundNameMarray addObject:backgroundName];
}


//最终加载[主方法]
- (void)loadCenterBigSrcollViewMainFunction
{
    [self installCenterBigSrcollView];
    [self addSubview:self.mainScrollView];
    [self installDisplayImageViewToMainScrollView];
    [self addSubview:self.gestureControlScrollView];
}
#pragma mark ---------------------------------------------------------------------------

#pragma mark - [基本控件加载]方法
//[加载主视图]方法
- (void)installCenterBigSrcollView
{
    self.width = ScreenWidth;
    self.height  = ScreenHeight/4.5;
    self.x = 0;
    self.y = 0;
    
    self.backgroundColor = [UIColor lightGrayColor];
    self.userInteractionEnabled = YES;
    self.image = [UIImage imageNamed:self.backgroundNameMarray[0]];
    
    self.numOfDisplayImageView = 3;
    self.rateOfBig = 1.20;
}


//[加载小型图标试图]方法
- (void)installDisplayImageViewToMainScrollView
{
    CGFloat displayImageViewWidth = (1.0*self.mainScrollView.width)/self.numOfDisplayImageView;
    CGFloat displayImageViewHeight= self.mainScrollView.height;
    CGFloat displayImageViewSpaceHeight = 0.1*displayImageViewHeight;
    
    for (int i=1; i<=(self.mainImageNameMarray.count); i++)
    {
        UIImageView *displayImageView = [[UIImageView alloc] init];
        displayImageView.frame = CGRectMake(i*displayImageViewWidth, displayImageViewSpaceHeight, displayImageViewWidth, displayImageViewHeight - 2*displayImageViewSpaceHeight);
        displayImageView.image = [UIImage imageNamed:self.mainImageNameMarray[i-1]];
        
        if(displayImageView.width > displayImageView.height)
        {
            displayImageView.layer.cornerRadius = displayImageView.height/2.0;
        }
        else
        {
            displayImageView.layer.cornerRadius = displayImageView.width/2.0;
        }
        displayImageView.clipsToBounds = YES;
        
        [self.mainScrollView addSubview:displayImageView];
        
        /**[标记]当前选中[图像按钮控件]**/
        if(i == 1)
        {
            self.currentSelectImgView = displayImageView;
            self.currentSelectImgView.transform = CGAffineTransformMakeScale(self.rateOfBig, self.rateOfBig);
            [self.mainScrollView bringSubviewToFront:self.currentSelectImgView];
        }
        
        [self.mArrayOfDisplayImageView addObject:displayImageView];
    }
}
#pragma mark ---------------------------------------------------------------------------

#pragma mark - UIScrollViewDelegate - ScrollView协议方法
//UIScrollView[滑动任何时刻]监控方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat gestureControlScrollViewX = scrollView.contentOffset.x;
    
    CGFloat rateOfMoving = ((1.0*self.width)/self.numOfDisplayImageView)/(scrollView.width);
    CGFloat mainScrollViewX = gestureControlScrollViewX*rateOfMoving;
    
    self.mainScrollView.contentOffset = CGPointMake(mainScrollViewX, 0);
}


//UIScrollView[滑动减速结束后]监控方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.currentSelectImgView.transform = CGAffineTransformMakeScale(1, 1);
    
    CGFloat gestureControlScrollViewX = scrollView.contentOffset.x;
    NSInteger indexOfSelectImgView = gestureControlScrollViewX/(scrollView.width);
    
    self.currentSelectImgView = self.mArrayOfDisplayImageView[indexOfSelectImgView];
    self.currentSelectImgView.transform = CGAffineTransformMakeScale(self.rateOfBig, self.rateOfBig);
    [self.mainScrollView bringSubviewToFront:self.currentSelectImgView];
    
    self.image = [UIImage imageNamed:self.backgroundNameMarray[indexOfSelectImgView]];
}
#pragma mark ---------------------------------------------------------------------------

#pragma mark - GettingAndSetting - 预加载全局试图
/**[主要UIScrollView滑动试图]预加载**/
-(UIScrollView *)mainScrollView
{
    if(!_mainScrollView)
    {
        _mainScrollView = [[UIScrollView alloc] init];
        _mainScrollView.frame = CGRectMake(0, 0, self.width, self.height);
        
        CGFloat contentSizeWidth = (_mainScrollView.width/self.numOfDisplayImageView)*(self.mainImageNameMarray.count + 2);
        _mainScrollView.contentSize = CGSizeMake(contentSizeWidth, _mainScrollView.height);
        _mainScrollView.pagingEnabled = YES;
        _mainScrollView.scrollEnabled = NO;
    }
    
    return _mainScrollView;
}


/**[滑动手势UIScrollView试图]预加载**/
-(UIScrollView *)gestureControlScrollView
{
    if(!_gestureControlScrollView)
    {
        _gestureControlScrollView = [[UIScrollView alloc] init];
        _gestureControlScrollView.frame = CGRectMake(self.x, self.y, self.width, self.height);
        _gestureControlScrollView.contentSize = CGSizeMake((self.mainImageNameMarray.count)*_gestureControlScrollView.width, _gestureControlScrollView.height);
        _gestureControlScrollView.pagingEnabled = YES;
        _gestureControlScrollView.bounces = NO;
        _gestureControlScrollView.showsHorizontalScrollIndicator = NO;
        
        _gestureControlScrollView.delegate = self;
    }
    
    return _gestureControlScrollView;
}
#pragma mark ---------------------------------------------------------------------------

@end
