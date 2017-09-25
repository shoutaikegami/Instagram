import UIKit
import Firebase
import FirebaseDatabase
import SVProgressHUD

class CommentViewController: UIViewController {

    @IBOutlet weak var commentTextField: UITextField!
    var postData: PostData!
    
    // コメントボタンをタップした時の処理
    @IBAction func commentButton(_ sender: Any) {
        
        let commentName = Auth.auth().currentUser?.displayName
        
        postData.comments.append(commentTextField.text!)
        
        postData.commentName.append(commentName!)
        
        // commentsをFirebaseに保存する
        let postRef = Database.database().reference().child(Const.PostPath).child(postData.id!)
        let commentData = ["comments": postData.comments, "commentName": postData.commentName]
        postRef.updateChildValues(commentData)
        
        // HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "コメントしました")
        
        // 全てのモーダルを閉じる
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    // キャンセルボタンをタップした時の処理
    @IBAction func cancelButton(_ sender: Any) {
        // 画面を閉じる
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
