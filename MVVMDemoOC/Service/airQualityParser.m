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
            
//            NSString *location = [NSString stringWithFormat:@"%@%@", [dic objectForKey:@"County"], [dic objectForKey:@"SiteName"]];
            NSString *location = [dic objectForKey:@"SiteName"];
            NSString *aqi = [NSString stringWithFormat:@"%@", [dic objectForKey:@"AQI"]];
            
            NSString *PM10 =  @"";
            NSString *pm25 =  @"";
            
            if ([dic objectForKey:@"PM10"]) {
                PM10 = [NSString stringWithFormat:@"%@", [dic objectForKey:@"PM10"]];
            } else {
                PM10 = [NSString stringWithFormat:@"%@", [dic objectForKey:@"PM10_AVG"]];
            }
            
            if ([dic objectForKey:@"PM2.5"]) {
                pm25 = [NSString stringWithFormat:@"%@", [dic objectForKey:@"PM2.5"]];
            } else {
                pm25 = [NSString stringWithFormat:@"%@", [dic objectForKey:@"PM2.5_AVG"]];
            }
            
           // NSString *PM10 = [[dic objectForKey:@"PM10"] stringValue];
           // NSString *pm25 = [[dic objectForKey:@"PM2.5"] stringValue];
            
           QualityLevel *level = [[QualityLevel alloc] initWithLocation:location aqi:aqi pm10:PM10 pm2_5:pm25];
            [items addObject:level];
          
        }
        
        successCompletion(items);
    }
    
    
    
}
@end
