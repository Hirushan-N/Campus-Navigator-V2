import SwiftUI

struct LectureHallDetailsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Button(action: {
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .padding(8)
                        .background(Color.white)
                        .clipShape(Circle())
                }

                Spacer()

                Text("Harrison Hall")
                    .font(.title2)
                    .fontWeight(.semibold)

                Spacer()

                Button(action: {
                }) {
                    VStack(spacing: 4) {
                        Image(systemName: "location.fill")
                            .foregroundColor(.white)
                        Text("Navigate")
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                    .padding(8)
                    .background(Color(hex: "#002D72"))
                    .cornerRadius(12)
                }
            }
            .padding(.horizontal)

            HStack {
                ForEach(["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"], id: \.self) { day in
                    Text(day)
                        .font(.caption)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color(hex: "#002D72"))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                Spacer()

                Text("ONGOING")
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)

            VStack(alignment: .leading, spacing: 10) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8) {
                        InfoRow(title: "Module", value: "iOS Development")
                        InfoRow(title: "Batch", value: "23.2P Computing")
                        InfoRow(title: "Opening Hours", value: "08:30 AM - 04:00 PM")
                    }

                    Spacer()

                    VStack(alignment: .leading, spacing: 8) {
                        InfoRow(title: "Location", value: "4th Floor")
                        InfoRow(title: "Lecturer", value: "Dr. Thisara Weerasinghe")
                    }
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text("Description:")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("The Harrison Hall is one of the largest and most frequently used lecture halls on campus. It is designed to provide students with a comfortable and well-equipped learning environment for lectures, presentations, and seminars.")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(
                LinearGradient(gradient: Gradient(colors: [Color(hex: "#EBF3FF"), .white]),
                               startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(16)
            .padding(.horizontal)

            VStack(alignment: .leading, spacing: 8) {
                Text("Low")
                    .font(.subheadline)
                    .foregroundColor(.green)

                ProgressView(value: 0.34)
                    .accentColor(.green)

                HStack(spacing: 20) {
                    HStack(spacing: 6) {
                        Image(systemName: "hand.thumbsup.fill")
                            .foregroundColor(.blue)
                        Text("30")
                            .font(.caption)
                    }

                    HStack(spacing: 6) {
                        Image(systemName: "hand.thumbsdown.fill")
                            .foregroundColor(.blue)
                        Text("02")
                            .font(.caption)
                    }
                }
            }
            .padding(.horizontal)

            HStack {
                Text("Student Reviews")
                    .font(.title3)
                    .fontWeight(.semibold)

                Spacer()

                Button(action: {
                }) {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color(hex: "#002D72"))
                        .clipShape(Circle())
                }
            }
            .padding(.horizontal)

            ReviewCard()

            Spacer()

            BottomNavigationBar(selectedTab: .constant(0))
        }
        .padding(.top)
    }
}

// MARK: - Components

struct InfoRow: View {
    var title: String
    var value: String

    var body: some View {
        HStack(alignment: .top) {
            Text("\(title):")
                .font(.subheadline)
                .fontWeight(.semibold)
            Text(value)
                .font(.subheadline)
        }
    }
}

struct ReviewCard: View {
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image("student") // Replace with actual student image
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text("Binusha")
                        .fontWeight(.semibold)
                    Text("· 23.2P")
                        .foregroundColor(.gray)
                    Spacer()
                    Text("1 month ago")
                        .font(.caption)
                        .foregroundColor(.gray)
                }

                Text("I love how organized and comfortable the lecture hall is. There are plenty of charging outlets, and the Wi-Fi is strong.")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color(hex: "#F2F8FF"))
        .cornerRadius(16)
        .padding(.horizontal)
    }
}
