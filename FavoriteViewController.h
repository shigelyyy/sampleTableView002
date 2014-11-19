//
//  FavoriteViewController.h
//  SampleTableView002
//
//  Created by user on 2014/11/11.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavoriteViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_coffeeArray;
    NSMutableArray *_coffeeArray2;
}
@property (weak, nonatomic) IBOutlet UITableView *myFTableView;

@end
