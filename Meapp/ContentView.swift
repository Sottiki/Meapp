import SwiftUI

struct ContentView: View {
    @State private var showSettings = false
    
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
            
            VStack {
                HStack {
                    Spacer()
                    Button {
                        showSettings = true
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .font(.title2)
                            .foregroundColor(.cyan)
                            .padding(10)
                            .background(.ultraThinMaterial)
                            .clipShape(Circle())
                            .shadow(color: .cyan.opacity(0.6), radius: 8)
                    }
                    .padding(.trailing, 16)
                    .padding(.top, 14)
                }
                Spacer()
            }
        }
        // 設定はシートで出す（Tabとは別系統）
        .sheet(isPresented: $showSettings) {
            SettingView()
                .presentationDetents([.large])     // 中/大の2段階
                .presentationDragIndicator(.visible)        // 上のインジケータ
                .background(.clear)                         // HUDと馴染ませる
        }
    }
}

#Preview {
    ContentView()
}
