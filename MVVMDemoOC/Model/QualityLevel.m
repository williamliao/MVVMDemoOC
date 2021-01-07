//
//  QualityLevel.m
//  MVVMDemoOC
//
//  Created by 雲端開發部-廖彥勛 on 2021/1/5.
//

#import "QualityLevel.h"

@implementation QualityLevel
- (instancetype)initWithLocation:(NSString*)location aqi:(NSString*)aqi status:(NSString*)status
{
    self = [super init];
    if (self) {
        self.location = location;
        self.aqi = aqi;
        self.status = status;
    }
    return self;
}
@end
