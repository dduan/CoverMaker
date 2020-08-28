import ComposableArchitecture
import AppKit

let appReducer = Reducer<AppState, AppAction, Void>
    .combine(
        metaConfigReducer
            .pullback(
                state: \AppState.metaConfigState,
                action: /AppAction.metaConfig,
                environment: {}
            ),
        .init { state, action, _ in
            switch action {
            case .metaConfig(.toggleCoverOnly):
                let showCoverOnly = state.metaConfigState.showCoverOnly
                return .fireAndForget {
                    NSApplication.shared.mainWindow?.styleMask = showCoverOnly
                        ? Constants.coverOnlyWindowStyle
                        : Constants.defaultWindowStyle
                    NSApplication.shared.mainWindow?.hasShadow = !showCoverOnly
                }
            default:
                break
            }

            return .none
        }
    )
