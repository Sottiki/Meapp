import SwiftUI

struct ProfileCard: View {
    var body: some View {
        VStack (spacing: 30) {
            VStack {
                Circle()
                    .fill(Color.cyan)
                    .frame(width: 100, height: 100)
                    .overlay(
                        Image(systemName: "aqi.medium")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.white)
                            .symbolEffect(.bounce)
                            .font(.largeTitle)
                    )
                
                Text("Webエンジニア")
                    .foregroundColor(.white)
                    .font(.headline)
                
                Text("Web Developer")
                    .foregroundColor(.cyan)
                    .font(.subheadline)
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .shadow(color: .cyan.opacity(0.6), radius: 10, x: 0, y: 0)
            
            Text("新卒3年目のWebエンジニア\n旅行比較サイトの開発に携わる")
                .foregroundColor(.white)
        }
    }
}


#Preview {
    ProfileCard()
}
