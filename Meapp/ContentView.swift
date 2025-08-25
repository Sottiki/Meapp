import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // DarkBackgroundHUD() // 背景HUDは全画面共通
            TabView {
                ProfileCard()
                HobbyView()
                SkillView()
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic)) // 横スワイプ、インジケータ表示
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    ContentView()
}
