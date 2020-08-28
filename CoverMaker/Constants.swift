import AppKit

enum Constants {
    static let dateFormatter: DateFormatter = {
        var formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()

    static let defaultWindowStyle: NSWindow.StyleMask = [.titled, .closable, .miniaturizable, .fullSizeContentView]
    static let coverOnlyWindowStyle: NSWindow.StyleMask = [.borderless]
}
