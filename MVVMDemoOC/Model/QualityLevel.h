//
//  QualityLevel.h
//  MVVMDemoOC
//
//  Created by 雲端開發部-廖彥勛 on 2021/1/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QualityLevel : NSObject
@property (nonatomic, strong) NSString * pm2_5;
@property (nonatomic, strong) NSString * pm10;
@property (nonatomic, strong) NSString * aqi;
@property (nonatomic, strong) NSString * location;

- (instancetype)initWithLocation:(NSString*)location aqi:(NSString*)aqi pm10:(NSString*)pm10 pm2_5:(NSString*)pm2_5;
@end

NS_ASSUME_NONNULL_END
