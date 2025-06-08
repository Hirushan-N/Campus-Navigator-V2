import SwiftUI

struct StudyAreaDetailView: View {

    let item: Item
    @Environment(\.presentationMode) var presentationMode 

    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .topLeading) {
                Image(item.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width - 32, height: 500)
                    .clipped()
                    .cornerRadius(20)
                    .padding(.horizontal)
                    .padding(.top, 60)

                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(hex: "#002D72"))
                        .cornerRadius(12)
                        .padding(.leading, 32)
                        .padding(.top, 70)
                }
            }

            VStack(alignment: .leading, spacing: 24) {
                HStack {
                    Text("Study Area")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(hex: "#002D72"))

                    Spacer()

                    HStack(spacing: 16) {
                        Image("wifi 1")
                            .resizable()
                            .frame(width: 16, height: 16)

                        Image("freezing 1")
                            .resizable()
                            .frame(width: 16, height: 16)

                        Image("power-plug 1")
                            .resizable()
                            .frame(width: 16, height: 16)
                    }
                }

                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8) {
                        Group {
                            Text("Location: ")
                                .fontWeight(.semibold) +
                            Text("3rd Floor, Corner Side")
                        }
                        .font(.subheadline)

                        Group {
                            Text("Type: ")
                                .fontWeight(.semibold) +
                            Text("Study Area")
                        }
                        .font(.subheadline)
                    }

                    Spacer()

                    Button(action: {
                    }) {
                        Image("navigateicon")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text("Operating Hours")
                        .font(.subheadline)
                        .fontWeight(.semibold)

                    VStack(alignment: .leading, spacing: 6) {
                        Text("• Monday – Friday: ")
                            .font(.footnote) +
                        Text("8:00 AM – 8:00 PM")
                            .font(.footnote)
                            .fontWeight(.semibold)

                        Text("• Saturday – Sunday: ")
                            .font(.footnote) +
                        Text("9:00 AM – 5:00 PM")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 24)

            Spacer()

            BottomNavigationBar(selectedTab: .constant(0))
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarHidden(true)
    }
}