import UIKit

class SwiftyPickerViewPopoverViewController: UIViewController {

    weak var mcPicker: SwiftyPickerView?
    internal var safeArea: UIEdgeInsets {
        if #available(iOS 11.0, *) {
            return self.view.safeAreaInsets
        }
        return UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
    }
    internal convenience init(mcPicker: SwiftyPickerView) {
        self.init(nibName: nil, bundle: nil)
        self.mcPicker = mcPicker
    }

    internal required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mcPicker!.sizeViews()
        mcPicker!.addAllSubviews()
        self.view.addSubview(mcPicker!)
        self.preferredContentSize = mcPicker!.popOverContentSize
    }

    override func viewSafeAreaInsetsDidChange() {
        let toolbarHeight = mcPicker?.toolbar.frame.height ?? 0
        let safeAreaToolbarHeight = toolbarHeight + safeArea.top
        mcPicker?.toolbar.frame = CGRect(x: 0, y: 0, width: mcPicker?.toolbar.frame.width ?? 0, height: safeAreaToolbarHeight)
        self.preferredContentSize = CGSize(width: self.preferredContentSize.width, height: self.preferredContentSize.height - safeArea.top)
    }
}
