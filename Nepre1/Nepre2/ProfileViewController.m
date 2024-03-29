//
//  ProfileViewController.m
//  Nepre2
//
//  Created by Lsr on 11/26/13.
//  Copyright (c) 2013 Lsr. All rights reserved.
//

#import "ProfileViewController.h"
#import "FavoriteViewController.h"
#import "FollowViewController.h"

@interface ProfileViewController ()

@property (retain, nonatomic) UIPanGestureRecognizer *navigationBarPanGestureRecognizer;
@property (retain, nonatomic) IBOutlet UIButton *menuButton;
@property (retain, nonatomic) IBOutlet UIScrollView *scroller;
@property (retain, nonatomic) IBOutlet UIView *slideView;

@end

@implementation ProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    if ([self.navigationController.parentViewController respondsToSelector:@selector(revealGesture:)] && [self.navigationController.parentViewController respondsToSelector:@selector(revealToggle:)])
	{
		// Check if a UIPanGestureRecognizer already sits atop our NavigationBar.
		if (![[self.navigationController.navigationBar gestureRecognizers] containsObject:self.navigationBarPanGestureRecognizer])
		{
			// If not, allocate one and add it.
			UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self.navigationController.parentViewController action:@selector(revealGesture:)];
			self.navigationBarPanGestureRecognizer = panGestureRecognizer;
			
			[self.slideView addGestureRecognizer:self.navigationBarPanGestureRecognizer];
		}
		
		// Check if we have a revealButton already.
		if (![self.navigationItem leftBarButtonItem])
		{
			// If not, allocate one and add it.
            
            [self.menuButton addTarget:self.navigationController.parentViewController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
            
		}
	}
    
    self.navigationController.navigationBar.hidden = YES;
    
    [self.scroller setContentSize:CGSizeMake(320, 1000)];
}
- (IBAction)goFavorite:(id)sender {
    FavoriteViewController * fvc = [[FavoriteViewController alloc]init];
    
    [self.navigationController pushViewController:fvc animated:NO];
}

- (IBAction)goFollow:(id)sender {
    
    FollowViewController *follow = [[FollowViewController alloc]init];
    
    [self.navigationController pushViewController:follow animated:NO];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
