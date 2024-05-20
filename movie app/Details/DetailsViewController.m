//
//  DetailsViewController.m
//  movie app
//
//  Created by karim hamed ashour on 5/18/24.
//

#import "DetailsViewController.h"
#import <SDWebImage/SDWebImage.h>
@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.movieTitle.text = self.movie.title;
    self.movieRating.text = [NSString stringWithFormat:@"%.21f",self.movie.rating];
    self.movieReleaseYear.text = [NSString stringWithFormat:@"%d" , self.movie.releaseYear];
    self.movieGenre.text = [self.movie.genre componentsJoinedByString:@", "];
    [self.movieImage sd_setImageWithURL:[NSURL URLWithString:self.movie.image]
    placeholderImage:[UIImage imageNamed:@"spain3x.png"]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)deleteMovie:(UIBarButtonItem *)sender {
    [_HomeVC deleteMovie:_movie];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
