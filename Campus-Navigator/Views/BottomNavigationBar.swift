import SwiftUI

struct BottomNavigationBar: View {
    @Binding var selectedTab: Int
    @State private var navigateToHome = false
    @State private var navigateToMap = false
    @State private var navigateToAnnouncements = false
    @State private var showProfileSheet = false

    let icons = ["house.fill", "paperplane.fill", "speaker.wave.2.fill", "person.fill"]

    var body: some View {
        HStack(spacing: 40) {
            ForEach(0..<icons.count, id: \.self) { index in
                VStack(spacing: 4) {
                    Image(systemName: icons[index])
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundColor(selectedTab == index ? Color(hex: "#0066CC") : .gray)

                    if selectedTab == index {
                        Circle()
                            .fill(Color(hex: "#003B95"))
                            .frame(width: 6, height: 6)
                    } else {
                        Circle()
                            .fill(Color.clear)
                            .frame(width: 6, height: 6)
                    }
                }
                .frame(maxWidth: .infinity)
                .onTapGesture {
                    selectedTab = index
                    if index == 0 { navigateToHome = true }
                    if index == 1 { navigateToMap = true }
                    if index == 2 { navigateToAnnouncements = true }
                    if index == 3 { showProfileSheet = true }
                }
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 24)
        .background(Color(hex: "#D4E8FC"))
        .cornerRadius(15)
        .padding(.horizontal, 40)

        .background(
            Group {
                NavigationLink(destination: HomeView(), isActive: $navigateToHome) { EmptyView() }.hidden()
                NavigationLink(destination: NavigationMapView(), isActive: $navigateToMap) { EmptyView() }.hidden()
                NavigationLink(destination: AnnouncementView(), isActive: $navigateToAnnouncements) { EmptyView() }.hidden()
            }
        )
        .sheet(isPresented: $showProfileSheet) {
            ProfileView()
                .presentationDetents([.medium, .large])
        }
    }
}
