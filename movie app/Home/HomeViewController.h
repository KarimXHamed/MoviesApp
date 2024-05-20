//
//  HomeViewController.h
//  movie app
//
//  Created by karim hamed ashour on 5/15/24.
//

#import <UIKit/UIKit.h>
#import "NetworkManager.h"
#import "DeleteMeProtocol.h"



@interface HomeViewController : UITableViewController<NSURLConnectionDelegate,NSURLConnectionDataDelegate,DeleteMeProtocol>
@property NetworkManager* networkManager;
@property NSMutableData *responseData;
@property NSMutableArray *movies;

@end


