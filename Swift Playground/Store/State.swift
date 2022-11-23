import Foundation

struct State {
    var budgets: [Budget]
    let invoices: [UUID: [Invoice]]
}

extension State {
    init() {
        budgets = [Budget]()
        invoices = [UUID: [Invoice]]()
    }
}

protocol Action {}

typealias Reducer<State> = (State, Action) -> State
