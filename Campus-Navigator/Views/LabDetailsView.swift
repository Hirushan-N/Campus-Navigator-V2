import SwiftUI

struct LabDetailsView: View {
    let item: Item
    @State private var navigateToReserve = false
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

            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .top) {
                    Text(item.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(hex: "#002D72"))

                    Spacer()

                    HStack(spacing: 12) {
                        Image("wifi 1").resizable().frame(width: 16, height: 16)
                        Image("freezing 1").resizable().frame(width: 16, height: 16)
                        Image("power-plug 1").resizable().frame(width: 16, height: 16)
                    }
                }

                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4) {
                        Group {
                            Text("Accommodation: ")
                                .fontWeight(.semibold) +
                            Text("5–15 people")
                        }
                        .font(.subheadline)

                        Group {
                            Text("Floor: ")
                                .fontWeight(.semibold) +
                            Text(item.floor)
                        }
                        .font(.subheadline)

                        Group {
                            Text("Type: ")
                                .fontWeight(.semibold) +
                            Text("Labs")
                        }
                        .font(.subheadline)
                    }

                    Spacer()

                    Button(action: {
                        NavigationMapView()
                    }) {
                        VStack(spacing: 4) {
                            Image("navigateicon")
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                    }
                }

                Text("The iOS Lab is a dedicated workspace for students to develop and test iOS tools like Xcode.")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.top, 4)

                Button(action: {
                    navigateToReserve = true
                }) {
                    HStack {
                        Spacer()
                        Text("Reserve Lab Seat")
                            .foregroundColor(.white)
                        Image("arrow-white")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Spacer()
                    }
                    .padding()
                    .background(Color(hex: "#002D72"))
                    .cornerRadius(10)
                }
                .padding(.top, 12)

                NavigationLink(destination: ReserveSeatView(), isActive: $navigateToReserve) {
                    EmptyView()
                }
                .hidden()
            }
            .padding(.horizontal)
            .padding(.top, 12)

            Spacer()

            BottomNavigationBar(selectedTab: .constant(0))
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarHidden(true)
    }
}
