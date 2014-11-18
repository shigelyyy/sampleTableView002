//
//  ViewController.h
//  SampleTableView002
//
//  Created by user on 2014/10/20.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController
                    <UITableViewDataSource,
                        UITableViewDelegate>


{
    NSArray *_coffeeArray;//メンバ変数宣言
    NSArray *_coffeeArray2;
}

@property (weak, nonatomic) IBOutlet UITableView *coffeListTableView;

@end

