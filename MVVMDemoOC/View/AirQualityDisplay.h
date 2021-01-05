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
@property (nonatomic, nullable) NSString *title;
@property (nonatomic, nullable) NSString *subtitle;
@property (nonatomic, nullable) NSString *location;

- (instancetype)initWithQuality:(nonnull QualityLevel*)level;
@end

NS_ASSUME_NONNULL_END
