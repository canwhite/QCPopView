//
//  ExampleViewController.m
//  QCPopView
//
//  Created by 乔超 on 2017/8/8.
//  Copyright © 2017年 BoYaXun. All rights reserved.
//

#import "ExampleViewController.h"
#import "QCPopView.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface ExampleViewController ()<QCPopViewDelegate>

@property (nonatomic, strong) NSMutableArray *titleArray;
@property (nonatomic, strong) NSMutableArray *imageArr;
@property (nonatomic, strong) UIButton *testButton;
@property (nonatomic, strong) QCPopView *QCPopView;



@end

@implementation ExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initTitleArray];
    [self initSubViews];
    
}


//懒加载标题数组
- (NSMutableArray *)titleArray{
    if (!_titleArray) {
        _titleArray = [NSMutableArray array];
    }
    return _titleArray;
}

//要现在堆中建立位置
-(NSMutableArray *)imageArr{
    if (!_imageArr) {
        _imageArr = [NSMutableArray new];
    }
    return _imageArr;
}

- (void)initTitleArray{
    //给此数组传递popView的各项标题
    [self.titleArray addObject:@"测试1"];
    [self.titleArray addObject:@"测试2"];
    [self.titleArray addObject:@"测试3"];
    [self.titleArray addObject:@"测试4"];
    [self.titleArray addObject:@"测试5"];
    [self.titleArray addObject:@"测试6"];
    [self.titleArray addObject:@"测试7"];
    [self.titleArray addObject:@"测试8"];
    [self.titleArray addObject:@"测试9"];
    

    
}

- (void)initSubViews{
    //此按钮可改成自己的控件
    _testButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _testButton.frame = CGRectMake(100, 100, 200, 100);
    [_testButton setTitle:@"测试按钮" forState:UIWindowLevelNormal];
    [_testButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_testButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    _testButton.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_testButton];
    
}

- (void)buttonClick{
    
    //初始化
    _QCPopView = [[QCPopView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width , self.view.frame.size.height)];
    //遵守协议
    _QCPopView.QCPopViewDelegate = self;
    //传递数据
    [_QCPopView showThePopViewWithArray:self.titleArray];
    
    
}

#pragma mark - QCPopViewDelegate

-(void)getTheButtonTitleWithIndexPath:(NSIndexPath *)indexPath{
    
    
    NSString *buttonStr = self.titleArray[indexPath.row];
    [_testButton setTitle:buttonStr forState:UIControlStateNormal];
    [_QCPopView dismissThePopView];


}




@end
