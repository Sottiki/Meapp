import SwiftUI
import PhotosUI

struct SettingView: View {
    @AppStorage("profileImageData") private var profileImageData: Data?
    @State private var selectedItem: PhotosPickerItem?

    var body: some View {
        ZStack {
            DarkBackgroundHUD()

            VStack(spacing: 20) {
                Text("設定").font(.title).foregroundColor(.white)

                // アイコン表示
                Group {
                    if let data = profileImageData, let uiImage = UIImage(data: data) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(.cyan, lineWidth: 3))
                            .shadow(color: .cyan.opacity(0.7), radius: 10)
                            .accessibilityLabel("プロフィールアイコン")
                    } else {
                        Circle()
                            .fill(.ultraThinMaterial)
                            .frame(width: 120, height: 120)
                            .overlay(
                                Image(systemName: "person.crop.circle.badge.plus")
                                    .font(.system(size: 40))
                                    .foregroundColor(.cyan)
                            )
                            .shadow(color: .cyan.opacity(0.7), radius: 10)
                            .accessibilityLabel("プロフィールアイコン未設定")
                    }
                }

                // 画像選択ボタン
                PhotosPicker("アイコンを変更", selection: $selectedItem, matching: .images)
                    .foregroundColor(.cyan)
                    .buttonStyle(.borderedProminent)
                    .tint(.cyan.opacity(0.25))

                Spacer()
            }
            .padding()
        }
        .onChange(of: selectedItem) { oldValue, newValue in
            guard let newValue else { return }
            Task {
                // 軽量データ優先（HEIC/JPEGなどそのまま）
                if let data = try? await newValue.loadTransferable(type: Data.self) {
                    // 保存する前にサイズを絞る（任意・後述の拡張版で）
                    profileImageData = data
                }
            }
        }
    }
}

#Preview {
    SettingView()
}
