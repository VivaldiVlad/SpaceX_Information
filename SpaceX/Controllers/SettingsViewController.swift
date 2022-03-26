import UIKit

class SettingsViewController: UIViewController {
    //MARK: - properties
    private let titleLabel: UILabel = {
        let titleLabel = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: 80, height: 22)))
        titleLabel.text = "Настройки"
        titleLabel.textColor = .white
        
        return titleLabel
    }()
    
    private let backButton: UIButton = {
        let button = UIButton(frame: CGRect(origin: .zero, size: CGSize(width: 67, height: 22)))
        button.setTitle("Назад", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let settingLabel: UILabel = {
        let label = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: 176, height: 24)))
        label.text = "Высота"
        label.textColor = .white
        
        return label
    }()
    
    private let segmentControll: UISegmentedControl = {
        let segmentControll = UISegmentedControl(items: ["m", "ft"])
        segmentControll.frame = CGRect(origin: .zero, size: CGSize(width: 115, height: 40))
        segmentControll.tintColor = UIColor.black
        segmentControll.backgroundColor = UIColor.white
        segmentControll.selectedSegmentIndex = 1
        
        return segmentControll
    }()
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        constraintsSetup()
    }
    
    //MARK: - methods
    private func addSubview() {
        view.addSubview(titleLabel)
        view.addSubview(backButton)
        view.addSubview(settingLabel)
        view.addSubview(segmentControll)
    }
    
    private func constraintsSetup() {
    }
}
