import SwiftUI

struct NoItemsTextView: View {
    var isPresented: Bool
    
    var message: String
    
    var body: some View {
        if (isPresented) {
            VStack {
                Spacer()
                Text("\(message)")
            }
        }
    }
}

struct NoItemsTextView_Preview: PreviewProvider {
    static var previews: some View {
        NoItemsTextView(isPresented: true, message: "Nothing here")
    }
}
