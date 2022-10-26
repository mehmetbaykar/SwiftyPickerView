
import UIKit

open class SwiftyPickerViewBarButtonItem: UIBarButtonItem {

    /**
        A bar button to close McPicker with selections.
     
        - parameter mcPicker: Target instance
        - parameter title: Optionally set a custom title
        - parameter barButtonSystemItem: Optionally set UIBarButtonSystemItem or omit for default: .done. NOTE: This option is ignored when title is non-nil.
     
        - returns: McPickerBarButtonItem
     */
    public class func done(mcPicker: SwiftyPickerView, title: String? = nil, barButtonSystemItem: UIBarButtonItem.SystemItem = .done) -> SwiftyPickerViewBarButtonItem {

        if let buttonTitle = title {
            return self.init(title: buttonTitle, style: .plain, target: mcPicker, action: #selector(SwiftyPickerView.done))
        }
        return self.init(barButtonSystemItem: barButtonSystemItem, target: mcPicker, action: #selector(SwiftyPickerView.done))
    }

    /**
         A bar button to close McPicker with out selections.
         
         - parameter mcPicker: Target instance
         - parameter title: Optionally set a custom title
         - parameter barButtonSystemItem: Optionally set UIBarButtonSystemItem or omit for default: .done. NOTE: This option is ignored when title is non-nil.
         
         - returns: McPickerBarButtonItem
     */
    public class func cancel(mcPicker: SwiftyPickerView, title: String? = nil, barButtonSystemItem: UIBarButtonItem.SystemItem = .cancel) -> SwiftyPickerViewBarButtonItem {

        if let buttonTitle = title {
            return self.init(title: buttonTitle, style: .plain, target: mcPicker, action: #selector(SwiftyPickerView.cancel))
        }
        return self.init(barButtonSystemItem: barButtonSystemItem, target: mcPicker, action: #selector(SwiftyPickerView.cancel))
    }

    public override class func flexibleSpace() -> Self {
        return self.init(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    }

    public class func fixedSpace(width: CGFloat) -> SwiftyPickerViewBarButtonItem {
        let fixedSpace =  self.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        fixedSpace.width = width
        return fixedSpace
    }
}
