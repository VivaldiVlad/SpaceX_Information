import Foundation

extension Date {
    static func getCorrectDay(unixTime: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(unixTime))
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US") as Locale
        dateFormatter.dateFormat = "d MMM, yyyy"
        return dateFormatter.string(from: date)
    }
}
