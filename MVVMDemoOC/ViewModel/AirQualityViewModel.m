//
//  AirQualityViewModel.m
//  MVVMDemoOC
//
//  Created by 雲端開發部-廖彥勛 on 2021/1/5.
//

#import "AirQualityViewModel.h"
#import "airQualityFetcher.h"

@interface AirQualityViewModel()
@property (nonatomic, strong) id<AirQualityFetcherProtocol> fetcher;
@property (nonatomic, strong) NSArray<AirQualityDisplay *> *items;

@end

@implementation AirQualityViewModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.items = @[];
        self.fetcher = [[airQualityFetcher alloc] initWithParser:[[airQualityParser alloc] init]];
    }
    return self;
}

- (void)getAirQualityWithSuccess:(void (^)(NSArray<AirQualityDisplay*> *levels))successCompletion error:(void (^)(NSError *error))errorCompletion {
    
    __weak AirQualityViewModel *weakSelf = self;
    [self.fetcher fetchAirQualityWithSuccess:^(NSArray<QualityLevel *> *levels) {
        
        NSMutableArray * items = [[NSMutableArray alloc] init];
        for (QualityLevel *level in levels) {
            [items addObject:[[AirQualityDisplay alloc] initWithQuality:level]];
        }
        [weakSelf setItems:items];
        successCompletion(items);
    } error:errorCompletion];
}

- (NSUInteger)numberOfItems {
    if ([self isSearching]) {
        return self.filterItems.count;
    } else {
        return self.items.count;
    }
}

- (NSUInteger)numberOfSections {
    return 1;
}

- (AirQualityDisplay *)itemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self isSearching]) {
        if (indexPath.row >= self.filterItems.count) {
            return nil;
        }
        return self.filterItems[indexPath.row];
    } else {
        if (indexPath.row >= self.items.count) {
            return nil;
        }
        return self.items[indexPath.row];
    }
}

- (void)setIsSearching:(BOOL)isSearching {
    _isSearching = isSearching;
}
@end
