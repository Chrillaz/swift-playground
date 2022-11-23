import Foundation

enum StateAction: Action {
    case setBudget(Budget.Data)
    case removeBudget(Int)
    case setInvoice(UUID, Invoice.Data)
    case removeInvoice(UUID, Int)
}
