// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

class FormationManager {
    
    private var stored: Formation!
    private var jsonCoder = JsonCoder()
    
    // MARK: - list -
    
    /// ファイルに保存する
    ///
    /// - Parameter formation: フォーメーションオブジェクト
    func save(_ formation: Formation) {
        jsonCoder.saveJson(formation, to: Path.Formation.json)
    }
    
    /// ファイルに保存された一覧を読み込む
    ///
    /// - Returns: 似顔絵オブジェクトの配列
    func load() -> Formation {
        if let formation = stored { return formation }
        
        if File.makeTextFileIfNeeded(to: Path.Formation.json) {
            makeDefaultFormation()
        }
        stored = jsonCoder.loadJson(path: Path.Formation.json, to: Formation.self, default: instantiateDefaultFormation())
        return stored
    }
    
    private func makeDefaultFormation() {
        save(instantiateDefaultFormation())
    }
    
    private func instantiateDefaultFormation() -> Formation {
        let formation = jsonCoder.instantiate(decodableType: Formation.self)
        formation.startings = PositionTemplate.pos442a.positions
        return formation
    }
}
