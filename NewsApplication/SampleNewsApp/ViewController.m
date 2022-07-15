//
//  ViewController.m
//  SampleNewsApp
//
//  Created by Vijaya Madhavi on 06/06/22.
//

#import "ViewController.h"
#import "NewsTableViewCell.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

const NSString *newsURL = @"https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=;

@implementation ViewController {

NSArray *articleArray;
NSDictionary *newsDict;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    
    NSString *response = [self getTopHeadlines];
    
    NSError *e = nil;
        
    NSData *data = [response dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];
    articleArray =  [jsonDict valueForKey:@"articles"];
    
   // NSLog(@"Article array = %@", articleArray);
    
    [self.myTableView reloadData];
    
   [self.myTableView registerNib:[UINib nibWithNibName:@"NewsTableViewCell" bundle:nil] forCellReuseIdentifier:@"newsCell"];
    
   // [self shareURL];
}

- (NSString *)getTopHeadlines{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:newsURL]];

    NSError *error = nil;
    NSHTTPURLResponse *responseCode = nil;

    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];

    if([responseCode statusCode] != 200){
        NSLog(@"Error getting %@, HTTP status code %ld", newsURL, [responseCode statusCode]);
        return nil;
    }

    return [[NSString alloc] initWithData:oResponseData encoding:NSUTF8StringEncoding];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return articleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NewsTableViewCell *cell = (NewsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"newsCell"];
    if(cell == nil) {
        cell = [[NewsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"newsCell"];
    }
    newsDict = articleArray[indexPath.row];
    NSString *url = [newsDict valueForKey:@"urlToImage"];
    cell.imageViewNews.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
    cell.lblNewsTitle.text = [newsDict valueForKey:@"title"];
    cell.lblNewsDescription.text =  [newsDict valueForKey:@"description"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 158;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
    NewsTableViewCell *cell = (NewsTableViewCell *) [tableView cellForRowAtIndexPath:indexPath];

//    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
//        spinner.frame = CGRectMake(0, 0, 24, 24);
//        cell.accessoryView = spinner;
//        [spinner startAnimating];

    DetailViewController *detailController = [self.storyboard instantiateViewControllerWithIdentifier: @"detail"];
    detailController.newsTitle = cell.lblNewsTitle.text;
    detailController.newsDescription = cell.lblNewsDescription.text;
    [self.navigationController pushViewController:detailController animated:true];
    
}

- (void) shareURL {
    NSArray *items = [NSArray arrayWithObjects:newsURL, nil];
    UIActivityViewController *controller = [[UIActivityViewController alloc]initWithActivityItems:items applicationActivities:nil];
    [self presentViewController:controller animated:YES completion:nil];

}


@end
