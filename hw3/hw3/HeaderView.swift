import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                HStack(spacing: 70){
                    titleComponent(logoimg: "food", text: "Uber Eats")
                    titleComponent(logoimg: "car", text: "搭乘")
                }
            }
            
            HStack{
                    HStack(spacing: 4) {
                        Text("羅斯福路1號")
                            .font(.subheadline)
                            .lineLimit(1)
                            .padding(.leading, 16)
                        Image(systemName: "chevron.down")
                            .font(.caption)
                            .frame(width: 20, height: 20)
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 16) {
                        Button(action: {
                        }) {
                            Image(systemName: "bell")
                                .foregroundColor(Color(.label))
                        }
                        Spacer().frame(width: 1)
                        Button(action: {
                        }) {
                            Image(systemName: "cart")
                                .foregroundColor(Color(.label))
                        }
                    }
                    .padding(.trailing, 30)

                }
            // SearchBar
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                Text("搜尋 Uber Eats")
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding(15)
            .background(Color(.systemGray6))
            .cornerRadius(20)
            .frame(width: 380)
            }
            

    }
}

struct titleComponent: View {
    let logoimg: String
    let text: String
    
    var body: some View {
        HStack(spacing: 20){
            Image(logoimg)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(.brown)
            
            Text(text)
                .font(.title2)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
