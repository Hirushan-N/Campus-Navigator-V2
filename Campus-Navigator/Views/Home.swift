import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    @State private var selectedCategory = "Labs"
    @State private var selectedTab = 0
    @State private var showFilterSheet = false

    let categories = ["Labs", "Cafe", "Study Area", "Office", "Lecture Halls", "Library"]

    let categoryItems: [String: [Item]] = [
        "Labs": [
            Item(name: "IOS Lab", floor: "3rd floor", image: "ios_lab", isReservationEnabled: true, distance: "250m", status: "Busy", time: "10.00am - 3.00pm"),
            Item(name: "Study Area", floor: "1st floor", image: "study_area", isReservationEnabled: false, distance: "500m", status: "Free", time: "7.00am - 6.00pm"),
            Item(name: "Design Studio", floor: "2nd floor", image: "design_studio", isReservationEnabled: false, distance: "200m", status: "Busy", time: "8.00am - 4.00pm"),
            Item(name: "Game Room", floor: "Basement", image: "game_room", isReservationEnabled: false, distance: "100m", status: "Free", time: "9.00am - 10.00pm"),
            Item(name: "AI Research Lab", floor: "Top floor", image: "ai_lab", isReservationEnabled: true, distance: "350m", status: "Busy", time: "7.30am - 5.00pm")
        ],
        "Cafe": [
            Item(name: "Cafeteria", floor: "Ground floor", image: "cafeteria", isReservationEnabled: false, distance: "500m", status: "Busy", time: "7.00am - 6.00pm"),
            Item(name: "Snack Bar", floor: "1st floor", image: "snack_bar", isReservationEnabled: false, distance: "450m", status: "Free", time: "8.00am - 5.00pm"),
            Item(name: "Coffee Corner", floor: "Lobby", image: "coffee_corner", isReservationEnabled: false, distance: "300m", status: "Busy", time: "9.00am - 4.30pm")
        ],
        "Study Area": [
            Item(name: "Study Area", floor: "Ground floor", image: "studyarea", isReservationEnabled: false, distance: "320m", status: "Free", time: "7.00am - 7.00pm"),
            Item(name: "Digital Resources", floor: "2nd floor", image: "digital_library", isReservationEnabled: false, distance: "350m", status: "Busy", time: "8.00am - 6.00pm"),
            Item(name: "Quiet Study Zone", floor: "Top floor", image: "quiet_zone", isReservationEnabled: false, distance: "400m", status: "Free", time: "9.00am - 9.00pm")
        ],
        "Office": [
            Item(name: "Dean's Office", floor: "2nd floor", image: "dean_office", isReservationEnabled: false, distance: "200m", status: "Busy", time: "9.00am - 5.00pm"),
            Item(name: "Finance Office", floor: "1st floor", image: "finance_office", isReservationEnabled: false, distance: "180m", status: "Free", time: "8.30am - 4.30pm"),
            Item(name: "Admissions", floor: "Ground floor", image: "admissions", isReservationEnabled: false, distance: "100m", status: "Busy", time: "9.00am - 3.00pm")
        ],
        "Lecture Halls": [
            Item(name: "Harison Hall", floor: "1st floor", image: "lecture_hall", isReservationEnabled: true, distance: "120m", status: "Free", time: "8.00am - 6.00pm"),
            Item(name: "Hall 202", floor: "2nd floor", image: "lecture_hall", isReservationEnabled: true, distance: "200m", status: "Busy", time: "9.00am - 4.00pm"),
            Item(name: "Hall 303", floor: "3rd floor", image: "lecture_hall", isReservationEnabled: true, distance: "270m", status: "Free", time: "10.00am - 5.00pm")
        ],
        "Library": [
            Item(name: "Main Library", floor: "Ground floor", image: "main_library", isReservationEnabled: false, distance: "320m", status: "Free", time: "7.00am - 7.00pm"),
            Item(name: "Digital Resources", floor: "2nd floor", image: "digital_library", isReservationEnabled: false, distance: "350m", status: "Busy", time: "8.00am - 6.00pm"),
            Item(name: "Quiet Study Zone", floor: "Top floor", image: "quiet_zone", isReservationEnabled: false, distance: "400m", status: "Free", time: "9.00am - 9.00pm")
        ],
        
    ]

    var currentItems: [Item] {
        let items = categoryItems[selectedCategory] ?? []
        return items.filter { searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText) }
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        (
                            Text("Welcome ")
                                .font(.title3)
                                .fontWeight(.medium) +
                            Text("Arosha Ravishan!")
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundColor(Color(hex: "#002D72"))
                        )

                        HStack(spacing: 4) {
                            Image(systemName: "location")
                                .foregroundColor(.gray)
                            Text("Ground Floor")
                                .font(.subheadline)
                        }
                    }
                    Spacer()
                    Image("images (1) 1")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                Spacer()
                
                HStack(spacing: 12) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search by name, type...", text: $searchText)
                            .font(.subheadline)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)

                    Button(action: { showFilterSheet.toggle() }) {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.white)
                            .frame(width: 44, height: 44)
                            .background(Color(hex: "#002D72"))
                            .cornerRadius(12)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 8)
                Spacer()
                Image("Banner")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .padding(.top, 12)
                Spacer()
                HStack {
                    Text("Find Your Location")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 12)
                Spacer()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(categories, id: \.self) { category in
                            Button(action: {
                                selectedCategory = category
                            }) {
                                Text(category)
                                    .font(.subheadline)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(selectedCategory == category ? Color(hex: "#002D72") : .clear)
                                    .foregroundColor(selectedCategory == category ? .white : Color(hex: "#002D72"))
                                    .clipShape(Capsule())
                                    .overlay(
                                        Capsule().stroke(Color(hex: "#002D72"), lineWidth: selectedCategory == category ? 0 : 1)
                                    )
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 8)

                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(currentItems) { item in
                            ItemCardView(item: item)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                }

                Spacer()
                
                BottomNavigationBar(selectedTab: .constant(0))
            }
            .sheet(isPresented: $showFilterSheet) {
                Text("Filter Sheet Placeholder")
                    .presentationDetents([.height(300)])
            }
        }
    }
    

}

