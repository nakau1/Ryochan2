// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

class BootstrapViewController: UITableViewController {
    
    // ここで動作を定義します
    // =========================================================================
    private let items: [(section: String, rows: [(title: String, handler: (UIViewController)->Void)])] = [
        (section: "App",
         rows: [
            (title: "アプリ起動", handler: { vc in
                vc.present(crossDissolve: LaunchViewController.create())
            }),
            ]),
        (section: "各画面テスト",
         rows: [
            (title: "トップ画面", handler: { vc in
                vc.present(crossDissolve: TopViewController.create())
            }),
            (title: "似顔絵編集画面", handler: { vc in
                vc.present(crossDissolve: PortraitEditViewController.create())
            }),
            (title: "似顔絵選択画面", handler: { vc in
                vc.present(crossDissolve: PortraitSelectViewController.create())
            }),
            (title: "フォーメーション編集画面", handler: { vc in
                vc.present(crossDissolve: FormationViewController.create())
            }),
            (title: "ベンチメンバー編集画面", handler: { vc in
                vc.present(crossDissolve: FormationSubstituteViewController.create())
            }),
            (title: "ユニフォーム一覧画面", handler: { vc in
                vc.present(crossDissolve: UniformListViewController.create())
            }),
            (title: "ユニフォーム編集画面", handler: { vc in
                vc.present(crossDissolve: UniformEditViewController.create())
            }),
            (title: "ユニフォーム選択画面", handler: { vc in
                vc.present(crossDissolve: UniformSelectViewController.create())
            }),
            (title: "壁紙選択画面", handler: { vc in
                vc.present(crossDissolve: WallpaperViewController.create())
            }),
            ]),
        (section: "モジュールテスト",
         rows: [
            (title: "値選択ダイアログ", handler: { vc in
                vc.present(crossDissolve: ValueSelectViewController.create())
            }),
            (title: "色選択ダイアログ", handler: { vc in
                vc.present(crossDissolve: ColorSelectViewController.create())
            }),
            (title: "文字入力モジュール", handler: { vc in
                vc.present(crossDissolve: TextInputViewController.create())
            }),
            (title: "ドロワーメニュー", handler: { vc in
                let _ = MenuViewController.show(from: vc)
            }),
            (title: "アラートダイアログ", handler: { vc in
                AlertDialog.showConfirmDelete(from: vc, whenDelete: {
                    print("削除を押した")
                })
            }),
            ]),
        (section: "簡易テスト",
         rows: [
            (title: "機能テスト", handler: { vc in
                
            }),
            ]),
        ]
    // =========================================================================
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.section].rows[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        items[indexPath.section].rows[indexPath.row].handler(self)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section].section
    }
}
