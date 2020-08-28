import Foundation

struct MetaConfigState: Equatable {
    var cover: Cover = .init(title: "Cover Title", date: Date(), tags: [])
    var dateStringIsInvalid: Bool = false
    var showCoverOnly: Bool = false
    var dateString: String {
        cover.date.map(Constants.dateFormatter.string(from:)) ?? ""
    }
}
