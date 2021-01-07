//
//  AirQualityDisplay.m
//  MVVMDemoOC
//
//  Created by 雲端開發部-廖彥勛 on 2021/1/5.
//

#import "AirQualityDisplay.h"

@implementation AirQualityDisplay

- (instancetype)initWithQuality:(nonnull QualityLevel*)level {
    self = [super init];
    if (self) {
        self.aqi = level.aqi;
        self.status = level.status;
        self.location = level.location;
    }
    return self;
}
@end
