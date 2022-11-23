import SwiftUI

struct InvoiceEditView: View {
    @Binding var data: Invoice.Data

    var body: some View {
        Form {
            Section(header: Text("Title")) {
                TextField("Title", text: $data.title)
            }
            Section(header: Text("Amount")) {
                TextField("Amount", text: $data.amount)
            }
        }
    }
}

struct InvoiceEditView_Preview: PreviewProvider {
    static var previews: some View {
        InvoiceEditView(data: .constant(Invoice.Data()))
    }
}
