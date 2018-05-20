// =============================================================================
//  Ryochan
//  Copyright Yuichi Nakayasu. All rights reserved.
// =============================================================================
import Nimble
import Quick
@testable import Ryochan2

class StringExtensionTestSpec: QuickSpec {
    override func spec() {
        describe("String#subscript") {
            let str = "ABCDEFGHIJ"
            context("対象の文字列をABCDEFGHIJとしたとき") {
                it("開始を0、終了を5にするとABCDEFが戻ること") {
                    let target = str.substring(start: 0, end: 5)
                    expect(target).to(equal("ABCDEF"))
                }
                it("開始を3、終了を6にするとDEFGが戻ること") {
                    let target = str.substring(start: 3, end: 6)
                    expect(target).to(equal("DEFG"))
                }
                it("開始を-1、終了を2にするとABCが戻ること") {
                    let target = str.substring(start: -1, end: 2)
                    expect(target).to(equal("ABC"))
                }
                it("開始を6、終了を12にするとGHIJが戻ること") {
                    let target = str.substring(start: 6, end: 12)
                    expect(target).to(equal("GHIJ"))
                }
            }
        }
        describe("String#removedBackward") {
            let str = "ABCDEFGHIJ"
            context("対象の文字列をABCDEFGHIJとしたとき") {
                it("引数を渡さない場合にABCDEFGHIが戻ること") {
                    let target = str.removedBackward()
                    expect(target).to(equal("ABCDEFGHI"))
                }
                it("引数に3を渡した場合にABCDEFGが戻ること") {
                    let target = str.removedBackward(3)
                    expect(target).to(equal("ABCDEFG"))
                }
            }
        }
        describe("String#path") {
            let str = "ABCDEFGHIJ"
            context("対象の文字列をABCDEFGHIJとしたとき") {
                it("引数に\"some\"を渡した場合ににABCDEFGHIJ/someが戻ること") {
                    let target = str.path("some")
                    expect(target).to(equal("ABCDEFGHIJ/some"))
                }
            }
        }
    }
}
