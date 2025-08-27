import SwiftUI

struct HobbyView: View {
    let hobbies = ["ゲーム", "旅行", "旅行サイト巡回"]
    
    var body: some View {
        ZStack {
            DarkBackgroundHUD()
            
            VStack {
                Text("趣味")
                    .font(.title)
                    .foregroundColor(.white)
                
                GeometryReader { geo in
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(hobbies, id: \.self) { hobby in
                                Text(hobby)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(.ultraThinMaterial)
                                    .cornerRadius(15)
                                    .shadow(color: .cyan.opacity(0.5), radius: 5)
                            }
                        }
                        .frame(minHeight: geo.size.height) // ScrollView内で画面高さを確保
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.clear)
                    }
                }
            }
            
        }
    }
}

#Preview {
    HobbyView()
}
