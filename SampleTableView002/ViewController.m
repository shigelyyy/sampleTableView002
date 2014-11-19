//
//  ViewController.m
//  SampleTableView002
//
//  Created by user on 2014/10/20.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import "ViewController.h"
//注目　追加してなカプセル化実態を保存するためにこのクラス名が必要
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //アンダーバーは見やすくするための者であってなくてもよし
    _coffeeArray = @[@"ブルーマウンテン",@"キリマンジャロ",@"ブラジル",@"コロンビア",];
    _coffeeArray2 = @[@"サイダー",@"コーラ",@"セブンアップ",@"ファンタ",@"アップルジュース",];
    
    NSLog(@"配列の中身の数:%ld",_coffeeArray.count);
    
    _coffeListTableView.delegate = self;
    
    self.coffeListTableView.dataSource = self;
    
    
  }
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
//行数を決定するメゾット
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
    {
        if (section == 0) {
            return _coffeeArray.count;
        }else{
            return _coffeeArray2.count;
        }
    }
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"コーヒー";
    }else{
    return @"ジュース";
    }

}


    //行に表示するデータの作成
    -(UITableViewCell *)tableView:(UITableView *)tableView
                cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //static静的→変わらない数　dyamic動的→変数
    static NSString *CellIdentifier = @"Cell";
    
    //データ型（クラス）がUITableViewCell　再利用可能なCellオブジェクトを作成
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }//ここ注目
   
        if (indexPath.section == 0) {
            cell.textLabel.text = _coffeeArray[indexPath.row];
        }else{
            cell.textLabel.text = _coffeeArray2[indexPath.row];
        }
        
    
    return cell;


    
}
//Editorを押しーのEmbedinを押しナビゲーションコントローラーを選択
//何か行が押されたときDetailViewControllerに画面遷移する
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //遷移先画面のカプセル化（インスタンスカ）storybord上でDetailViewControlleの
    DetailViewController *dvc =[self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    //押された番号をselect_numに渡している
    dvc.select_num = indexPath.row;
    dvc.section_num = indexPath.section;
    
    //ナビゲーションコントローラーの機能で画面遷移（別の画面に移動する事）
    [[self navigationController] pushViewController:dvc animated:YES];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
