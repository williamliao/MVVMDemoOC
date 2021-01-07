//
//  SearchViewController.m
//  MVVMDemoOC
//
//  Created by 雲端開發部-廖彥勛 on 2021/1/6.
//

#import "SearchViewController.h"

@interface SearchViewController () <UISearchResultsUpdating, UISearchBarDelegate>
@property (nonatomic, strong) NSArray *filterArray;
@end

@implementation SearchViewController

- (instancetype)initWithVideModel:(SearchViewModel *)viewModel {
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}

- (void)configureView {
    self.searchResultsUpdater = self;
    self.searchBar.delegate = self;
    [self.searchBar sizeToFit];
    self.obscuresBackgroundDuringPresentation = false;
    self.searchBar.placeholder = @"Search Location";
    self.definesPresentationContext = false;
}

#pragma mark - UISearchResultsUpdating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    if ([self isSearchBarEmpty]) {
        return;
    }
    
    NSPredicate *searchPredicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        AirQualityDisplay *dis = (AirQualityDisplay*)evaluatedObject;
        return [dis.location containsString:searchController.searchBar.text];
    }];
    
    NSArray<AirQualityDisplay *> *filterSearchArray = [self.viewModel.levels filteredArrayUsingPredicate:searchPredicate];
    
    if (_searchCompletionBlock) {
        _searchCompletionBlock(filterSearchArray);
    }
    
}

#pragma mark - UISearchBarDelegate

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.view endEditing:YES];
    
    if (_searchCancelBlock) {
        _searchCancelBlock();
    }
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if ([searchText isEqualToString:@""]) {
        if (_searchCancelBlock) {
            [self.view endEditing:YES];
            _searchCancelBlock();
        }
    }
}

- (BOOL)isSearchBarEmpty {
    return self.searchBar.text.length == 0 ? true : false;
}

- (BOOL)isFiltering {
    return self.searchBar.text.length > 0 && self.isActive;
}
@end
