
import UIKit

open class SwiftyPickerViewTextField: UITextField {

    public var doneHandler: SwiftyPickerView.DoneHandler = { _ in }
    public var cancelHandler: SwiftyPickerView.CancelHandler?
    public var selectionChangedHandler: SwiftyPickerView.SelectionChangedHandler?
    public var textFieldWillBeginEditingHandler: ((_ selections: [Int:String]) -> Void)?

    public var inputViewMcPicker: SwiftyPickerView? {
        didSet {
            self.delegate = inputViewMcPicker
        }
    }
}
