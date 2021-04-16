//
//  CollectionTimeCell.m
//  KMVideoSlider
//
//  Created by 中电兴发 on 2021/4/15.
//

#import "CollectionTimeCell.h"

@implementation CollectionTimeCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

-(void)setupView{
    CGFloat width =self.frame.size.width;
 
    CGFloat timeLineW = width/5.0;
    for (int i = 0; i<5; i++) {
        UIView *lineView = [[UIView alloc]init];
        lineView.backgroundColor = [UIColor lightGrayColor];
        if (i==0) {
            lineView.frame = CGRectMake(1, 10, 1, 140);
        }else{
            lineView.frame = CGRectMake(i*timeLineW, 30, 1, 110);
        }
        [self addSubview:lineView];
    }
    UILabel *timeLb = [[UILabel alloc]initWithFrame:CGRectMake(0, 130, width, 30)];

    timeLb.backgroundColor = [UIColor orangeColor];

    timeLb.textColor = [UIColor redColor];
    [self addSubview:timeLb];
    self.timeLb = timeLb;
    UIView *timeView = [[UIView alloc]initWithFrame:CGRectMake(0, 10, width, 100)];
    timeView.backgroundColor = [UIColor orangeColor];
    [self addSubview:timeView];
    self.timeView = timeView;
    
}
-(void)setDatas:(NSArray *)datas{
    CGFloat screen_width =self.frame.size.width;
    CGFloat timeLineW = screen_width/5.0;
    CGFloat width = 0;
    _datas = datas;
    for (NSDictionary *timeDic in _datas) {
        NSString *starTimeStr = timeDic[@"start"];
        NSString *endTimeStr = timeDic[@"end"];
        NSInteger startTime = starTimeStr.integerValue;
        NSInteger endTime = endTimeStr.integerValue;
        if ( self.start <= startTime && endTime <= self.end && self.start <= endTime) {
            width = (endTime - startTime)/60*timeLineW;
           CGFloat x =(startTime - self.start)/60*timeLineW;
            if (endTime >= self.end) {
                width = (endTime - startTime)/60*timeLineW;;
            }
            self.timeView.frame = CGRectMake(x, 20, width,100);
            
        }else if (self.start >= startTime && endTime >= self.start && endTime <= self.end){
           
            CGFloat x =0;
            width = (endTimeStr.integerValue- self.start)/60*timeLineW;
            self.timeView.frame = CGRectMake(x, 20, width, 100);
        }else if (self.start > endTime){
            CGFloat x = 0;
            width = 0;
            self.timeView.frame = CGRectMake(x, 20, width, 100);
        }
    
    }
}
//-(void)setWidth:(NSInteger)width{
//
////    NSLog(@"%ld",width);
//}
@end
