import XCTest

import Foundation

import UniqNameGenDbFriendly

final class TestHour: XCTestCase {

    func test_epoch(){
        let d: Date = UniqNameGenDbFriendly.unixtime2date(unixtime: 0.0)
        var c: Calendar = Calendar.current
        c.timeZone = TimeZone(secondsFromGMT: 0)!
        let i: Int = UniqNameGenDbFriendly.date2hour(d: d, c: c)
        XCTAssertEqual(0, i)
    }

    func test_simple(){
        let d: Date = UniqNameGenDbFriendly.unixtime2date(unixtime: 39600.0)
        var c: Calendar = Calendar.current
        c.timeZone = TimeZone(secondsFromGMT: 0)!
        let i: Int = UniqNameGenDbFriendly.date2hour(d: d, c: c)
        XCTAssertEqual(11, i)
    }

    func test_2006(){
        let d: Date = ISO8601DateFormatter().date(from: "2006-01-02T15:04:05Z")!
        var c: Calendar = Calendar.current
        c.timeZone = TimeZone(secondsFromGMT: 0)!
        let i: Int = UniqNameGenDbFriendly.date2hour(d: d, c: c)
        XCTAssertEqual(15, i)
    }

    func test_2006_tokyo(){
        let d: Date = ISO8601DateFormatter().date(from: "2006-01-02T15:04:05Z")!
        var c: Calendar = Calendar.current
        c.timeZone = TimeZone(secondsFromGMT: 3600*9)!
        let i: Int = UniqNameGenDbFriendly.date2hour(d: d, c: c)
        XCTAssertEqual(0, i)
    }

}
