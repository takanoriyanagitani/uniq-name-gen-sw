import Foundation

public protocol NameSource {
    func getName() -> String
}

public protocol NameDateSource: NameSource {
    func toName(d: Date) -> String
}

extension NameDateSource {
    public func now2name() -> String {
        let now: Date = Date()
        return self.toName(d: now)
    }

    public func getName() -> String {
        self.now2name()
    }
}

public func printHelo(){
    print("helo")
}

public func date2hour(d: Date, c: Calendar) -> Int {
    c.component(.hour, from: d)
}

public func date2minute(d: Date, c: Calendar) -> Int {
    c.component(.minute, from: d)
}

public func date2second(d: Date, c: Calendar) -> Int {
    c.component(.second, from: d)
}

public func date2nanos(d: Date, c: Calendar) -> Int {
    c.component(.nanosecond, from: d)
}

public func unixtime2date(unixtime: Double) -> Date {
    Date(timeIntervalSince1970: unixtime)
}

public func hour2string(hour: Int) -> String {
    String(format: "%02d", hour)
}

public func minute2string(min: Int) -> String {
    String(format: "%02d", min)
}

public func second2string(sec: Int) -> String {
    String(format: "%02d", sec)
}

public func ms2string(ms: Int) -> String {
    String(format: "%03d", ms)
}

public struct NameSourceDateDefault: NameDateSource {
    public func toName(d: Date) -> String {
        let c: Calendar = Calendar.current
        let h: Int = date2hour(d: d, c: c)
        let m: Int = date2minute(d: d, c: c)
        let s: Int = date2second(d: d, c: c)
        let ms: Int = date2nanos(d: d, c: c) / 1000 / 1000
        return [
            hour2string(hour: h),
            minute2string(min: m),
            second2string(sec: s),
            ms2string(ms: ms),
        ].joined(separator: "-")
    }
}

public func nameSrcDateDefaultNew() -> some NameSource {
    NameSourceDateDefault()
}
