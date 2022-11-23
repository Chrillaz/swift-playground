import SwiftUI

@main
struct Swift_PlaygroundApp: App {
    let store = Store(
        initial: State(),
        reducer: State.reducer
    )
    
    var body: some Scene {
        WindowGroup {
            BudgetsView()
                .environmentObject(store)
        }
    }
}
