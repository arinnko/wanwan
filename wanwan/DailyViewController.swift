import Foundation
import UIKit


class DailyViewController: UIViewController{
    
    // TextField
    @IBOutlet weak var weightTextField: UITextField!
    
    // 文字列保存用の変数
    var textFieldString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // ボタン押下時のアクション
    @IBAction func saveButton(_ sender: UIButton) {
        
        // TextFieldから文字を取得
        textFieldString = weightTextField.text!
        print()
        
        // TextFieldの中身をクリア
        weightTextField.text = ""
    }
}

