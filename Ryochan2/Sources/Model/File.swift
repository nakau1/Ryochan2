// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import UIKit

class File {
    
    /// 指定したディレクトリパス内のファイル名をすべて取得する
    ///
    /// - Parameter path: ディレクトリパス文字列
    /// - Returns: ファイル名の配列
    class func fileNames(in path: String) -> [String] {
        do {
            return try FileManager.default.contentsOfDirectory(atPath: path)
        } catch(let error) {
            print("File Error: failed get file names: \(error.localizedDescription)")
        }
        return []
    }
    
    /// ファイル削除
    ///
    /// - Parameter path: パス文字列
    class func delete(at path: String) {
        if FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.removeItem(atPath: path)
            } catch(let error) {
                print("File Error: failed delete: \(error.localizedDescription)")
            }
        }
    }
    
    /// 指定したパスにファイルが存在しない場合に空のテキストファイルを作成する
    ///
    /// - Parameter path: パス文字列
    /// - Returns: 作成を完了した場合のみ true を返す
    class func makeTextFileIfNeeded(to path: String) -> Bool {
        if FileManager.default.fileExists(atPath: path) {
            do {
                try "".write(to: URL(fileURLWithPath: path), atomically: true, encoding: .utf8)
                return true
            } catch(let error) {
                print("File Error: failed make text file: \(error.localizedDescription)")
            }
        }
        return false
    }
    
    /// 指定したパスにディレクトリが存在しない場合にディレクトリを作成する
    ///
    /// - Parameter path: パス文字列
    /// - Returns: 作成を完了した場合のみ true を返す
    class func makeDirectoryIfNeeded(to path: String) -> Bool {
        if !FileManager.default.fileExists(atPath: path) {
            do {
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
                return true
            } catch(let error) {
                print("File Error: failed make directory: \(error.localizedDescription)")
            }
        }
        return false
    }
}
