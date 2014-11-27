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
    NSError *error = nil;
    
    
    NSLog(@"%d",self.select_num);

        //ユーザーデフォルトからデータを取り出す箱を取り出す
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSArray *coffeeTmp;
    NSArray *coffeeTmp2;
    //保存されたデータを取り出す例.defaultsの一部（coffeetable）をつかえよとのこと
    coffeeTmp = [defaults objectForKey:@"coffeeTable"];
    coffeeTmp2 = [defaults objectForKey:@"coffeeTable2"];
    //nilは何もないという状態
    if (coffeeTmp == nil) {
        coffeeTmp = @[@{@"name":@"ブルーマウンテン",@"desc":@"ジャマイカにある",@"favoriteflag":@"0",@"sounddate":@"ブルーマウンテン"},                                                               @{@"name":@"キリマンジャロ",@"desc":@"説明キリマンジャロについ て",@"favoriteflag":@"0",@"sounddate":@"ブラジル"},
                      @{@"name":@"ブラジル",@"desc":@"説明ブラジル",@"favoriteflag":@"0",@"sounddate":@""},
                      @{@"name":@"コロンビア",@"desc":@"説明コロンビアについて",@"favoriteflag":@"0",@"sounddate":@""},];
    }
    //サウンドを足す
  if (coffeeTmp2 == nil) {
    coffeeTmp2 = @[@{@"name":@"サイダー",@"desc":@"シュワシュワ",@"favoriteflag":@"0",@"sounddate":@"サイダー"},
                       @{@"name":@"コーラ",@"desc":@"めちゃ売れてる",@"favoriteflag":@"0",@"sounddate":@"コーラ"},
                      @{@"name":@"セブンアップ",@"desc":@"たまに飲むとグット",@"favoriteflag":@"0",@"sounddate":@""},
                      @{@"name":@"ファンタ",@"desc":@"いろんな味があってグット",@"favoriteflag":@"0",@"sounddate":@""},
                       @{@"name":@"アップルジュース",@"desc":@"甘い",@"favoriteflag":@"0",@"sounddate":@""}];

    
    }
    _coffeeArray = coffeeTmp.mutableCopy;
    _coffeeArray2 = coffeeTmp2.mutableCopy;
    NSString *path;
    id favoriteflag;//ここにサウンドをたす
    if (self.section_num == 0) {
        //タイトルになになにとはとつける
        self.myLabel.text =  [NSString stringWithFormat:@"%@とは",_coffeeArray[self.select_num][@"name"]];
        //説明を表示する
        self.descriptionText.text = _coffeeArray[self.select_num][@"desc"];
        //favoriteflagを取り出す
        favoriteflag = _coffeeArray[self.select_num][@"favoriteflag"];
        //audioを再生するプレイヤーを作成する
        path = [[NSBundle mainBundle] pathForResource:_coffeeArray[self.select_num][@"sounddate"] ofType:@"m4a"];
    }else{
        self.myLabel.text =  [NSString stringWithFormat:@"%@とは",_coffeeArray2[self.select_num][@"name"]];
       
        self.descriptionText.text = _coffeeArray2[self.select_num][@"desc"];
        
        favoriteflag = _coffeeArray2[self.select_num][@"favoriteflag"];
        
         path = [[NSBundle mainBundle] pathForResource:_coffeeArray2[self.select_num][@"sounddate"] ofType:@"m4a"];
    }

  
    
    //favoriteflagの取り出しを行う
    
      //intValueでfavoriteflagを整数型に変換する
    int intFavFlag = [favoriteflag intValue];
    
    if (intFavFlag == 0) {
        //ボタンの表示
        [self.favoriteBtn setTitle:@"お気に入り追加" forState:UIControlStateNormal];
    }else{
        [self.favoriteBtn setTitle:@"お気に入り解除" forState:UIControlStateNormal];
    }
    
    //パスから再生するプレイヤーを作成する
    NSURL *url =[[NSURL alloc] initFileURLWithPath:path];
    //audioを再生するプレイヤーを作成する
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    //エラーが起きたとき
    if (error != nil) {
        NSLog(@"Error %@",[error localizedDescription]);
    }
    //自分自身をデリケートに設定
    [self.audioPlayer setDelegate:self];
   
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
    NSDictionary *selectedCoffee;
     id favoriteflag;
    NSMutableDictionary *changedCoffee;
    if (self.section_num == 0) {
        //まずはこれ
        selectedCoffee = _coffeeArray[self.select_num];
        //次に変更可能なNSMutableDictionaly型を作る上のselectedcoffeeを代入
        changedCoffee = selectedCoffee.mutableCopy;
        
        favoriteflag = _coffeeArray[self.select_num][@"favoriteflag"];
    }else{
        selectedCoffee = _coffeeArray2[self.select_num];
        //次に変更可能なNSMutableDictionaly型を作る上のselectedcoffeeを代入
        changedCoffee = selectedCoffee.mutableCopy;
        
        favoriteflag = _coffeeArray2[self.select_num][@"favoriteflag"];
    }
    
   
    
    //ここでfavoriteflagの取り出し

    
    //int型に代入
    int intFavFlag = [favoriteflag intValue];
    
    if (intFavFlag == 0) {
        [changedCoffee setObject:@1 forKey:@"favoriteflag"];
        //これからお気に入りに追加されるため、ボタン名を解除にセットしておく
        [self.favoriteBtn setTitle:@"お気に入りに解除" forState:UIControlStateNormal];
    }else{
        [changedCoffee setObject:@0 forKey:@"favoriteflag"];
        //ボタンを追加にセットしておく
        [self.favoriteBtn setTitle:@"お気に入りに追加" forState:UIControlStateNormal];
     
    }
  
    

    //userdefaultobjectを用意する
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //文字を保存
    if (self.section_num == 0) {
        //順番は変えないでね
        [_coffeeArray replaceObjectAtIndex:self.select_num withObject:changedCoffee];
        [defaults setObject:_coffeeArray forKey:@"coffeeTable"];//_coffeearrayをcoffeetableに保存
       
    }else{
         [_coffeeArray2 replaceObjectAtIndex:self.select_num withObject:changedCoffee];
        [defaults setObject:_coffeeArray2 forKey:@"coffeeTable2"];//coffeetableとはtableviewにセットするデータ
        }
        [defaults synchronize];//きちんと保存されるuserdefaultに
    
    
    
}
- (IBAction)playAudio:(id)sender {
    //ボタンが押されると再生、停止の記述を追加
   
    if (self.audioPlayer.playing) {
        [self.audioPlayer stop];
        //[self.playButton setTitle:@"Play" forState:UIControlStateNormal];
    }else{
        [self.audioPlayer play];
        //[self.playButton setTitle:@"Stop" forState:UIControlStateNormal];
}
}
@end
