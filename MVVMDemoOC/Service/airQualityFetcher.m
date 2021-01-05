//
//  airQualityFetcher.m
//  MVVMDemoOC
//
//  Created by 雲端開發部-廖彥勛 on 2021/1/5.
//

#import "airQualityFetcher.h"

@interface airQualityFetcher()

@property (nonatomic, strong) id<AirQualityParserProtocol> parser;

@end

@implementation airQualityFetcher
- (instancetype)initWithParser:(id<AirQualityParserProtocol>)parser
{
    self = [super init];
    if (self) {
        self.parser = parser;
    }
    return self;
}

- (void)fetchAirQualityWithSuccess:(void (^)(NSArray<QualityLevel *> *))successCompletion error:(void (^)(NSError *error))errorCompletion {
    __weak airQualityFetcher * weakSelf = self;
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://opendata2.epa.gov.tw/AQI.json"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        [weakSelf.parser parserAirQualitys:data withSuccess:successCompletion error:errorCompletion];
          
    }];
    
    [dataTask resume];
}
@end
