//
//  AirQualityViewModel.h
//  MVVMDemoOC
//
//  Created by 雲端開發部-廖彥勛 on 2021/1/5.
//

#import <Foundation/Foundation.h>
#import "AirQualityDisplay.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AirQualityViewModel : NSObject

- (void)getAirQualityWithSuccess:(void (^)(NSArray<AirQualityDisplay*> *levels))successCompletion error:(void (^)(NSError *error))errorCompletion;

- (NSUInteger)numberOfItems;
- (NSUInteger)numberOfSections;
- (nullable AirQualityDisplay *)itemAtIndexPath:(NSIndexPath *)indexPath;

@property (nonatomic, assign) BOOL isSearching;
@property (nonatomic, strong) NSArray<AirQualityDisplay *> *filterItems;

- (void)setIsSearching:(BOOL)isSearching;
@end

NS_ASSUME_NONNULL_END
