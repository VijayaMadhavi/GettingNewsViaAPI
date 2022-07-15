//
//  DetailViewController.h
//  SampleNewsApp
//
//  Created by Vijaya Madhavi on 14/06/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *newsTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *newsDescriptionLabel;

@property NSString *newsTitle;
@property NSString *newsDescription;

@end

NS_ASSUME_NONNULL_END
