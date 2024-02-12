import XCTest

import Foundation

import UniqNameGenDbFriendly

final class TestHour2Str: XCTestCase {

    func test_epoch(){
        let d: Date = UniqNameGenDbFriendly.unixtime2date(unixtime: 0.0)
        var c: Calendar = Calendar.current
        c.timeZone = TimeZone(secondsFromGMT: 0)!
        let hour: Int = UniqNameGenDbFriendly.date2hour(d: d, c: c)
        let hs: String = UniqNameGenDbFriendly.hour2string(hour: hour)
        XCTAssertEqual("00", hs)
    }

    func test_simple(){
        let d: Date = UniqNameGenDbFriendly.unixtime2date(unixtime: 39600.0)
        var c: Calendar = Calendar.current
        c.timeZone = TimeZone(secondsFromGMT: 0)!
        let hour: Int = UniqNameGenDbFriendly.date2hour(d: d, c: c)
        let hs: String = UniqNameGenDbFriendly.hour2string(hour: hour)
        XCTAssertEqual("11", hs)
    }

}
