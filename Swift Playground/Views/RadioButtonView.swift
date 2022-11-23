import SwiftUI

struct RadioButtonView: View {
    
    var checked: Bool
    
    var onTapGesture: () -> Void
    
    var body: some View {
        if (checked) {
            ZStack {
                Circle()
                    .fill(Color.clear)
                    .frame(width: 20, height: 20)
                    .overlay(Circle().stroke(Color("Radiobackground"), lineWidth: 2))
                Circle()
                    .fill(Color("Radiobackground"))
                    .frame(width: 14, height: 14)
            }
            .onTapGesture {
                onTapGesture()
            }
        } else {
            Circle()
                .fill(Color.clear)
                .frame(width: 20, height: 20)
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                .onTapGesture {
                    onTapGesture()
                }
        }
    }
}

struct RadioButtonView_Preview: PreviewProvider {
    static var checked: Bool = false
    
    static var previews: some View {
        RadioButtonView(
            checked: checked,
            onTapGesture: { checked = !checked }
        )
    }
}
