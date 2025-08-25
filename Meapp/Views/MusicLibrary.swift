import SwiftUI
import MusicKit

struct MusicLibraryView: View {
    @State private var songs: [Song] = []
    @State private var isAuthorized = false
    
    var body: some View {
        ZStack {
            DarkBackgroundHUD()
            
            VStack {
                Text("お気に入りの音楽")
                    .font(.title)
                    .foregroundColor(.white)
                
                if isAuthorized {
                    List(songs, id: \.id) { song in
                        HStack(spacing: 12) {
                            // ジャケット画像
                            if let artwork = song.artwork {
                                AsyncImage(url: artwork.url(width: 80, height: 80)) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                    case .success(let image):
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 80, height: 80)
                                            .cornerRadius(10)
                                            .shadow(color: .cyan.opacity(0.5), radius: 5)
                                    case .failure:
                                        Color.gray.frame(width: 80, height: 80)
                                    @unknown default:
                                        EmptyView()
                                    }
                                }
                            }
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(song.title)
                                    .foregroundColor(.cyan)
                                    .fontWeight(.bold)
                                Text(song.artistName)
                                    .foregroundColor(.white.opacity(0.7))
                                    .font(.caption)
                            }
                            Spacer()
                        }
                        .padding(8)
                        .cornerRadius(12)
                        .listRowBackground(Color.clear)
                    }
                    .listStyle(PlainListStyle())
                } else {
                    Text("Apple Music へのアクセスを許可してください")
                        .foregroundColor(.primary)
                }
            }
            .padding()
        }
        .task {
            let status = await MusicAuthorization.request()
            if status == .authorized {
                isAuthorized = true
                await fetchLibrarySongs()
            }
        }
    }
    
    private func fetchLibrarySongs() async {
        do {
            let request = MusicLibraryRequest<Song>()
            let response = try await request.response()
            songs = Array(response.items.prefix(10))
        } catch {
            print("ライブラリ取得失敗: \(error)")
        }
    }
}
