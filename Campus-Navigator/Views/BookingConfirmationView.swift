import SwiftUI

struct BookingConfirmationView: View {
    @Environment(\.dismiss) var dismiss
    @State private var navigateToConfirmation = false

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            Image("done")
                .resizable()
                .scaledToFit()
                .frame(height: 180)

            VStack(spacing: 8) {
                Text("Your booking has been confirmed successfully!")
                    .font(.headline)
                    .multilineTextAlignment(.center)

                Text("Your seat booking has been confirmed successfully. Thank you for choosing us. You will receive a confirmation shortly.")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
            }

            Button(action: {
                navigateToConfirmation = true
            }) {
                Text("Back to Home Page")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .background(Color(hex: "#002D72"))
                    .cornerRadius(12)
                    .padding(.horizontal, 24)
            }

            Spacer()
            
            NavigationLink(
                destination: HomeView(),
                isActive: $navigateToConfirmation
            ) {
                EmptyView()
            }
            .hidden()
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}