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
                
            }),
            (title: "リスト画面", handler: { vc in
                
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
