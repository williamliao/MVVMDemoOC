//
//  SearchViewController.h
//  MVVMDemoOC
//
//  Created by 雲端開發部-廖彥勛 on 2021/1/6.
//

#import <UIKit/UIKit.h>
#import "AirQualityDisplay.h"
#import "SearchViewModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^SearchCompletionBlock)(NSArray<AirQualityDisplay *> *filterArray);
typedef void (^SearchCancelBlock)(void);

@interface SearchViewController : UISearchController
@property (nonatomic, nullable, strong) SearchViewModel *viewModel;
@property (nonatomic, copy) SearchCompletionBlock searchCompletionBlock;
@property (nonatomic, copy) SearchCancelBlock searchCancelBlock;

- (instancetype)initWithVideModel:(SearchViewModel *)viewModel;

- (BOOL)isFiltering;
@end

NS_ASSUME_NONNULL_END
