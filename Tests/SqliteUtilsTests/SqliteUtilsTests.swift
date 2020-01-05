import XCTest
@testable import SqliteUtils

final class SqliteUtilsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SqliteUtils().text, "Hello, World!")
    }
    func testSqliteBroker() {
        let db = SqliteBroker()
        db.myStart()
        
        var scmd = "DROP TABLE IF EXISTS junk"
        let table = "beta.sqlite"
        db.sqlExe(table: table, stmt: scmd)
        
        scmd = "create table junk (id int, msg text, row int, timeStamp text)"
        db.sqlExe(table: table,stmt: scmd)
        
        let timestamp = NSDate().timeIntervalSince1970
        scmd = "insert into junk (id,msg,row,timeStamp) values (0,'worked',1,'\(timestamp)')"
        db.sqlExe(table: table,stmt: scmd)
        
        scmd = "select * from junk"
        let result = db.sqlQuery(table: table, stmt: scmd)
        print("result: \(result[0].msg)")
        
        XCTAssertEqual(result[0].id, 0)
        XCTAssertEqual(result[0].msg, "worked")
        XCTAssertEqual(result[0].row, 1)
        XCTAssertEqual(result[0].timeStamp, "\(timestamp)")
        
        
    }

    static var allTests = [
        ("testExample", testExample),
         ("testSqliteBroker", testSqliteBroker),
    ]
}
