//
//  MenuViewController.m
//  SampleTableView002
//
//  Created by user on 2014/11/11.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import "MenuViewController.h"
#import "ViewController.h"
#import "FavoriteViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)myUTB:(id)sender {
    ViewController *vc =[self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    //押された番号をselect_numに渡している
    
    //ナビゲーションコントローラーの機能で画面遷移（別の画面に移動する事）
    [[self navigationController] pushViewController:vc animated:YES];

    
}

- (IBAction)myFTB:(id)sender {
FavoriteViewController *fvc =[self.storyboard instantiateViewControllerWithIdentifier:@"FavoriteViewController"];
    //押された番号をselect_numに渡している
    
    //ナビゲーションコントローラーの機能で画面遷移（別の画面に移動する事）
    [[self navigationController] pushViewController:fvc animated:YES];
    

}
@end
