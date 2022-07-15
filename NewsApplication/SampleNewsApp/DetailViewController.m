//
//  DetailViewController.m
//  SampleNewsApp
//
//  Created by Vijaya Madhavi on 14/06/22.
//

#import "DetailViewController.h"
#import "ViewController.h"
#import "NewsTableViewCell.h"

@interface DetailViewController ()

@end

@implementation DetailViewController {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _newsTitleLabel.text = _newsTitle;
    _newsDescriptionLabel.text = _newsDescription;
    
}



@end
