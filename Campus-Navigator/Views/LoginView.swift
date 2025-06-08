import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var rememberMe = false
    @State private var isSecure = true
    @State private var isActive = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                
                Image("Vector 3")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.50)
                    .clipped()
                    .ignoresSafeArea(edges: .top)

                VStack(alignment: .leading, spacing: 4) {
                    Text("Sign in")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.black)

                    Rectangle()
                        .fill(Color(hex: "#002D72"))
                        .frame(width: 100, height: 2)
                        .padding(.bottom, 20)
                }
                .padding(.horizontal, 24)
                .frame(maxWidth: .infinity, alignment: .leading)

                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Email")
                            .font(.system(size: 14))
                            .foregroundColor(Color(hex: "#615A5A"))
                        HStack {
                            Image(systemName: "envelope")
                                .foregroundColor(Color(hex: "#BDBDBD"))
                            TextField("demo@email.com", text: $email)
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                        }
                        .padding(.vertical, 8)
                        .overlay(Rectangle().frame(height: 1).foregroundColor(Color(hex: "#BDBDBD")), alignment: .bottom)
                    }

                    VStack(alignment: .leading, spacing: 6) {
                        Text("Password")
                            .font(.system(size: 14))
                            .foregroundColor(Color(hex: "#615A5A"))
                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(Color(hex: "#BDBDBD"))
                            if isSecure {
                                SecureField("Enter your password", text: $password)
                            } else {
                                TextField("Enter your password", text: $password)
                            }
                            Button(action: {
                                isSecure.toggle()
                            }) {
                                Image(systemName: isSecure ? "eye.slash" : "eye")
                                    .foregroundColor(Color(hex: "#BDBDBD"))
                            }
                        }
                        .padding(.vertical, 8)
                        .overlay(Rectangle().frame(height: 1).foregroundColor(Color(hex: "#BDBDBD")), alignment: .bottom)
                    }

                    HStack {
                        Toggle(isOn: $rememberMe) {
                            Text("Remember Me")
                                .font(.footnote)
                                .foregroundColor(Color(hex: "#424242"))
                        }
                        .toggleStyle(CheckboxToggleStyle())

                        Spacer()

                        Button("Forgot Password?") {
                        }
                        .font(.footnote)
                        .foregroundColor(Color(hex: "#002D72"))
                    }

                    Button(action: {
                        isActive = true
                    }) {
                        Text("Login")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "#002D72"))
                            .cornerRadius(8)
                    }

                    HStack(spacing: 4) {
                        Text("Don’t have an Account?")
                            .font(.footnote)
                            .foregroundColor(Color(hex: "#615A5A"))

                        Button("Sign up") {
                        }
                        .font(.footnote)
                        .foregroundColor(Color(hex: "#002D72"))
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 4)

                }
                .padding(.horizontal, 24)
                .padding(.top, 8)

                Spacer()
            }
            .ignoresSafeArea()
            .navigationDestination(isPresented: $isActive) {
                HomeView().navigationBarBackButtonHidden(true)
            }
        }
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: { configuration.isOn.toggle() }) {
            HStack(spacing: 6) {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .foregroundColor(configuration.isOn ? Color(hex: "#002D72") : .gray)
                configuration.label
            }
        }
        .buttonStyle(.plain)
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255
        self.init(red: r, green: g, blue: b)
    }
}
