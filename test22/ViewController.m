//
//  ViewController.m
//  test22
//
//  Created by g.zhao on 2/26/14.
//  Copyright (c) 2014 Sunny. All rights reserved.
//

#import "ViewController.h"
#import "testcell.h"
static UIMotionEffectGroup *group;

#define kMotionEffectRelativeValue 30

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
//	[self.collectionView registerNib:[UINib nibWithNibName:@"testcell" bundle:nil] forCellWithReuseIdentifier:@"cell"];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
	return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return 100;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	testcell *processingCell = (testcell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
//	[processingCell.centerView removeMotionEffect:[processingCell.centerView.motionEffects firstObject]];
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		UIInterpolatingMotionEffect *horizontalMotionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
		horizontalMotionEffect.minimumRelativeValue = @(-kMotionEffectRelativeValue );
		horizontalMotionEffect.maximumRelativeValue = @(kMotionEffectRelativeValue );
		UIInterpolatingMotionEffect *verticalMotionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
		verticalMotionEffect.minimumRelativeValue = @(-kMotionEffectRelativeValue );
		verticalMotionEffect.maximumRelativeValue = @(kMotionEffectRelativeValue );
		group = [[UIMotionEffectGroup alloc] init];
		group.motionEffects = @[horizontalMotionEffect,verticalMotionEffect];
		
	});
	[processingCell addCoustomView];
	[processingCell.coustomView addMotionEffect:group];
	[processingCell.centerView addMotionEffect:group];
	
	return processingCell;

}

@end
