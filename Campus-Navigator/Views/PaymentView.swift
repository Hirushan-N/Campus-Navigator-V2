import SwiftUI

struct PaymentView: View {
    @State private var selectedMethod = "credit"
    @State private var saveCardDetails = true

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 28) {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Order summary")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(hex: "#002D72"))

                        VStack(spacing: 14) {
                            HStack {
                                Text("Order")
                                    .font(.body)
                                Spacer()
                                Text("Rs.1500")
                                    .font(.body)
                            }

                            HStack {
                                Text("Taxes")
                                    .font(.body)
                                Spacer()
                                Text("Rs.0")
                                    .font(.body)
                            }

                            HStack {
                                Text("Delivery fees")
                                    .font(.body)
                                Spacer()
                                Text("Rs.0")
                                    .font(.body)
                            }

                            Divider()

                            HStack {
                                Text("Total:")
                                    .font(.headline)
                                    .foregroundColor(Color(hex: "#002D72"))
                                Spacer()
                                Text("Rs.1800")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(hex: "#002D72"))
                            }

                            HStack {
                                Text("Estimated Prepare time:")
                                    .font(.callout)
                                    .foregroundColor(Color(hex: "#002D72"))
                                Spacer()
                                Text("15 - 30mins")
                                    .font(.callout)
                                    .foregroundColor(Color(hex: "#002D72"))
                            }
                        }
                    }

                    VStack(alignment: .leading, spacing: 18) {
                        Text("Payment methods")
                            .font(.title3)
                            .fontWeight(.semibold)

                        PaymentCardView(
                            brand: "creditcard",
                            type: "Credit card",
                            number: "5105 **** **** 0505",
                            isSelected: selectedMethod == "credit",
                            backgroundColor: Color(hex: "#002D72"),
                            textColor: .white
                        ) {
                            selectedMethod = "credit"
                        }

                        PaymentCardView(
                            brand: "visa",
                            type: "Debit card",
                            number: "3566 **** **** 0505",
                            isSelected: selectedMethod == "debit",
                            backgroundColor: Color.gray.opacity(0.15),
                            textColor: .black
                        ) {
                            selectedMethod = "debit"
                        }

                        Toggle(isOn: $saveCardDetails) {
                            Text("Save card details for future payments")
                                .font(.body)
                        }
                        .toggleStyle(CheckboxToggleStyle())
                        .padding(.top, 6)
                    }
                }
                .padding()
            }

            VStack(spacing: 12) {
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Total price")
                            .font(.callout)
                            .foregroundColor(.gray)

                        Text("Rs.1500")
                            .font(.title2)
                            .fontWeight(.bold)
                    }

                    Spacer()

                    Button(action: {
                    }) {
                        Text("Pay Now")
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 36)
                            .padding(.vertical, 14)
                            .background(Color(hex: "#002D72"))
                            .cornerRadius(12)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 12)
            }
            .background(Color.white)
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    struct CheckboxToggleStyle: ToggleStyle {
        func makeBody(configuration: Configuration) -> some View {
            HStack(spacing: 8) {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .foregroundColor(configuration.isOn ? Color(hex: "#002D72") : .gray)
                    .onTapGesture {
                        configuration.isOn.toggle()
                    }

                configuration.label
            }
        }
    }
}

struct PaymentCardView: View {
    var brand: String
    var type: String
    var number: String
    var isSelected: Bool
    var backgroundColor: Color
    var textColor: Color
    var onTap: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            Image(brand.lowercased())
                .resizable()
                .frame(width: 40, height: 25)

            VStack(alignment: .leading, spacing: 6) {
                Text(type)
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(textColor)

                Text(number)
                    .font(.caption)
                    .foregroundColor(textColor.opacity(0.9))
            }

            Spacer()

            Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
                .foregroundColor(textColor)
        }
        .padding()
        .background(backgroundColor)
        .cornerRadius(12)
        .onTapGesture {
            onTap()
        }
    }
}