import SwiftUI

struct SkillView: View {
    @State private var animateProgress = false
    @State private var visible = false 
    
    let skills: [String: CGFloat] = ["JavaScript": 0.5, "jQuery": 0.5, "PHP": 0.5,"SwiftUI": 0.1, "Swift": 0.1, "React": 0.25]
    
    var body: some View {
        ZStack {
            DarkBackgroundHUD()
            
            VStack {
                Text("技術スキル")
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
                VStack(spacing: 20) {
                    ForEach(skills.sorted(by: { $0.value > $1.value }), id: \.key) { skill, progress in
                        SkillBar(skill: skill, progress: progress, animated: animateProgress)
                            .opacity(visible ? 1 : 0.75) // フェード制御
                            .animation(
                                .easeOut(duration: 1).delay(0.2), value: animateProgress)
                            .animation(
                                .easeIn(duration: 0.3),
                                value: visible
                            )
                    }.padding()
                }
            }
            
        }
        .onAppear {
            // 一度リセットしてから再生
            animateProgress = false
            visible = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                visible = true
                animateProgress = true
            }
        }
    }
}

#Preview {
    SkillView()
}
