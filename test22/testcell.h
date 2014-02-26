//
//  testcell.h
//  test22
//
//  Created by g.zhao on 2/26/14.
//  Copyright (c) 2014 Sunny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface testcell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIView *centerView;
@property (strong, nonatomic) UIView *coustomView;
-(void)addCoustomView;
@end
