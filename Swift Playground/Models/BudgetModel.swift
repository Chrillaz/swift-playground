import Foundation

struct Budget: Identifiable {
    let id: UUID
    var earnings: String
    var title: String
    
    init(
        id: UUID = UUID(),
        earnings: String,
        title: String
    ) {
        self.id = id
        self.earnings = earnings
        self.title = title
    }
}

extension Budget {
    
    struct Data {
        var earnings: String = ""
        var title: String = ""
    }
}

extension Budget {
    
    static var mock: [Budget] =
    [
        Budget(earnings: "35000", title: "Vardag"),
        Budget(earnings: "36000", title: "Renovering")
    ]
}
