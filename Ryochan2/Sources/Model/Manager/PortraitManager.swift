// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

class PortraitManager {
    
    private class JsonCoder: JsonEncodable, JsonDecodable {}
    
    private var storedList: [Portrait]!
    private var jsonCoder = JsonCoder()
    
    // MARK: - list -
    
    private func saveList(_ list: [Portrait]) {
        jsonCoder.saveJson(list, to: Path.Portrait.json)
    }
    
    func loadList() -> [Portrait] {
        if let list = storedList { return list }
        
        if File.makeTextFileIfNeeded(to: Path.Portrait.json) {
            makeDefaultList()
        }
        storedList = jsonCoder.loadJson(path: Path.Portrait.json, to: [Portrait].self, default: [])
        return storedList
    }
    
    func search(id: String) -> Portrait? {
        if id.isEmpty { return nil }
        for portrait in loadList() {
            if portrait.id == id {
                return portrait
            }
        }
        return nil
    }
    
    private func makeDefaultList() {
        let portraits = (0..<Const.Portrait.minimumNumber).map { _ -> Portrait in
            let portrait = jsonCoder.instantiate(decodableType: Portrait.self)
            writeImages(of: portrait)
            return portrait
        }
        saveList(portraits)
    }
    
    private func index(of portrait: Portrait) -> Int? {
        let list = loadList()
        for (i, element) in list.enumerated() {
            if element == portrait {
                return i
            }
        }
        return nil
    }
    
    // MARK: - add -
    
    func add(_ portrait: Portrait) {
        var list = loadList()
        list.append(portrait)
        saveList(list)
        writeImages(of: portrait)
    }
    
    // MARK: - update -
    
    func update(_ portrait: Portrait) {
        var list = loadList()
        if let i = index(of: portrait) {
            list[i] = portrait
            saveList(list)
            writeImages(of: portrait)
        }
    }
    
    // MARK: - copy -
    
    func copy(_ portrait: Portrait) {
        let cloned = jsonCoder.clone(portrait, type: Portrait.self)
        cloned.id = String.generateIdentifier()
        add(portrait)
    }
    
    // MARK: - delete -
    
    func delete(_ portrait: Portrait) {
        let filteredList = loadList().filter { $0 != portrait }
        saveList(filteredList)
        deleteImages(of: portrait)
    }
    
    // MARK: - write image -
    
    private func writeImages(of portrait: Portrait) {
        writeImage(of: portrait)
        writeThumbImage(of: portrait)
    }
    
    private func writeImage(of portrait: Portrait) {
        _ = File.makeDirectoryIfNeeded(to: Path.Portrait.directory)
        // TODO: 未実装
    }
    
    private func writeThumbImage(of portrait: Portrait) {
        _ = File.makeDirectoryIfNeeded(to: Path.Portrait.directory)
        // TODO: 未実装
        // generateImage().write(to: Path.portraitImage(self))
    }
    
    // MARK: - delete image -
    
    private func deleteImages(of portrait: Portrait) {
        deleteImage(of: portrait)
        deleteThumbImage(of: portrait)
    }
    
    private func deleteImage(of portrait: Portrait) {
        File.delete(at: Path.Portrait.image(of: portrait))
    }
    
    private func deleteThumbImage(of portrait: Portrait) {
        File.delete(at: Path.Portrait.thumb(of: portrait))
    }
}
