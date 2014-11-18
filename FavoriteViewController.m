//
//  FavoriteViewController.m
//  SampleTableView002
//
//  Created by user on 2014/11/11.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import "FavoriteViewController.h"
#import "DetailViewController.h"

@interface FavoriteViewController ()

@end

@implementation FavoriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *coffeeTmp;
    
    //保存されたデータを取り出す
    coffeeTmp = [defaults objectForKey:@"coffeeTable"];
    
    
    if (coffeeTmp == nil) {
        coffeeTmp = @[@{@"name":@"ブルーマウンテン",
                        @"desc":@"ジャマイカにあるブルーマウンテン山脈の標高800～1200mの限られた地域で栽培されるコーヒー豆のブランド。\nブルーマウンテンの特徴として、香りが非常に高く、繊細な味であることが挙げられる。香りが高いため、他の香りが弱い豆とブレンドすることが多い。",
                        @"favoriteflag":@"0"},
                      @{@"name":@"キリマンジャロ",@"desc":@"説明キリ",@"favoriteflag":@"0"},
                      @{@"name":@"ブラジル",@"desc":@"説明ブラジル",@"favoriteflag":@"0"},
                      @{@"name":@"コロンビア",@"desc":@"説明コロンビア",@"favoriteflag":@"0"}];
    }
    //検索用編集可能配列
    NSMutableArray *tmpcoffeeArray = coffeeTmp.mutableCopy;
    //お気に入りリスト
    _coffeeArray = coffeeTmp.mutableCopy;
    for (NSDictionary *coffeeArray_each in tmpcoffeeArray){
        id favoriteflag = coffeeArray_each[@"favoriteflag"];
        
        //取り出したid型をint型に変換（if分で判定しやすいように）
        int intFavFlag = [favoriteflag intValue];
        if (intFavFlag == 0) {
            //お気に入り指定されていないので削除
            [_coffeeArray removeObject:coffeeArray_each];
        }
    
    }
    _myFTableView.delegate = self;
    _myFTableView.dataSource = self;
    
}
//行数を返す
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _coffeeArray.count;
}
//セルに文字を表示する
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //定数を宣言
    static NSString *CellIdentifer = @"Cell";
    //セルの再利用
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer];
    if (cell == nil) {
        //セルの初期化とスタイルの決定
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifer];
    }
    cell.textLabel.text = _coffeeArray[indexPath.row][@"name"];
    return cell;
}
//何か行が押されたときDetailViewControllerに画面遷移する
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Tap:%d",indexPath.row);
    
//画面遷移のカプセル化（インスタンスカ）
    DetailViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    //押された行数だけではなく、お気に入りもそうでないものも全て入ってるリストから番号を検索する
    //UserDefaultからデータを取り出す
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *coffeeTmp;
    //保存されたデータを取り出す
    coffeeTmp = [defaults objectForKey:@"coffeeTable"];
    
    if (coffeeTmp == nil) {
        //一度も保存されていない場合はデフォルトリストを代入する
        //配列を使った場合
        coffeeTmp =  @[@{@"name":@"ブルーマウンテン",
                         @"desc":@"ジャマイカにあるブルーマウンテン山脈の標高800～1200mの限られた地域で栽培されるコーヒー豆のブランド。\nブルーマウンテンの特徴として、香りが非常に高く、繊細な味であることが挙げられる。香りが高いため、他の香りが弱い豆とブレンドすることが多い。",
                         @"favoriteflag":@"0"},
                       @{@"name":@"キリマンジャロ",@"desc":@"説明キリ",@"favoriteflag":@"0"},
                       @{@"name":@"ブラジル",@"desc":@"説明ブラジル",@"favoriteflag":@"0"},
                       @{@"name":@"コロンビア",@"desc":@"説明コロンビア",@"favoriteflag":@"0"}];
    }
    int index = 0;
    for (NSDictionary *coffeeArray_each in coffeeTmp) {
        NSString *name = coffeeArray_each[@"name"];
        //名前が同じ者が存在した場合、検索処理を中止する
        if ([name isEqualToString:_coffeeArray[indexPath.row][@"name"]]) {
            break;
        }
        index++;
    }
    //検索処理結果の番号を遷移先の画面に渡す
    dvc.select_num = index;
    //ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController] pushViewController:dvc animated:YES];


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

@end
