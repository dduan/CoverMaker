import SwiftUI
import ComposableArchitecture

struct MetaConfigView: View {
    let store: Store<MetaConfigState, MetaConfigAction>
    @State var tapped = false
    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack {
                CoverContent0View(cover: viewStore.cover)
                if !viewStore.showCoverOnly {
                    
                    
                    VStack {
                        HStack {
                            Text("Title:")
                            TextField(
                                "Stream Title",
                                text: viewStore.binding(
                                    get: { $0.cover.title },
                                    send: { .updateTitle($0) }
                                )
                            )
                        }
                        
                        HStack {
                            Text("Tags:")
                            TextField(
                                "tags",
                                text: viewStore.binding(
                                    get: { $0.cover.tags.joined(separator: ",") },
                                    send: { .updateTags($0.split(separator: ",").map(String.init)) }
                                )
                            )
                        }
                        
                        VStack {
                            HStack {
                                if viewStore.cover.date != nil {
                                    Text("Date:")
                                    TextField(
                                        "Date",
                                        text: viewStore.binding(
                                            get: { $0.dateString },
                                            send: { .updateDateWithString($0) }
                                        )
                                    )
                                }
                                if viewStore.cover.date == nil {
                                    Spacer()
                                    Text("Include a date")
                                }
                                Toggle(
                                    "",
                                    isOn: viewStore.binding(
                                        get: { $0.cover.date != nil },
                                        send: { .setShowDate($0) }
                                    )
                                )
                            }
                            
                            if viewStore.dateStringIsInvalid {
                                Text("Valid date please!")
                                    .font(.footnote)
                                    .foregroundColor(.red)
                            }
                        }
                        if tapped {
                            Text("Tapped")
                            
                        }
                    }
                    .padding()
                }
            }
            .onTapGesture(count: 2, perform: {
                viewStore.send(.toggleCoverOnly)
            })
        }
    }
}

struct MetaConfigView_Previews: PreviewProvider {
    static var previews: some View {
        MetaConfigView(
            store:.init(
                initialState: .init(
                    cover: Cover(
                        title: "Test Title",
                        date: Date(),
                        tags: ["Swift", "Rust", "Vim"]),
                    dateStringIsInvalid: false,
                    showCoverOnly: false
                ),
                reducer: metaConfigReducer,
                environment: ())
        )
    }
}
