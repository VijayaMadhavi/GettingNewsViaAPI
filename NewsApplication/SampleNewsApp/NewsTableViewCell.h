//
//  NewsTableViewCell.h
//  SampleNewsApp
//
//  Created by Vijaya Madhavi on 06/06/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageViewNews;
@property (weak, nonatomic) IBOutlet UILabel *lblNewsTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblNewsDescription;

@end

NS_ASSUME_NONNULL_END
