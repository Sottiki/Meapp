import SwiftUI

struct SkillView: View {
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
                        SkillBar(skill: skill, progress: progress)
                    }
                }.padding()
            }
            
        }
    }
}

#Preview {
    SkillView()
}
