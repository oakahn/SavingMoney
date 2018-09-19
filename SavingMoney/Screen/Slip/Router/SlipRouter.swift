import UIKit

protocol SlipRouterProtocol {
    func redirectToMainPage()
}

class SlipRouter: BaseRouter, SlipRouterProtocol {
    func redirectToMainPage() {
        self.returnTo(viewController: StartApp.self)
    }
}
