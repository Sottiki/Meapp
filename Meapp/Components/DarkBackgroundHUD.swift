import SwiftUI

struct DarkBackgroundHUD: View {
    @State private var animateLine = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            // 流れる線アニメーション
            VStack {
                ForEach(0..<5) { i in
                    Rectangle()
                        .fill(LinearGradient(
                            gradient: Gradient(colors: [.cyan.opacity(0.3), .cyan.opacity(0.0)]),
                            startPoint: .leading,
                            endPoint: .trailing))
                        .frame(height: 2)
                        .offset(x: animateLine ? 400 : -400, y: CGFloat(i) * 60)
                        .animation(Animation.linear(duration: 4).repeatForever(autoreverses: false), value: animateLine)
                }
                Spacer()
            }
            
        }
        .onAppear {
            animateLine = true
        }
    }
}


#Preview {
    DarkBackgroundHUD()
}
