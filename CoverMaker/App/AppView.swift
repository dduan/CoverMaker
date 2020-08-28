import SwiftUI

struct AppView: View {
    let store = appStore
    var body: some View {
        MetaConfigView(
            store: store.scope(
                state: { $0.metaConfigState },
                action: { .metaConfig($0) }
            )
        )
    }
}


struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
