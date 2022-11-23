import Foundation
import Combine

final class Store<State>: ObservableObject {
    @Published private(set) var state: State
    
    private let queue = DispatchQueue(label: "com.playgrounf_app", qos: .userInitiated)
    
    private let reducer: Reducer<State>
    
    init(
        initial state: State,
        reducer: @escaping Reducer<State>
    ) {
        self.state = state
        self.reducer = reducer
    }
    
    func dispatch(_ action: Action) {
        queue.sync {
            self.dispatch(self.state, action)
        }
    }
    
    private func dispatch(_ currentState: State, _ action: Action) {
        state = reducer(currentState, action)
    }
}

