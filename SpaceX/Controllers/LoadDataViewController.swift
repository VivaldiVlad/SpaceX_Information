import UIKit

class LoadDataViewController: UIViewController {
    //MARK: - properties
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let mainVC = MainViewController()
        present(mainVC, animated: true, completion: nil)
    }
    
    //MARK: - methods
}
