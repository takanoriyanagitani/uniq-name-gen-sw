import XCTest

import Foundation

import UniqNameGenDbFriendly

final class TestHour: XCTestCase {

    func test_epoch(){
        let d: Date = UniqNameGenDbFriendly.unixtime2date(unixtime: 0.0)
        let c: Calendar = Calendar.current
        let i: Int = UniqNameGenDbFriendly.date2hour(d: d, c: c)
        XCTAssertEqual(0, i)
    }

}
