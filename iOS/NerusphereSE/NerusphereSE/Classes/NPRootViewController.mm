//
//  NPRootViewController.m
//  NerusphereSE
//
//  Created by Mario Gonzalez on 12/4/12.
//  Copyright (c) 2012 Mario Gonzalez. All rights reserved.
//

#import "NPRootViewController.h"
#import "NPVisualizerViewController.h"
#import "MPFoldEnumerations.h"
#import "MPFlipEnumerations.h"
#import "NPConstants.h"
#import "MPFoldTransition.h"
#import <AVFoundation/AVAudioSession.h>

@interface NPRootViewController ()

@end

@implementation NPRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	[self configureAudioSession];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)shouldStartVisualizer:(id)sender {
	[self presentNPViewController:NPkViewControllerIdentifierNPVisualizer];
}
- (IBAction)shouldStartAudioPlayer:(id)sender {
	[self presentNPViewController:NPkViewControllerIdentifierNPAudioPlayer];
}

-(void)presentNPViewController:(NSString*)viewControllerIdentifier {
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:[NPkConstants storyboardName] bundle:nil];
	UIViewController *viewControllertoPresent = [storyboard instantiateViewControllerWithIdentifier:viewControllerIdentifier];
	
	[self.navigationController pushViewController:viewControllertoPresent foldStyle: MPFoldStyleUnfold];
}


-(void)configureAudioSession {
	NSError *setCategoryError = nil;
	[[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error: &setCategoryError];
	if (setCategoryError) {
		// TODO: Handle error condition better
		NSLog(@"NPAlert: Error setting audio category");
	}
}

@end
