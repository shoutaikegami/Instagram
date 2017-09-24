import UIKit

class CommentViewController: UIViewController {

    @IBOutlet weak var commentTextField: UITextField!

    @IBAction func commentButton(_ sender: Any) {
    }
    @IBAction func cancelButton(_ sender: Any) {
        // 画面を閉じる
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
