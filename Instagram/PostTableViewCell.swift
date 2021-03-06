import UIKit

class PostTableViewCell: UITableViewCell {

    var viewController: UIViewController!
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var comLabel: UILabel!
    
    var postData: PostData!
    
    @IBAction func commentButton(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let commentView = storyboard.instantiateViewController(withIdentifier: "Comment") as! CommentViewController
        commentView.postData = self.postData
        viewController.present(commentView, animated: true, completion: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setPostData(postData: PostData) {
        self.postData = postData
        self.postImageView.image = postData.image
        
        self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"
        
        let formatter = DateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "jp_JP") as Locale!
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let dateString:String = formatter.string(from: postData.date! as Date)
        self.dateLabel.text = dateString
        
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: UIControlState.normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: UIControlState.normal)
        }
        
        for commentName in postData.commentName {
            var str = self.commentsLabel.text!
            str += "\(commentName)\n"
            commentsLabel.text = str
        }
        
        for comment in postData.comments {
            var str2 = self.comLabel.text!
            str2 += "\(comment)\n"
            comLabel.text = str2
        }

        
        
    }
    
}
