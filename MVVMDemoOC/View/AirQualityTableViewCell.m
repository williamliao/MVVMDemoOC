//
//  AirQualityTableViewCell.m
//  MVVMDemoOC
//
//  Created by 雲端開發部-廖彥勛 on 2021/1/5.
//

#import "AirQualityTableViewCell.h"

#define BETWEEN(value, min, max) (value < max && value > min)

@implementation AirQualityTableViewCell {
    UIView *_containerView;
    UILabel *_titleLabel;
    UILabel *_subTitleLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initializeView];
        [self addConstraints];
    }
    return self;
}

- (void)initializeView {
    
    _containerView = [UIView new];
    _containerView.backgroundColor = [UIColor clearColor];
    _containerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_containerView];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _titleLabel.font = [UIFont systemFontOfSize:12];
    _titleLabel.textColor = [UIColor blackColor];
    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_containerView addSubview:_titleLabel];
    
    _subTitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _subTitleLabel.font = [UIFont systemFontOfSize:12];
    _subTitleLabel.textColor = [UIColor blackColor];
    _subTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_containerView addSubview:_subTitleLabel];
}

- (void)addConstraints {
    
    [_containerView.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:0].active = YES;
    [_containerView.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant:0].active = YES;
    [_containerView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:0].active = YES;
    [_containerView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:0].active = YES;
    
    [_titleLabel.leftAnchor constraintEqualToAnchor:_containerView.leftAnchor constant:10].active = YES;
    [_titleLabel.rightAnchor constraintEqualToAnchor:_containerView.rightAnchor constant:-10].active = YES;
    [_titleLabel.topAnchor constraintEqualToAnchor:_containerView.topAnchor constant:5].active = YES;
    [_titleLabel.heightAnchor constraintEqualToConstant:16].active = YES;
    
    [_subTitleLabel.leftAnchor constraintEqualToAnchor:_containerView.leftAnchor constant:10].active = YES;
    [_subTitleLabel.rightAnchor constraintEqualToAnchor:_containerView.rightAnchor constant:-10].active = YES;
    [_subTitleLabel.topAnchor constraintEqualToAnchor:_titleLabel.bottomAnchor constant:3].active = YES;
    [_subTitleLabel.heightAnchor constraintEqualToConstant:16].active = YES;
}

- (void)setDisplay:(AirQualityDisplay *)display {
    _titleLabel.text = display.location;
    _subTitleLabel.text = display.title;
    
    NSInteger aqi = [display.title integerValue];
    [_containerView setBackgroundColor:[UIColor clearColor]];
    [_containerView setBackgroundColor:[self setupBackgroudColor:aqi]];
}

- (UIColor *)setupBackgroudColor:(NSInteger)value {

    if ([self float:value between:0 and:30]) {
        return [UIColor greenColor];
    } else if ([self float:value between:31 and:50]) {
        return [UIColor greenColor];
    } else if ([self float:value between:51 and:75]) {
        return [UIColor yellowColor];
    } else if ([self float:value between:76 and:100]) {
        return [UIColor yellowColor];
    } else if ([self float:value between:101 and:150]) {
        return [UIColor orangeColor];
    } else if ([self float:value between:151 and:200]) {
        return [UIColor redColor];
    } else if ([self float:value between:201 and:300]) {
        return [UIColor purpleColor];
    } else if (value > 300) {
        return [UIColor colorWithRed: 58.0/255.0 green: 33.0/255.0 blue: 13.0/255.0 alpha: 1.0];
    } else {
        return [UIColor lightGrayColor];
    }
}

- (void)prepareForReuse {
    [super prepareForReuse];
    _containerView.backgroundColor = [UIColor clearColor];
}

- (BOOL)float:(float)aFloat between:(float)minValue and:(float)maxValue {
    if (aFloat >= minValue && aFloat <= maxValue) {
        return YES;
    } else {
        return NO;
    }
}
@end
