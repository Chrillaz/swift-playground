import SwiftUI

extension InvoicesView {
    
    @MainActor class ViewModel: ObservableObject {
        
        @Published var isPresentingEdit: Bool = false
        
        @Published var data: Invoice.Data = Invoice.Data()
        
        func clearSheet() -> Void {
            data = Invoice.Data()
            isPresentingEdit.toggle()
        }
        
        func totalEarnings(_ budget: Budget) -> Int {
            return Int(budget.earnings) ?? 0
        }
        
        func totalSpendings(_ invoices: [Invoice]?) -> Int {
            return (invoices ?? []).map { Int($0.amount) ?? 0 }.reduce(0) { $0 + $1 }
        }
        
        func totalDisposal(_ budget: Budget, _ store: Store<State>) -> Int {
            if let invoices = store.state.invoices[budget.id] {
                return totalEarnings(budget) - totalSpendings(invoices)
            }
            
            return totalEarnings(budget)
        }
    }
}
