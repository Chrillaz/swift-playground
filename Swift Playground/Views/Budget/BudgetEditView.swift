import SwiftUI

struct BudgetEditView: View {
    @Binding var data: Budget.Data
    
    var body: some View {
        Form(content: {
            Section(header: Text("Budget Title")) {
                TextField("Title", text: $data.title)
            }
            Section(header: Text("Earnings")) {
                TextField("Earnings", text: $data.earnings)
            }
        })
    }
}

struct BudgetEditView_Preview: PreviewProvider {
    static var previews: some View {
        BudgetEditView(data: .constant(Budget.Data()))
    }
}
