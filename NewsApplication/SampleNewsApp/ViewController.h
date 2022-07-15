//
//  ViewController.h
//  SampleNewsApp
//
//  Created by Vijaya Madhavi on 06/06/22.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

