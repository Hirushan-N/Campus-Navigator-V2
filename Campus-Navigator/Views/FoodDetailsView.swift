import SwiftUI

struct FoodDetailView: View {
    @State private var spiceLevel: Double = 0
    @State private var quantity: Int = 2
    @State private var goToCustomize = false

    var body: some View {
        VStack(spacing: 20) {
            Image("bigburger")
                .resizable()
                .scaledToFit()
                .frame(height: 250)
                .padding(.top, 16)

            VStack(alignment: .leading, spacing: 10) {
                Text("Cheeseburger Wendy's Burger")
                    .font(.title3)
                    .fontWeight(.semibold)

                HStack(spacing: 6) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("4.9")
                        .font(.subheadline)
                    Text("– 26 mins")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

                Text("""
                The Cheeseburger Wendy’s Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it’s topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles.
                """)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.top, 8)
            }
            .padding(.horizontal)
            .padding(.top, 20)

            HStack(alignment: .top, spacing: 20) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Spicy")
                        .font(.subheadline)

                    Slider(value: $spiceLevel, in: 0...2, step: 1)
                        .accentColor(Color(hex: "#002D72"))
                        .padding(.trailing, 80)

                    Text(spiceLabel)
                        .font(.caption)
                        .foregroundColor(.green)
                }

                Spacer()

                VStack(alignment: .leading, spacing: 8) {
                    Text("Portion")
                        .font(.subheadline)

                    HStack(spacing: 16) {
                        Button(action: {
                            if quantity > 1 { quantity -= 1 }
                        }) {
                            Image(systemName: "minus")
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30)
                                .background(Color(hex: "#002D72"))
                                .clipShape(Circle())
                        }

                        Text("\(quantity)")
                            .font(.headline)

                        Button(action: {
                            quantity += 1
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30)
                                .background(Color(hex: "#002D72"))
                                .clipShape(Circle())
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 24)

            Spacer()

            HStack(spacing: 16) {
                Text("Rs.750")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 100, height: 45)
                    .background(Color(hex: "#002D72"))
                    .cornerRadius(12)

                Button(action: {
                    goToCustomize = true
                }) {
                    Text("Order Now")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(Color(hex: "#002D72"))
                        .cornerRadius(12)
                        .padding(.leading, 50)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 20)

            NavigationLink(destination: BurgerCustomizationView(), isActive: $goToCustomize) {
                EmptyView()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    private var spiceLabel: String {
        switch spiceLevel {
        case 0: return "Mild"
        case 1: return "Medium"
        default: return "Hot"
        }
    }
}