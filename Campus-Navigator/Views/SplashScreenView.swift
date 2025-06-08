import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {

                Image("Vector 3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .ignoresSafeArea(edges: .top)

                VStack(alignment: .leading, spacing: 20) {

                    VStack(alignment: .leading, spacing: 4) {
                        Text("Campus Navigator")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(Color(red: 0.01, green: 0.22, blue: 0.46))

                        Image("Line 22")
                            .resizable()
                            .frame(width: 160, height: 6)
                    }

                    Text("Welcome")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(.black)

                    Text("Lorem ipsum dolor sit amet consectetur.\nLorem id sit “Find Exact Location of your choice”")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                        .fixedSize(horizontal: false, vertical: true)

                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .padding(.top, 16)

                Spacer()

                HStack {
                    Spacer()
                    Button(action: {
                        isActive = true
                    }) {
                        HStack(spacing: 6) {
                            Text("Continue")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(Color(red: 0.01, green: 0.22, blue: 0.46))

                            Image("Group 13")
                                .resizable()
                                .frame(width: 32, height: 32)
                        }
                    }
                    .padding(.bottom, 30)
                    .padding(.trailing, 24)
                }
            }
            .ignoresSafeArea()
            .navigationDestination(isPresented: $isActive) {
                LoginView().navigationBarBackButtonHidden(true)
            }
        }
    }
}
