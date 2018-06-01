import UIKit
import Foundation

@IBDesignable class LoadingXibView: BaseXibView {
    
    @IBOutlet weak var acitivityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var activityDescriptionLabel: UILabel!
    private var parentView: UIView?
    
    @IBOutlet weak var backdropImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        super.xibSetup()
    }
    
    init(parentView: UIView, frame: CGRect) {
        if(frame.size.height > 570 || frame.size.height < 500) {
            super.init(frame: frame)
        } else {
            let frameLow = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
            super.init(frame: frameLow)
        }
        
        self.parentView = parentView
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func show(message: String,hasBg: Bool) {
        self.backdropImage.isHidden = false
        self.activityDescriptionLabel.text = message
        if hasBg {
            self.activityDescriptionLabel.textColor = UIColor.white
            self.acitivityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.white
        } else {
            self.backdropImage.isHidden = true
            self.acitivityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
            self.activityDescriptionLabel.textColor = UIColor.lightGray
        }
        self.parentView?.addSubview(self)
        self.acitivityIndicatorView?.startAnimating()
    }
    
    func hide() {
        self.acitivityIndicatorView?.stopAnimating()
        self.removeFromSuperview()
    }
    
}


