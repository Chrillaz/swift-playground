import SwiftUI

struct BudgetsView: View {
    @EnvironmentObject var store: Store<State>;
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            NoItemsTextView(
                isPresented: store.state.budgets.isEmpty,
                message: "No budgets just yet."
            )
            List(store.state.budgets) { budget in
                NavigationLink(
                    destination: InvoicesView(budget: budget)
                        .environmentObject(store)
                ) {
                    Text("\(budget.title)")
                }
            }
            .navigationTitle("Budgets")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button("Add", action: {
                        viewModel.isEditPresented.toggle()
                    })
                    Spacer()
                }
            }
        }
        .sheet(isPresented: $viewModel.isEditPresented) {
            NavigationStack {
                BudgetEditView(data: $viewModel.data)
                    .toolbar {
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done", action: {
                                store.dispatch(StateAction.setBudget(viewModel.data))
                                viewModel.clearSheet()
                            })
                        }
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel", action: {
                                viewModel.clearSheet()
                            })
                        }
                    }
            }
        }
    }
}

struct BudgetsView_Preview: PreviewProvider {
    static var previews: some View {
        BudgetsView()
            .environmentObject(Store(
                initial: State(),
                reducer: State.reducer
            ))
    }
}
