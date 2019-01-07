import Foundation
import Alamofire

protocol SlipPresenterProtocol {
    func notifyLine(_ setLineStruct: SetLineStruct)
}

class SlipPresenter {
    var view: SlipVCProtocol?
    
    init(_ view: SlipVCProtocol) {
        self.view = view
    }
}

extension SlipPresenter: SlipPresenterProtocol {
    func notifyLine(_ setLineStruct: SetLineStruct) {
        
        guard let message = setLineStruct.message,
            let stickerId = setLineStruct.stickerId,
            let stickerPackage = setLineStruct.stickerPackageId else {
                return
        }
        
        let urlCompare = "https://notify-api.line.me/api/notify"
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": "Bearer ksSm9CrtDKA28ZvkMXjJsjbrAZFlO7lphvi0QBcqVBm"
        ]
        
        let parameters: Parameters = [
            "message": message,
            "stickerId": stickerId,
            "stickerPackageId": stickerPackage
        ]
        
        Alamofire.request(urlCompare, method: .post, parameters: parameters, encoding: URLEncoding.queryString, headers: headers).responseJSON { (res) in
            self.view?.goToMainPage()
        }
    }
}
