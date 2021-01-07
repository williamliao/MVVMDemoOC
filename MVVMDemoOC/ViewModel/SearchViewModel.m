//
//  SearchViewModel.m
//  MVVMDemoOC
//
//  Created by 雲端開發部-廖彥勛 on 2021/1/6.
//

#import "SearchViewModel.h"

@implementation SearchViewModel
- (instancetype)initWithQuality:(NSArray<AirQualityDisplay *> *)levels {
    self = [super init];
    if (self) {
        self.levels = levels;
    }
    return self;
}


@end
