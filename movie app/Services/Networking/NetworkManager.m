//
//  NetworkManager.m
//  movie app
//
//  Created by karim hamed ashour on 5/19/24.
//

#import "NetworkManager.h"
#import <Foundation/Foundation.h>

@implementation NetworkManager
- (void)getAllMovies:(UIViewController *)delegate{
    NSURL *url = [NSURL URLWithString:@"https://api.androidhive.info/json/movies.json"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:delegate];
    
    [connection start];
}
@end
