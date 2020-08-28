import SwiftUI
import AppKit

struct CoverContent0View: View {
    let cover: Cover
    var body: some View {
        VStack {
            HStack {
                Text("Live Coding")
                if cover.date != nil {
                    Text("·")
                    Text(Constants.dateFormatter.string(from: cover.date!))
                }
            }
            .font(.custom("SF Pro Display", size: 35))

            Text(cover.title)
                .font(.custom("SF Pro Display", size: 60))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 25)
                .fixedSize(horizontal: false, vertical: true)
                .minimumScaleFactor(0.5)
            HStack {
                ForEach(cover.tags.filter { NSImage(named: $0) != nil }, id: \.self) { tag in
                    Image(tag)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 100)
                }
            }
        }
        .padding(30)
        .frame(width: 640, height: 360)
        .fixedSize(horizontal: true, vertical: true)
        .foregroundColor(Color.black)
        .background(Color.white)
    }

}

struct CoverContent0View_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoverContent0View(cover: .init(title: "Test String", date: nil, tags: ["Swift", "Xcode", "macOS"]))
            CoverContent0View(cover: .init(title: "Another slightly longer title heheee", date: Date(), tags: ["Linux", "Vim", "Does not exist", "Rust"]))
        }
    }
}
