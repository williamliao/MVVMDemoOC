//
//  AirQualityTableViewCell.h
//  MVVMDemoOC
//
//  Created by 雲端開發部-廖彥勛 on 2021/1/5.
//

#import <UIKit/UIKit.h>
#import "AirQualityDisplay.h"

NS_ASSUME_NONNULL_BEGIN

@interface AirQualityTableViewCell : UITableViewCell
- (void)setDisplay:(AirQualityDisplay *)display;
- (UIColor *)setupBackgroudColor:(NSInteger)value;
@end

NS_ASSUME_NONNULL_END
