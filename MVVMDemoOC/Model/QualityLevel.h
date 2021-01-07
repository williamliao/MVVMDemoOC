//
//  QualityLevel.h
//  MVVMDemoOC
//
//  Created by 雲端開發部-廖彥勛 on 2021/1/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QualityLevel : NSObject

@property (nonatomic, strong) NSString * status;
@property (nonatomic, strong) NSString * aqi;
@property (nonatomic, strong) NSString * location;

- (instancetype)initWithLocation:(NSString*)location aqi:(NSString*)aqi status:(NSString*)status;
@end

NS_ASSUME_NONNULL_END
