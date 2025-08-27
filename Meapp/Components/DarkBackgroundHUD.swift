import SwiftUI

struct DarkBackgroundHUD: View {
    @State private var animate = false
    
    var body: some View {
        ZStack {
            // 背景色
            Color.black.ignoresSafeArea()
            
            // 動くライン
            GeometryReader { geo in
                ForEach(0..<5, id: \.self) { i in
                    Rectangle()
                        .fill(Color.cyan.opacity(0.2))
                        .frame(height: 1)
                        .offset(y: animate ? geo.size.height * CGFloat(i) / 5 : -geo.size.height)
                        .animation(
                            .linear(duration: 6)
                            .repeatForever(autoreverses: false)
                            .delay(Double(i) * 1.2),
                            value: animate
                        )
                }
            }
            
            // パーティクル
            GeometryReader { geo in
                ForEach(0..<25, id: \.self) { i in
                    Circle()
                        .fill(Color.cyan.opacity(0.6))
                        .frame(width: 3, height: 3)
                        .position(
                            x: CGFloat.random(in: 0...geo.size.width),
                            y: CGFloat.random(in: 0...geo.size.height)
                        )
                        .opacity(animate ? 0.2 : 1)
                        .animation(
                            .easeInOut(duration: Double.random(in: 2...5))
                            .repeatForever(autoreverses: true),
                            value: animate
                        )
                }
            }
        }
        .onAppear {
            animate = true
        }
    }
}

#Preview {
    DarkBackgroundHUD()
}
