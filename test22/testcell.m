//
//  testcell.m
//  test22
//
//  Created by g.zhao on 2/26/14.
//  Copyright (c) 2014 Sunny. All rights reserved.
//

#import "testcell.h"

@implementation testcell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)awakeFromNib {
	[super awakeFromNib];

}
-(void)addCoustomView{
	
	[self.coustomView removeFromSuperview];
	self.coustomView.hidden = YES;
	if (self.coustomView == nil) {
		UIView *view  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
		view.backgroundColor = [UIColor blackColor];
		view.center = CGPointMake(self.contentView.center.x, self.contentView.center.y -50);
		[self.contentView addSubview:view];
		self.coustomView = view;
	}
	[self.contentView addSubview:self.coustomView];
	self.coustomView.hidden = NO;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
