enum MetaConfigAction {
    case updateTitle(String)
    case updateTags([String])
    case updateDateWithString(String)
    case setShowDate(Bool)
    case toggleCoverOnly
}
