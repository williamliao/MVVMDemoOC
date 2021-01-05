//
//  QualityLevel.m
//  MVVMDemoOC
//
//  Created by 雲端開發部-廖彥勛 on 2021/1/5.
//

#import "QualityLevel.h"

@implementation QualityLevel
- (instancetype)initWithLocation:(NSString*)location aqi:(NSString*)aqi pm10:(NSString*)pm10 pm2_5:(NSString*)pm2_5
{
    self = [super init];
    if (self) {
        self.location = location;
        self.aqi = aqi;
        self.pm10 = pm10;
        self.pm2_5 = pm2_5;
    }
    return self;
}
@end
