//
//  airQualityParser.m
//  MVVMDemoOC
//
//  Created by 雲端開發部-廖彥勛 on 2021/1/5.
//

#import "airQualityParser.h"

@interface airQualityParser()

@end

@implementation airQualityParser
- (void)parserAirQualitys:(NSData *)data withSuccess:(void (^)(NSArray<QualityLevel *> *levels))successCompletion error:(void (^)(NSError *error))errorCompletion {
    NSError *err = nil;
    NSArray *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
    
    if (err) {
        errorCompletion(err);
    } else {
        NSMutableArray * items = [[NSMutableArray alloc] init];
        for (int i=0; i<result.count; i++) {
            
            NSDictionary *dic = result[i];

            NSString *location = [dic objectForKey:@"SiteName"];
            NSString *aqi = [NSString stringWithFormat:@"%@", [dic objectForKey:@"AQI"]];

            NSString *status = [dic objectForKey:@"Status"];

            QualityLevel *level = [[QualityLevel alloc] initWithLocation:location aqi:aqi status:status];
            [items addObject:level];
        }
        successCompletion(items);
    }
}
@end
