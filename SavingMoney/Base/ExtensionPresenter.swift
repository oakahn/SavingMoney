import UIKit

struct ExtensionPresenter {
    func cutDateTime(date: String) -> [String] {
        let date: [String] = date.components(separatedBy: " ")
        return [date[0], date[1]]
    }
}
