import Foundation

extension Date {
    static func getCorrectDay(unixTime: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(unixTime))
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ru_Ru") as Locale
        dateFormatter.dateFormat = "d MMMM, yyyy"
        return dateFormatter.string(from: date)
    }
    
    static func changeStringDateFormat(flightDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        guard let date = dateFormatter.date(from: flightDate) else { return "" }
        
        dateFormatter.dateFormat = "d MMMM, yyyy"
        
        return dateFormatter.string(from: date)
       
    }
}
