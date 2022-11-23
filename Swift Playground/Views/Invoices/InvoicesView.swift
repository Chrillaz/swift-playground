import SwiftUI

struct InvoicesView: View {
    
    var budget: Budget
    
    @EnvironmentObject var store: Store<State>
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                InvoiceHeaderView(
                    earnings: viewModel.totalEarnings(budget),
                    spendings: viewModel.totalSpendings(store.state.invoices[budget.id]),
                    disposals: viewModel.totalDisposal(budget, store)
                )
                NoItemsTextView(
                    isPresented: store.state.invoices[budget.id] == nil,
                    message: "No invoices her yet."
                )
                List(store.state.invoices[budget.id] ?? []) { invoice in
                    InvoiceView(invoice: invoice)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(budget.title)
            }
            ToolbarItemGroup(placement: .bottomBar) {
                Button("Add", action: {
                    viewModel.isPresentingEdit.toggle()
                })
                Spacer()
            }
        }
        .sheet(isPresented: $viewModel.isPresentingEdit) {
            NavigationStack {
                InvoiceEditView(data: $viewModel.data)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel", action: {
                                viewModel.clearSheet()
                            })
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done", action: {
                                store.dispatch(StateAction.setInvoice(budget.id, viewModel.data))
                                viewModel.clearSheet()
                            })
                        }
                    }
            }
        }
    }
}

struct InvoicesView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            InvoicesView(budget: Budget.mock[0])
                .environmentObject(Store(
                    initial: State(),
                    reducer: State.reducer
                ))
        }
    }
}
