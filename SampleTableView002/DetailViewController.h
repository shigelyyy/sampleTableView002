//
//  DetailViewController.h
//  SampleTableView002
//
//  Created by user on 2014/10/20.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    NSMutableArray *_coffeeArray;//メンバ変数宣言
    NSMutableArray *_coffeeArray2;
    
}


@property (weak, nonatomic) IBOutlet UILabel *coffeeTitle;

@property (nonatomic,assign) int select_num;//このコントローラーに遷移してくるもとの画面からもらった情報を保存する変数
@property (nonatomic,assign) int section_num;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionText;
@property (weak, nonatomic) IBOutlet UIButton *favoriteBtn;
- (IBAction)addFavoriteList:(id)sender;


@end
