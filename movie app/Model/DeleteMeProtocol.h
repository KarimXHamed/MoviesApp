//
//  DeleteMeProtocol.h
//  movie app
//
//  Created by karim hamed ashour on 5/19/24.
//

#ifndef DeleteMeProtocol_h
#define DeleteMeProtocol_h
#import "Movie.h"

@protocol DeleteMeProtocol
-(void) deleteMovie: (Movie*)movie;
@end

#endif /* DeleteMeProtocol_h */
