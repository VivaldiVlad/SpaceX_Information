import UIKit

class LoadDataViewController: UIViewController {
    //MARK: - properties
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.pushViewController(MainViewController(), animated: true)
    }
    
    //MARK: - methods
}
