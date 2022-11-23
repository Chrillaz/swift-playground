import SwiftUI

struct InvoiceView: View {
    var invoice: Invoice
    
    var body: some View {
        HStack {
            RadioButtonView(
                checked: invoice.completed,
                onTapGesture: {}
            )
            Text("\(invoice.title)")
            Spacer()
            Text("\(Int(invoice.amount) ?? 0)")
        }
    }
}

struct InvoiceView_Preview: PreviewProvider {
    static var previews: some View {
        List {
            InvoiceView(invoice: Invoice.mock[0])
        }
    }
}
