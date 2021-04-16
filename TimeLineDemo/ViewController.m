//
//  ViewController.m
//  TimeLineDemo
//
//  Created by 中电兴发 on 2021/4/16.
//

#import "ViewController.h"
#import "CollectionTimeCell.h"
// 一天的秒数
static NSInteger const kSecondsOfOneDay = 86400;
static NSString *const timeLineCell = @"CollectionTimeCell";
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSArray *timeArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.timeArray=@[@{@"start": @"60",
                       @"end": @"300"},
                     @{@"start": @"500",
                       @"end": @"800"},
                     @{@"start": @"3600",
                       @"end": @"4800"},
                     @{@"start": @"8501",
                       @"end": @"10000"},
                     @{@"start": @"12000",
                       @"end": @"15797"},
                     @{@"start": @"18800",
                       @"end": @"20000"},
                     @{@"start": @"25000",
                       @"end": @"30000"}];
    [self.view addSubview:self.collectionView];
    
    self.collectionView.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 200);
}
#pragma mark -- UITableDataSource
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger width =kSecondsOfOneDay/300*200;
    CGFloat offset = scrollView.contentOffset.x;
    CGFloat ratio = offset/width;
    NSTimeInterval timeInterval = ratio * 24 * 3600;
     NSInteger hour = timeInterval / 3600;
        NSInteger min = ((NSInteger)timeInterval / 60) % 60;
        NSInteger sec = (NSInteger)timeInterval % 60;
   //滚动停止时候的时间段
    NSLog(@"... %02ld:%02ld:%02ld", (long)hour, (long)min, (long)sec);
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSInteger number =kSecondsOfOneDay/300;
    return number;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
   
    CollectionTimeCell *timeCell = [collectionView dequeueReusableCellWithReuseIdentifier:timeLineCell forIndexPath:indexPath];
    NSInteger time = indexPath.item * 5;
    NSString *timeStr = @"";
   
    if (time < 60) {
        if (time < 10) {
            timeStr = [NSString stringWithFormat:@"00:0%ld",(long)time];
        }else{
            timeStr = [NSString stringWithFormat:@"00:%ld",(long)time];
        }
    }else if (time > 60){
        NSInteger hour = time/60;
        NSInteger minute = time%60;
        if (hour < 10) {
            if (minute < 10) {
                timeStr = [NSString stringWithFormat:@"0%ld:0%ld",(long)hour,(long)minute];
            }else{
                timeStr = [NSString stringWithFormat:@"0%ld:%ld",(long)hour,(long)minute];
            }
           
        }else{
            if (minute < 10) {
                timeStr = [NSString stringWithFormat:@"0%ld:0%ld",(long)hour,(long)minute];
            }else{
                timeStr = [NSString stringWithFormat:@"%ld:%ld",(long)hour,(long)minute];
            }
            
        }
    }
    NSInteger start = indexPath.row*300;
    NSInteger end = indexPath.row*300+300;
    
    timeCell.start = start;
    timeCell.end = end;
    NSLog(@"%ld----%ld",start,end);
    timeCell.timeLb.text = timeStr;
    timeCell.indexLb.text = @(start).stringValue;
    timeCell.datas = self.timeArray;
 
    return timeCell;
    
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize = CGSizeMake(200, 150);
        flowLayout.minimumLineSpacing = 0.1;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 150) collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[CollectionTimeCell class] forCellWithReuseIdentifier:timeLineCell];
    }
    return _collectionView;
}

@end
