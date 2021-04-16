//
//  CollectionTimeCell.h
//  KMVideoSlider
//
//  Created by 中电兴发 on 2021/4/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionTimeCell : UICollectionViewCell
@property(nonatomic,strong) UILabel *timeLb;
@property(nonatomic,assign) NSInteger start;
@property(nonatomic,assign) NSInteger end;
@property(nonatomic,strong)UILabel *indexLb;
@property(nonatomic,copy) NSArray *datas;
@property(nonatomic,strong)UIView *timeView;
@end

NS_ASSUME_NONNULL_END
