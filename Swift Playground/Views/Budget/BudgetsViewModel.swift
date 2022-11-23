import Foundation
import SwiftUI

extension BudgetsView {
    
    @MainActor class ViewModel: ObservableObject {
        
        @Published var isEditPresented: Bool = false
        
        @Published var data: Budget.Data = Budget.Data()
        
        func clearSheet() -> Void {
            data = Budget.Data()
            isEditPresented.toggle()
        }
    }
}
