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

@interface ViewController ()
@property (nonatomic, strong) AirQualityViewModel * viewModel;
@end

@implementation ViewController

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
    [self.viewModel getAirQualityWithSuccess:^(NSArray<AirQualityDisplay *> * _Nonnull songs) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tableView reloadData];
        });
    } error:^(NSError * _Nonnull error) {
        // TODO handle error
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
    
    [cell setDisplay:[self.viewModel itemAtIndexPath:indexPath]];
   
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

@end
