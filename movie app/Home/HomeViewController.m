//
//  HomeViewController.m
//  movie app
//
//  Created by karim hamed ashour on 5/15/24.
//

#import "HomeViewController.h"
#import "DetailsViewController.h"
#import <SDWebImage/SDWebImage.h>

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _movies = [NSMutableArray new];
    _networkManager = [NetworkManager new];
    [_networkManager getAllMovies:self];
   
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _movies.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Movie *movie = _movies[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    //NSDictionary *current_dict = _movies[indexPath.row];
    cell.textLabel.text=movie.title;
    
    NSString *image_str = movie.image;
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:image_str]placeholderImage:[UIImage imageNamed:@"spain@3x.png"]];
    cell.imageView.layer.cornerRadius = 28;
    cell.imageView.layer.masksToBounds = true;
    
    return cell;
}
#pragma mark - Connection Delegate
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    _responseData=[[NSMutableData alloc]init];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.responseData appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSMutableArray *moviesDict =[NSJSONSerialization JSONObjectWithData:self.responseData options:NSJSONReadingAllowFragments error:nil];
    for (int index=0 ; index<moviesDict.count ; index++){
        Movie *movie = [self convertDictionaryToMovie:[moviesDict objectAtIndex:index]];
    }
    [self.tableView reloadData];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    ((DetailsViewController*)segue.destinationViewController).movie = _movies[self.tableView.indexPathForSelectedRow.row];
    ((DetailsViewController*)segue.destinationViewController).HomeVC = self;
}
-(Movie*) convertDictionaryToMovie:(NSDictionary*)dict{
    Movie *movie = [Movie new];
    movie.title = [dict objectForKey:@"title"];
    movie.image = [dict objectForKey:@"image"];
    movie.rating = [[dict objectForKey:@"rating"]doubleValue];
    movie.releaseYear = [[dict objectForKey:@"releaseYear"] intValue];
    movie.genre = [dict objectForKey:@"genre"];
    return movie;
}

-(void)deleteMovie:(Movie *)movie{
    [_movies removeObject:movie];
    [self.tableView reloadData];
}

@end
