import Foundation

extension State {
    static var reducer: Reducer<State> = { state, action in
        switch action {
        case StateAction.setBudget(let budgetData):
            var budgets = state.budgets
            
            budgets.append(Budget(
                earnings: budgetData.earnings,
                title: budgetData.title
            ))
            
            return State(
                budgets: budgets,
                invoices: state.invoices
            )
            
        case StateAction.removeBudget(let index):
            var budgets = state.budgets
            
            budgets.remove(at: index)
            
            return State(
                budgets: budgets,
                invoices: state.invoices
            )
            
        case StateAction.setInvoice(let budgetUuid, let invoiceData):
            var records = state.invoices
            var invoices = records[budgetUuid] ?? []
            
            invoices.append(
                Invoice(amount: invoiceData.amount, title: invoiceData.title)
            )
            
            records[budgetUuid] = invoices
            
            return State(
                budgets: state.budgets,
                invoices: records
            )
            
        case StateAction.removeInvoice(let budgetUuid, let index):
            if var invoices = state.invoices[budgetUuid] {
                var records = state.invoices
                
                invoices.remove(at: index)
                
                records[budgetUuid] = invoices
                
                return State(
                    budgets: state.budgets,
                    invoices: records
                )
            }
            
            return state
            
        default:
            return state
        }
    }
}

