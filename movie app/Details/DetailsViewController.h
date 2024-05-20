//
//  DetailsViewController.h
//  movie app
//
//  Created by karim hamed ashour on 5/18/24.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>
#import "Movie.h"
#import "DeleteMeProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : ViewController
@property Movie *movie;
@property id<DeleteMeProtocol> HomeVC;
@property (weak, nonatomic) IBOutlet UIImageView *movieImage;
@property (weak, nonatomic) IBOutlet UILabel *movieTitle;
@property (weak, nonatomic) IBOutlet UILabel *movieReleaseYear;
@property (weak, nonatomic) IBOutlet UILabel *movieRating;
@property (weak, nonatomic) IBOutlet UILabel *movieGenre;



@end

NS_ASSUME_NONNULL_END
