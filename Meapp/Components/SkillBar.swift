import SwiftUI

struct SkillBar: View {
    let skill: String
    let progress: CGFloat // 0.0 ~ 1.0

    @State private var animateProgress = false

    var body: some View {
        VStack(alignment: .leading) {
            Text(skill).foregroundColor(.white)
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 10)
                Capsule()
                    .fill(Color.cyan)
                    .frame(width: animateProgress ? progress * 300 : 0, height: 10)
                    .animation(.easeOut(duration: 1), value: animateProgress)
            }
        }
        .padding(.vertical, 5)
        .onAppear {
            animateProgress = true
        }
    }
}


#Preview {
    SkillBar(skill: "react", progress: 0.25)
}