struct ItemCardView: View {
    let item: Item
    @State private var navigate = false
    
    private func navigationDestination(for item: Item) -> some View {
        if item.name == "Cafeteria" {
            return AnyView(CafeArenaView())
        }
        if item.name == "Harison Hall" {
            return AnyView(LectureHallDetailsView())
        }
        if item.name == "Study Area" {
            return AnyView(StudyAreaDetailView(item: item))
        }
        else {
            return AnyView(LabDetailsView(item: item))
        }
    }

    var body: some View {
        ZStack {
            NavigationLink(destination: navigationDestination(for: item), isActive: $navigate) {
                EmptyView()
            }.hidden()

            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(color: Color(hex: "#002D72").opacity(0.1), radius: 10, x: 0, y: 4)

            HStack(alignment: .top, spacing: 12) {
                Image(item.image)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)

                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        HStack {
                            Text(item.name)
                                .font(.headline)

                            Text(item.status)
                                .font(.caption2)
                                .foregroundColor(item.status == "Busy" ? .red : .green)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 2)
                                .background((item.status == "Busy" ? Color.red : Color.green).opacity(0.1))
                                .cornerRadius(4)
                        }
                        Spacer()
                        VStack(alignment: .trailing, spacing: 2) {
                            Image(systemName: "square.and.arrow.up")
                                .foregroundColor(.gray)
                        }
                    }

                    HStack {
                        Text(item.floor)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Spacer()
                        VStack(alignment: .trailing, spacing: 2) {
                            Text(item.distance)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }

                    Text("Open from \(item.time)")
                        .font(.caption)
                        .foregroundColor(.gray)

                    HStack {
                        HStack(spacing: 12) {
                            Image("wifi 1").resizable().frame(width: 16, height: 16)
                            Image("freezing 1").resizable().frame(width: 16, height: 16)
                            Image("power-plug 1").resizable().frame(width: 16, height: 16)
                        }
                        Spacer()
                        Button(action: {
                            navigate = true
                        }) {
                            HStack(spacing: 4) {
                                Text("Quick Navigation")
                                    .font(.footnote)
                                    .foregroundColor(Color(hex: "#002D72"))
                                Image("Group 13")
                                    .resizable()
                                    .frame(width: 32, height: 32)
                            }
                        }
                        .padding(.top, 6)
                    }
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
    }
}


// MARK: - Item Model
struct Item: Identifiable {
    let id = UUID()
    let name: String
    let floor: String
    let image: String
    let isReservationEnabled: Bool
    let distance: String
    let status: String
    let time: String
}
