import SwiftUI

struct NavigationMapView: View {
    @State private var selectedTab = 1
    @State private var showDrawer = false

    var body: some View {
        ZStack {
            Image("Map")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                HStack {
                    HStack(spacing: 8) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search by name, type...", text: .constant(""))
                            .foregroundColor(.black)
                    }
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color.white)
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                    )

                    Button(action: {
                    }) {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.white)
                            .frame(width: 44, height: 44)
                            .background(Color(hex: "#002D72"))
                            .cornerRadius(12)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 60)

                Spacer()

                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Your Location : IOS Lab")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .font(.subheadline)

                            Text("8 min (250 m)")
                                .foregroundColor(.white.opacity(0.8))
                                .font(.caption)
                        }

                        Spacer()

                        Button(action: {
                            withAnimation(.easeInOut) {
                                showDrawer.toggle()
                            }
                        }) {
                            HStack(spacing: 4) {
                                Text("Start Now")
                                    .foregroundColor(.white)
                                    .font(.body)
                                    .fontWeight(.semibold)

                                Image("arrow-white")
                                    .resizable()
                                    .frame(width: 16, height: 16)
                            }
                        }
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity)
                .background(Color(hex: "#002D72"))
                .cornerRadius(20)
                .padding(.horizontal)
                .padding(.bottom, 80)

                BottomNavigationBar(selectedTab: $selectedTab)
            }

            VStack {
                Spacer()
                if showDrawer {
                    BottomDrawerView()
                        .frame(maxHeight: .infinity, alignment: .bottom) // 👈 Fix to bottom
                        .transition(.move(edge: .bottom))
                        .animation(.easeInOut, value: showDrawer)
                }
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

// MARK: - Drawer View
struct BottomDrawerView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            RoundedRectangle(cornerRadius: 3)
                .frame(width: 40, height: 5)
                .foregroundColor(.gray.opacity(0.3))
                .frame(maxWidth: .infinity, alignment: .center)

            Image("mapdata")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            Text("")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.horizontal)

            VStack(alignment: .leading, spacing: 12) {
                DrawerStepView(step: "Enter the Elevator or take steps", distance: "50 m", isCompleted: true)
                DrawerStepView(step: "Press 3 / go the 3rd floor", distance: "50 m", isCompleted: true)
                DrawerStepView(step: "Turn right and straight Hall 306", distance: "50 m", isCompleted: false)
            }
            .padding(.horizontal)

            HStack(alignment: .top, spacing: 12) {
                VStack(spacing: 12) {
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 32, height: 32)
                        .overlay(
                            Image(systemName: "circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.black)
                        )

                    Rectangle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(width: 1, height: 20)
                        .overlay(
                            VStack {
                                ForEach(0..<3) { _ in
                                    Circle()
                                        .fill(Color.gray)
                                        .frame(width: 2, height: 2)
                                    Spacer(minLength: 1)
                                }
                            }
                        )

                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 32, height: 32)
                        .overlay(
                            Image(systemName: "mappin")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.black)
                        )
                }

                VStack(spacing: 12) {
                    Text("Ground Floor")
                        .font(.subheadline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 10)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                        .cornerRadius(20)

                    Text("IOS Lab")
                        .font(.subheadline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 10)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                        .cornerRadius(20)
                }
            }
            .padding(.horizontal)


            Spacer()
        }
        .padding(.top)
        .padding(.bottom, 24)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
        .frame(height: 400)
    }
}

// MARK: - Step Item
struct DrawerStepView: View {
    var step: String
    var distance: String
    var isCompleted: Bool

    var body: some View {
        HStack {
            Image("location")
                .resizable()
                .frame(width: 18, height: 18)

            Text(step)
                .font(.subheadline)

            Spacer()

            Text(distance)
                .font(.caption)
                .foregroundColor(.gray)

            if isCompleted {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
            }
        }
    }
}


// MARK: - Location Box
struct DrawerLocationBox: View {
    var icon: String
    var label: String

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .foregroundColor(.white)
                .padding(6)
                .background(Color.black)
                .clipShape(Circle())

            Text(label)
                .font(.subheadline)
        }
        .padding(8)
        .background(Color.white)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
    }
}