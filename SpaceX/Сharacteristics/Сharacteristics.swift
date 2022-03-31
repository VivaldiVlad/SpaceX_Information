import Foundation

enum Characteristics: String, CaseIterable {
    case height = "Высота, ft"
    case diameter = "Диаметр, ft"
    case weight = "Вес, lb"
    case payload = "Полезная нагрузка"
    
    static func numberOfSections() -> Int {
        return self.allCases.count
    }
    
    static func getTitle(_ item: Int) -> Characteristics {
        return self.allCases[item]
    }
}
