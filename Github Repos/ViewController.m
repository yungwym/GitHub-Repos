//
//  ViewController.m
//  Github Repos
//
//  Created by Alex Wymer  on 2017-07-17.
//  Copyright © 2017 Sav Inc. All rights reserved.
//

#import "ViewController.h"
#import "Repo.h"


@interface ViewController ()

@property (nonatomic) Repo *repoClass;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL *url = [NSURL URLWithString:@"https://api.github.com/users/yungwym/repos"]; // 1 Create new NSURL object from the github url string
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url]; // 2 Create new NSURL Request object using the URL object. Use this object to make configurations specific to the url
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration]; // 3 An NSURLSessionConfiguration object defines the behavior and policies to use when making a request with an NSURLSession object
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration]; //4 Create a NSURL session object using our session configuration. Any changes we want to make to our configuration object must be done before this
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        if (error) { // 1 Handle Error
            
            NSLog(@"error : %@" ,error.localizedDescription);
            return;
        }
        
        NSError *jsonError = nil;
        NSArray *repos = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError]; // 2 Convert data we're retrieving into JSON
        
        
        if (jsonError) { //3 Handle an error from JSON
        
            NSLog(@"jsonError: %@", jsonError.localizedDescription);
            return;
        }
        
        
        // If we reach this point, we have successfully retreived the JSON from the API
        
        for (NSDictionary *repo in repos) { //4 Reaching this point means we have the JSON data back from our request, and we can use it
            
            self.repoClass.repoName = repo[@"name"];
            
            NSLog(@"Repo: %@" , self.repoClass.repoName);
        }
        
    }]; //5 We create a task that will actually get the data from the server. The session creates and configures the task and the task makes the request. Data tasks send and receive data using NSData objects. We could optionally use a delegate to get notified when the request has completed, but we're going to use a completion block instead. This block will get called when the network request is complete, weather it was successful or not.
    
    
    [dataTask resume]; //6 Create in suspended state so we must resume it
    
}



@end
