//
//  AirQualityDisplay.h
//  MVVMDemoOC
//
//  Created by 雲端開發部-廖彥勛 on 2021/1/5.
//

#import <Foundation/Foundation.h>
#import "QualityLevel.h"

NS_ASSUME_NONNULL_BEGIN

@class QualityLevel;
@interface AirQualityDisplay : NSObject
@property (nonatomic, nullable) NSString *location;
@property (nonatomic, nullable) NSString *status;
@property (nonatomic, nullable) NSString *aqi;

- (instancetype)initWithQuality:(nonnull QualityLevel*)level;
@end

NS_ASSUME_NONNULL_END
