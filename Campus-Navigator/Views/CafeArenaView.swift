import SwiftUI

struct CafeArenaView: View {
    @State private var selectedCategory = "Burgers"
    let categories = ["Burgers", "Economic Food", "Hot Food", "Family Food"]
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ZStack(alignment: .topLeading) {
                    Image("cafebanner")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 400)
                        .frame(maxWidth: .infinity)
                        .clipped()
                        .ignoresSafeArea(edges: .top)

                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }) {
                                Image(systemName: "chevron.left")
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color(hex: "#002D72"))
                                    .cornerRadius(12)

                            }
                            Spacer()
                        }
                        .overlay(
                            Text("Cafe Areana")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(Color(hex: "#002D72")),
                            alignment: .center
                        )
                        .padding(.top, 20)


                        Text("Open")
                            .font(.caption)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.green.opacity(0.2))
                            .foregroundColor(.green)
                            .cornerRadius(6)
                            .padding(.top, 10)


                        VStack(alignment: .leading, spacing: 8) {
                            Text("Operating Hours:")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            Text("06:00 AM – 05:00 PM")
                                .font(.subheadline)
                                .foregroundColor(.black)
                                .padding(.bottom, 8)

                            Text("Popular Items:")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            Text("Grilled Sandwiches, Pasta, Fresh Juices")
                                .font(.subheadline)
                                .foregroundColor(.black)
                                .padding(.bottom, 8)

                            Text("Description:")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            Text("The Cafe Lago offers a variety of
fresh and affordable meals, snacks, and beverages for students and
staff.")
                                .font(.subheadline)
                                .foregroundColor(.black.opacity(0.85))
                                .padding(.bottom, 4)
                        }

                    }
                    .padding(.horizontal, 20)
                }

                HStack {
                    Text("Available Dishes")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 0)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(categories, id: \.self) { category in
                            Text(category)
                                .font(.subheadline)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(selectedCategory ==
category ? Color(hex: "#002D72") : Color.gray.opacity(0.2))
                                .foregroundColor(selectedCategory ==
category ? .white : .black)
                                .cornerRadius(20)
                                .onTapGesture {
                                    selectedCategory = category
                                }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top)

                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()),
GridItem(.flexible())], spacing: 20) {
                        ForEach(0..<4) { _ in
                            NavigationLink(destination: FoodDetailView()) {
                                FoodCardView()
                            }
                        }
                    }
                    .padding()
                }

                BottomNavigationBar(selectedTab: .constant(0))
            }
            .navigationBarHidden(true)
        }
    }
}

struct FoodCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Image("burger")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 120)
                .clipped()
                .cornerRadius(12)

            Text("Cheeseburger")
                .font(.headline)

            Text("Wendy’s Burger")
                .font(.subheadline)
                .foregroundColor(.gray)

            HStack {
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.orange)
                        .font(.caption)
                    Text("4.9")
                        .font(.caption)
                }

                Spacer()

                Image(systemName: "heart")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 3)
    }
}