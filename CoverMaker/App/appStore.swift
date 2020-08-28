import ComposableArchitecture

let appStore = Store<AppState, AppAction>(
    initialState: .init(metaConfigState: MetaConfigState()),
    reducer: appReducer,
    environment: ()
)
