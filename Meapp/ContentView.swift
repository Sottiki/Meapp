import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            TabView {
                ProfileCard()
                MusicLibraryView()
                HobbyView()
                SkillView()
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic)) // 横スワイプ、インジケータ表示
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
