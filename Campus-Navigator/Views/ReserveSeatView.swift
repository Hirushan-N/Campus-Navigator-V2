import SwiftUI

struct ReserveSeatView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedTab = "Various"
    @State private var entryTime = Date()
    @State private var exitTime = Date().addingTimeInterval(3600)
    @State private var selectedSeat: String? = nil
    @State private var showDrawer = false
    @State private var navigateToConfirmation = false

    @State private var entryHour: Int = 9
    @State private var entryMinute: Int = 30
    @State private var exitHour: Int = 10
    @State private var exitMinute: Int = 30

    let dateTabs = ["Today", "Tomorrow", "Various"]

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
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
                            Text("Reserve My Seat")
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(Color(hex: "#002D72")),
                            alignment: .center
                        )
                        .padding(.top, 20)

                        HStack(spacing: 12) {
                            ForEach(dateTabs, id: \.self) { tab in
                                Text(tab)
                                    .font(.subheadline)
                                    .foregroundColor(selectedTab == tab ? .white : Color(hex: "#1D3599"))
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(
                                        selectedTab == "Various" && tab == "Various"
                                            ? Color.red
                                            : (selectedTab == tab
                                                ? Color(hex: "#002D72")
                                                : Color.white)
                                    )
                                    .cornerRadius(20)
                                    .onTapGesture {
                                        selectedTab = tab
                                    }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .center)

                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Text("Choose Date and Time")
                                    .font(.system(size: 18, weight: .semibold))
                                Spacer()
                                Label("Evening Session", systemImage: "circle.fill")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }

                            VStack(spacing: 16) {
                                DatePicker("", selection: $entryTime, displayedComponents: .date)
                                    .datePickerStyle(GraphicalDatePickerStyle())
                                    .background(Color.white)
                                    .cornerRadius(12)
                                    .padding(.horizontal, 8)

                                HStack(spacing: 20) {
                                    TimePicker(label: "ENTRY TIME", hour: $entryHour, minute: $entryMinute)
                                    TimePicker(label: "EXIT TIME", hour: $exitHour, minute: $exitMinute)
                                }
                                .padding(.horizontal)
                            }
                            .padding()
                            .background(Color(hex: "#D4E8FC"))
                            .cornerRadius(20)
                        }

                        VStack(alignment: .leading, spacing: 12) {
                            Text("Choose Seating")
                                .font(.system(size: 18, weight: .semibold))

                            Image("booking")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: .infinity, minHeight: 300, maxHeight: 300)
                                .clipped()
                                .cornerRadius(20)

                            Image("class")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: .infinity, minHeight: 300, maxHeight: 300)
                                .clipped()
                                .cornerRadius(20)
                        }

                        Button(action: {
                            withAnimation {
                                showDrawer = true
                            }
                        }) {
                            HStack {
                                Spacer()
                                Text("Done")
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
                    }
                    .padding(.bottom, showDrawer ? 280 : 100)
                    .padding(.horizontal)
                }

                BottomNavigationBar(selectedTab: .constant(0))
            }

            if showDrawer {
                VStack(spacing: 16) {
                    RoundedRectangle(cornerRadius: 3)
                        .frame(width: 40, height: 5)
                        .foregroundColor(.gray.opacity(0.4))
                        .padding(.top, 8)

                    VStack(alignment: .leading, spacing: 12) {
                        Text("Student Name & Batch")
                            .font(.subheadline)
                            .fontWeight(.semibold)

                        Text("Nadeesha Hirushan - 23.2P")
                            .font(.subheadline)

                        Text("Seat Information")
                            .font(.subheadline)
                            .fontWeight(.semibold)

                        Text("Selected Seat Number: ")
                            .font(.subheadline) +
                        Text("06").bold()

                        Text("Row & Column Position: ")
                            .font(.subheadline) +
                        Text("Row 1, Table 06").bold()

                        Text("Booking Status: ")
                            .font(.subheadline) +
                        Text("Available").bold()
                    }

                    Button(action: {
                        withAnimation {
                            showDrawer = false
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            navigateToConfirmation = true
                        }
                    }) {
                        HStack {
                            Spacer()
                            Text("Book Seat")
                                .foregroundColor(.white)
                            Image(systemName: "arrow.right.circle.fill")
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding()
                        .background(Color(hex: "#002D72"))
                        .cornerRadius(10)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 10)

                .transition(.move(edge: .bottom))
                .zIndex(1)
            }

            NavigationLink(
                destination: BookingConfirmationView(),
                isActive: $navigateToConfirmation
            ) {
                EmptyView()
            }
            .hidden()
        }
        .navigationBarBackButtonHidden(true)
    }

    var computedEntryTime: Date {
        Calendar.current.date(bySettingHour: entryHour, minute: entryMinute, second: 0, of: entryTime) ?? entryTime
    }

    var computedExitTime: Date {
        Calendar.current.date(bySettingHour: exitHour, minute: exitMinute, second: 0, of: entryTime) ?? exitTime
    }
}

struct TimePicker: View {
    var label: String
    @Binding var hour: Int
    @Binding var minute: Int

    var body: some View {
        VStack(spacing: 6) {
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)

            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
                    .shadow(color: .gray.opacity(0.1), radius: 4, x: 0, y: 2)

                HStack(spacing: 10) {
                    Picker("Hours", selection: $hour) {
                        ForEach(0..<24) { Text("\($0)").tag($0) }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 60, height: 90)
                    .clipped()

                    Picker("Minutes", selection: $minute) {
                        ForEach(0..<60) { Text(String(format: "%02d", $0)).tag($0) }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 60, height: 90)
                    .clipped()
                }
                .padding(.horizontal, 10)
            }
            .frame(width: 150, height: 110)
        }
    }
}