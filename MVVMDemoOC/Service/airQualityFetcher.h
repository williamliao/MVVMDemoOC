//
//  airQualityFetcher.h
//  MVVMDemoOC
//
//  Created by 雲端開發部-廖彥勛 on 2021/1/5.
//

#import <Foundation/Foundation.h>
#import "QualityLevel.h"
#import "airQualityParser.h"

NS_ASSUME_NONNULL_BEGIN

@protocol AirQualityFetcherProtocol <NSObject>

- (void)fetchAirQualityWithSuccess:(void (^)(NSArray<QualityLevel *> *levels))successCompletion error:(void (^)(NSError *error))errorCompletion;

@end

@interface airQualityFetcher : NSObject<AirQualityFetcherProtocol>

- (instancetype)initWithParser:(id<AirQualityParserProtocol>)parser;
@end

NS_ASSUME_NONNULL_END
