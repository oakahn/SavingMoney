import UIKit

protocol SlipVCProtocol: BaseVCProtocol {
    func goToMainPage()
}

class SlipVC: BaseVC {
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var feeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imageType: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    var models: SlipModel?
    var lines: SetLineStruct?
    lazy var router = SlipRouter(self)
    lazy var presenter = SlipPresenter(self)
    
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
    
    @IBAction func goTomainPage(_ sender: Any) {
        presenter.notifyLine(lines ?? SetLineStruct(message: "test",
                                                    stickerId: "1",
                                                    stickerPackageId: "1"))
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
    func goToMainPage() {
        router.redirectToMainPage()
    }
}
