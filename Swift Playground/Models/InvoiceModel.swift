import Foundation

struct Invoice: Identifiable {
    let id: UUID
    var amount: String
    var completed: Bool
    var title: String
    
    init(
        id: UUID = UUID(),
        amount: String,
        completed: Bool = false,
        title: String
    ) {
        self.id = id
        self.amount = amount
        self.completed = completed
        self.title = title
    }
}

extension Invoice {
    
    struct Data {
        var amount: String = ""
        var title: String = ""
    }
}

extension Invoice {
    static var mock: [Invoice] =
    [
        Invoice(amount: "10000", title: "Mat"),
        Invoice(amount: "500", completed: true, title: "Telia"),
        Invoice(amount: "12790", title: "Vännäs kommun sadf asdf asdf asdf asdf asdf asdf sd "),
        Invoice(amount: "450", title: "Unionen")
    ]
}
