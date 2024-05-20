//
//  Movie.h
//  movie app
//
//  Created by karim hamed ashour on 5/18/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Movie : NSObject
@property NSString *title;
@property NSString *image;
@property double rating;
@property int releaseYear;
@property NSArray *genre;
@end

NS_ASSUME_NONNULL_END
