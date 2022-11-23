import SwiftUI

struct InvoiceHeaderView: View {
    var earnings: Int
    
    var spendings: Int
    
    var disposals: Int
    
    var body: some View {
        HStack {
            Label("Earnings", systemImage: "lock.circle.fill")
            Spacer()
            Text("\(earnings)")
        }
        .padding([.horizontal, .bottom])
        HStack {
            Label("Spendings", systemImage: "dollarsign.circle.fill")
            Spacer()
            Text("\(spendings)")
        }
        .padding([.horizontal, .bottom])
        HStack {
            Label("Disposal", systemImage: "creditcard.circle.fill")
            Spacer()
            Text("\(disposals)")
        }
        .padding(.horizontal)
    }
}

struct InvoiceHeaderView_Preview: PreviewProvider {
    static var previews: some View {
        InvoiceHeaderView(earnings: 40000, spendings: 22000, disposals: 18000)
    }
}
