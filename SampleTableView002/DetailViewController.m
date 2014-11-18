//
//  DetailViewController.m
//  SampleTableView002
//
//  Created by user on 2014/10/20.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%d",self.select_num);
//    if (self.select_num == 0) {
//        self.myLabel.text = @"ブルーマウンテン";
//    }else if(self.select_num == 1){
//    
//    self.myLabel.text = @"キリマンジャロ";
//    
//    }else if(self.select_num == 2){
//    self.myLabel.text = @"ブラジル";
//    
//    }else if(self.select_num == 3){
//        self.myLabel.text = @"コロンビア";
    
//_coffeeArray = @[@"ブルーマウンテン",@"キリマンジャロ",@"ブラジル",@"コロンビア",];
//_coffeeArray2 = @[@"サイダー",@"コーラ",@"セブンアップ",@"ファンタ",];
    if (self.section_num == 0) {
        self.myLabel.text = _coffeeArray[self.select_num];
    }else{
        self.myLabel.text = _coffeeArray2[self.select_num];
    }
    //self.myLabel.text = _coffeeArray[self.select_num];
    //self.myLabel.text = [NSString stringWithFormat:@"%@とは",_coffeeArray[self.select_num]];
    if (self.section_num == 0) {
        self.myLabel.text =  [NSString stringWithFormat:@"%@とは",_coffeeArray[self.select_num]];
    }else{
            self.myLabel.text =  [NSString stringWithFormat:@"%@とは",_coffeeArray2[self.select_num]];
    }
    //ユーザーデフォルトからデータを取り出す箱を取り出す
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSArray *coffeeTmp;
    NSArray *coffeeTmp2;
    //保存されたデータを取り出す
    coffeeTmp = [defaults objectForKey:@"coffeeTable"];
    coffeeTmp2 = [defaults objectForKey:@"coffeeTable2"];
    //nilは何もないという状態
    if (coffeeTmp == nil) {
        coffeeTmp = @[@{@"name":@"ブルーマウンテン",@"desc":@"ジャマイカにある",@"favoriteflag":@"0"},                                                               @{@"name":@"キリマンジャロ",@"desc":@"説明キリマンジャロについて",@"favoriteflag":@"0"},
                      @{@"name":@"ブラジル",@"desc":@"説明ブラジル",@"favoriteflag":@"0"},
                      @{@"name":@"コロンビア",@"desc":@"説明コロンビアについて",@"favoriteflag":@"0"},];
    }else{
        coffeeTmp2 = @[@{@"name":@"サイダー",@"desc":@"シュワシュワ",@"favoriteflag":@"0"},                                                               @{@"name":@"コーラ",@"desc":@"めちゃ売れてる",@"favoriteflag":@"0"},
                      @{@"name":@"セブンアップ",@"desc":@"たまに飲むとグット",@"favoriteflag":@"0"},
                      @{@"name":@"ファンタ",@"desc":@"いろんな味があってグット",@"favoriteflag":@"0"},];

    
    }
    _coffeeArray = coffeeTmp.mutableCopy;
    _coffeeArray2 = coffeeTmp2.mutableCopy;
    
    self.descriptionText.text = _coffeeArray[self.select_num][@"desc"];
    
    
    //favoriteflagの取り出しを行う
    id favoriteflag = _coffeeArray[self.select_num][@"favoriteflag"];
    //intValueでfavoriteflagを整数型に変換する
    int intFavFlag = [favoriteflag intValue];
    
    if (intFavFlag == 0) {
        
        [self.favoriteBtn setTitle:@"お気に入り追加" forState:UIControlStateNormal];
    }else{
        [self.favoriteBtn setTitle:@"お気に入り解除" forState:UIControlStateNormal];
    }
   
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

- (IBAction)addFavoriteList:(id)sender {
    //まずは変更不可能なDictinaly型を作るselectedcoffee
    NSDictionary *selectedCoffee = _coffeeArray[self.select_num];
    //次に変更可能なNSMutableDictionaly型を作る上のselectedcoffeeを代入
    NSMutableDictionary *changedCoffee = selectedCoffee.mutableCopy;
    
    //ここでfavoriteflagの取り出し
    id favoriteflag = _coffeeArray[self.select_num][@"favoriteflag"];
    //int型に代入
    int intFavFlag = [favoriteflag intValue];
    
    if (intFavFlag == 0) {
        [changedCoffee setObject:@1 forKey:@"favoriteflag"];
        //これからお気に入りに追加されるため、ボタン名を解除にセットしておく
        [self.favoriteBtn setTitle:@"お気に入りに追加" forState:UIControlStateNormal];
    }else{
        [changedCoffee setObject:@0 forKey:@"favoriteflag"];
        //ボタンを追加にセットしておく
        [self.favoriteBtn setTitle:@"お気に入りに追加" forState:UIControlStateNormal];
    
    }
    //下の文の意味が分からない
    [_coffeeArray replaceObjectAtIndex:self.select_num withObject:changedCoffee];

    //userdefaultobjectを用意する
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //文字を保存
    [defaults setObject:_coffeeArray forKey:@"coffeeTable"];//_coffeearrayをcoffeetableに保存
    [defaults synchronize];
    
    
    
}
@end
