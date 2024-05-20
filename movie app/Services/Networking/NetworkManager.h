//
//  NetworkManager.h
//  movie app
//
//  Created by karim hamed ashour on 5/19/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject
-(void)getAllMovies:(UIViewController*) delegate;
@end

NS_ASSUME_NONNULL_END
