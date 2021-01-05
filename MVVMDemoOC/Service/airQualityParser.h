//
//  airQualityParser.h
//  MVVMDemoOC
//
//  Created by 雲端開發部-廖彥勛 on 2021/1/5.
//

#import <Foundation/Foundation.h>
#import "QualityLevel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol AirQualityParserProtocol <NSObject>

- (void)parserAirQualitys:(NSData *)data withSuccess:(void (^)(NSArray<QualityLevel *> *levels))successCompletion error:(void (^)(NSError *error))errorCompletion;

@end

@interface airQualityParser : NSObject

@end

NS_ASSUME_NONNULL_END
