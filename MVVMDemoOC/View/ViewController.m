//
//  ViewController.m
//  MVVMDemoOC
//
//  Created by 雲端開發部-廖彥勛 on 2021/1/5.
//

#import "ViewController.h"
#import "AirQualityViewModel.h"
#import "AirQualityDisplay.h"
#import "AirQualityTableViewCell.h"
#import "SearchViewController.h"
#import "SearchViewModel.h"

@interface ViewController ()
@property (nonatomic, strong) AirQualityViewModel * viewModel;
@end

@implementation ViewController {
    SearchViewController *search;
    SearchViewModel *searchViewModel;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.viewModel = [[AirQualityViewModel alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [self.tableView registerClass:[AirQualityTableViewCell class] forCellReuseIdentifier:@"AirQualityTableViewCell"];
    [self getData];
}

- (void)getData {

    __weak ViewController *weakSelf = self;
    [self.viewModel getAirQualityWithSuccess:^(NSArray<AirQualityDisplay *> * _Nonnull levels) {
        dispatch_async(dispatch_get_main_queue(), ^{

            __strong typeof(self) strongSelf = weakSelf;
            
            if (strongSelf) {
                strongSelf->searchViewModel = [[SearchViewModel alloc] initWithQuality:levels];
                
                strongSelf->search = [[SearchViewController alloc] initWithVideModel:strongSelf->searchViewModel];
                self.navigationItem.searchController = strongSelf->search;
                
                strongSelf->search.searchCompletionBlock = ^(NSArray<AirQualityDisplay *> * _Nonnull filterArray) {
                    weakSelf.viewModel.isSearching = YES;
                    weakSelf.viewModel.filterItems = filterArray;
                    [weakSelf.tableView reloadData];
                };
                
                strongSelf->search.searchCancelBlock = ^{
                    weakSelf.viewModel.isSearching = NO;
                    [weakSelf.tableView reloadData];
                };
            }
            
            [weakSelf.tableView reloadData];
        });
    } error:^(NSError * _Nonnull error) {
        // TODO handle error
        NSLog(@"error %@", error);
    }];
}

//MARK: - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.viewModel.numberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.numberOfItems;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AirQualityTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"AirQualityTableViewCell"];
    
    if (!cell) {
        cell = [[AirQualityTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"AirQualityTableViewCell"];
    }
    
    if ([search isFiltering]) {
        
        [cell setDisplay:[self.viewModel itemAtIndexPath:indexPath]];
  
    } else {
        self.viewModel.isSearching = NO;
        [cell setDisplay:[self.viewModel itemAtIndexPath:indexPath]];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

@end
