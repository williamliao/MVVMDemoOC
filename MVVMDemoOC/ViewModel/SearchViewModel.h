//
//  SearchViewModel.h
//  MVVMDemoOC
//
//  Created by 雲端開發部-廖彥勛 on 2021/1/6.
//

#import <Foundation/Foundation.h>
#import "AirQualityDisplay.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchViewModel : NSObject
- (instancetype)initWithQuality:(NSArray<AirQualityDisplay *> *)levels;
@property (nonatomic, nullable, strong) NSArray<AirQualityDisplay *> * levels;
@end

NS_ASSUME_NONNULL_END
