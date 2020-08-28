import ComposableArchitecture

let metaConfigReducer = Reducer<MetaConfigState, MetaConfigAction, Void>
{ state, action, _ in
    switch action {
    case .updateTitle(let title):
        state.cover.title = title
    case .updateTags(let tags):
        state.cover.tags = tags
    case .updateDateWithString(let dateString):
        if let date = Constants.dateFormatter.date(from: dateString) {
            state.cover.date = date
            state.dateStringIsInvalid = false
        } else {
            state.dateStringIsInvalid = true
        }
    case .setShowDate(let show):
        state.cover.date = show ? Date() : nil
    case .toggleCoverOnly:
        state.showCoverOnly.toggle()
    }

    return .none
}
