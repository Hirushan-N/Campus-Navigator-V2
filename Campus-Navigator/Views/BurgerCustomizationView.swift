import SwiftUI

struct BurgerCustomizationView: View {
    @State private var spiceLevel: Double = 0.2
    @State private var portionCount: Int = 2
    @State private var selectedToppings: Set<String> = []
    @State private var selectedSides: Set<String> = []
    @State private var navigateToPayment = false

    let toppings = ["Tomato", "Onions", "Pickles", "Bacons"]
    let sideOptions = ["Fries", "Coleslaw", "Salad", "Onion Rings"]

    var totalPrice: Int {
        1500 + (selectedToppings.count + selectedSides.count) * 100
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    HStack(alignment: .top, spacing: 16) {
                        Image("burger_layers")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 160)

                        VStack(alignment: .leading, spacing: 8) {
                            Text("**Customize** Your Burger to Your Tastes. Ultimate Experience")
                                .font(.subheadline)
                                .foregroundColor(.black)

                            Text("Spicy")
                                .font(.subheadline)
                                .fontWeight(.semibold)

                            Slider(value: $spiceLevel, in: 0...1)
                                .accentColor(Color(hex: "#002D72"))

                            HStack {
                                Text("Mild")
                                    .font(.caption)
                                    .foregroundColor(.green)
                                Spacer()
                                Text("Hot")
                                    .font(.caption)
                                    .foregroundColor(.red)
                            }
                            Spacer()
                            HStack {
                                Text("Portion")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)

                                Spacer()

                                HStack(spacing: 20) {
                                    Button(action: {
                                        if portionCount > 1 { portionCount -= 1 }
                                    }) {
                                        Image(systemName: "minus")
                                            .foregroundColor(.white)
                                            .frame(width: 30, height: 30)
                                            .background(Color(hex: "#002D72"))
                                            .clipShape(Circle())
                                    }

                                    Text("\(portionCount)")
                                        .font(.headline)

                                    Button(action: {
                                        portionCount += 1
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
                    }

                    VStack(alignment: .leading, spacing: 18) {
                        Text("Toppings")
                            .font(.headline)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(toppings, id: \.self) { item in
                                    IngredientCard(
                                        label: item,
                                        imageName: imageName(for: item),
                                        isSelected: selectedToppings.contains(item)
                                    ) {
                                        toggleSelection(for: item, in: &selectedToppings)
                                    }
                                }
                            }
                        }
                    }

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Side options")
                            .font(.headline)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(sideOptions, id: \.self) { item in
                                    IngredientCard(
                                        label: item,
                                        imageName: imageName(for: item),
                                        isSelected: selectedSides.contains(item)
                                    ) {
                                        toggleSelection(for: item, in: &selectedSides)
                                    }
                                }
                            }
                        }
                    }

                    HStack {
                        VStack(alignment: .leading) {
                            Text("Total")
                                .font(.caption)
                                .foregroundColor(.gray)
                            Text("Rs.\(totalPrice)")
                                .font(.title2)
                                .fontWeight(.bold)
                        }

                        Spacer()

                        Button(action: {
                            navigateToPayment = true
                        }) {
                            Text("Checkout Now")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.horizontal, 28)
                                .padding(.vertical, 12)
                                .background(Color(hex: "#002D72"))
                                .cornerRadius(12)
                        }
                    }
                    .padding(.top, 8)

                    NavigationLink(destination: PaymentView(), isActive: $navigateToPayment) {
                        EmptyView()
                    }
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private func toggleSelection(for item: String, in set: inout Set<String>) {
        if set.contains(item) {
            set.remove(item)
        } else {
            set.insert(item)
        }
    }

    private func imageName(for item: String) -> String {
        switch item {
        case "Tomato": return "tomato"
        case "Onions": return "onion"
        case "Pickles": return "pickels"
        case "Bacons": return "Bacons"
        case "Fries": return "Fries"
        case "Coleslaw": return "Coleslaw"
        case "Salad": return "Salad"
        case "Onion Rings": return "Onion-rings"
        default: return "placeholder"
        }
    }
}

struct IngredientCard: View {
    var label: String
    var imageName: String
    var isSelected: Bool
    var onTap: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .padding(8)
                .background(Color.white)

            VStack(spacing: 4) {
                Text(label)
                    .font(.caption)
                    .foregroundColor(.white)

                Button(action: onTap) {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .padding(6)
                        .background(Color(hex: "#002D72"))
                        .clipShape(Circle())
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
            .background(Color(hex: "#3A2F2F")) 
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .frame(width: 80)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(isSelected ? Color(hex: "#002D72") : Color.clear, lineWidth: 1)
        )
    }
}