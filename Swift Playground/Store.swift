import Foundation
import SwiftUI

class Store<State, Action>: ObservableObject {
    @Published private(set) var state: State

    private let reducer: Reducer<State, Action>

    private let queue = DispatchQueue(
        label: "com.chrillaz",
        qos: .userInitiated
    )

    init(
        initial: State,
        reducer: @escaping Reducer<State, Action>
    ) {
        self.state = initial
        self.reducer = reducer
    }

    func dispatch(_ action: Action) {
        queue.sync {
            self.dispatch(self.state, action)
        }
    }

    private func dispatch(_ currentState: State, _ action: Action) {
        let newState = reducer(currentState, action)

        state = newState
    }
}

extension Store {
    func binding<Value>(
        for keyPath: KeyPath<State, Value>,
        transform: @escaping (Value) -> Action
    ) -> Binding<Value> {
        Binding<Value>(
            get: { self.state[keyPath: keyPath] },
            set: { self.dispatch(transform($0)) }
        )
    }
}

let AppReducer: Reducer<State, Actions> = { state, action in

    var mutatingState = state

    switch action {
        case .setBudget(let budget):
            mutatingState.budgets.append(budget)
        
        case .removeBudget(let budget): 
            if let index = mutatingState.budgets.firstIndex(where: {$0.id == budget.id}) {
                mutatingState.budgets.remove(at: index)
            }
        
        case .setInvoice(let id, let invoice):
            if var invoices = mutatingState.invoices[id] {
                invoices.append(invoice)
            }
        
        case .removeInvoice(let id, let invoice):
            if var invoices = mutatingState.invoices[id] {
                if let index = invoices.firstIndex(where: { $0.id == invoice.id }) {
                    invoices.remove(at: index)
                }
            }
    }
    
    return mutatingState
}
