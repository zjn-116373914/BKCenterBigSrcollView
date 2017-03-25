#import <UIKit/UIKit.h>
#import "UIView+Layout.h"


@interface BKCenterBigSrcollView : UIImageView
//[初始化]方法
+ (instancetype)centerBigScroll;
- (instancetype)initWithImageNameArray:(NSArray*)imageNameArray withBackgroundNameArray:(NSArray*)backgroundNameArray;

//[添加小型图标]放入滑动试图方法
- (void)addImageNameToCenterBigSrcollView:(NSString*)imageName;
//[添加背景图像]放入滑动试图方法
- (void)addBackgroundNameToCenterBigSrcollView:(NSString*)backgroundName;

//[设置主试图坐标]方法
- (void)setPositionWithX:(CGFloat)x Y:(CGFloat)y;
//[设置主试图大小]方法
- (void)setSizeWithWidth:(CGFloat)width Height:(CGFloat)height;

//最终加载[主方法]
- (void)loadCenterBigSrcollViewMainFunction;

//[放大比例]属性
@property (nonatomic, assign) CGFloat rateOfBig;

@end
