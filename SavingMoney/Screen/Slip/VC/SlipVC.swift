import UIKit

protocol SlipVCProtocol: BaseVCProtocol {
    
}

class SlipVC: BaseVC {
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var feeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imageType: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    var models: SlipModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(models)
        setup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        isHideTitle = true
    }
    
    func setup() {
        amountLabel.text = models?.amount
        feeLabel.text = models?.fee
        dateLabel.text = models?.date
        imageType.image = UIImage(named: models?.image ?? "")
        headerLabel.text = models?.headerLabel
    }
}

extension SlipVC: SlipVCProtocol {
    
}
