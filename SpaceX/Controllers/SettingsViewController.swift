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
    
<<<<<<< Updated upstream
    private let settingLabel: UILabel = {
        let label = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: 176, height: 24)))
        label.text = "Высота"
        label.textColor = .white
=======
    private let dismissButton: UIButton = {
        let button = UIButton()
        let configuration = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
        button.setImage(UIImage(systemName: "x.circle", withConfiguration: configuration), for: .normal)
        button.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .red
        return button
    }()
    
    init(rocketLaunchData: [RocketLaunchData]?) {
        self.rocketLaunchData = rocketLaunchData
>>>>>>> Stashed changes
        
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
        view.backgroundColor = .black
        addSubview()
        constraintsSetup()
<<<<<<< Updated upstream
=======
        tableViewSetup()
>>>>>>> Stashed changes
    }
    
    //MARK: - methods
    private func addSubview() {
<<<<<<< Updated upstream
        view.addSubview(titleLabel)
        view.addSubview(backButton)
        view.addSubview(settingLabel)
        view.addSubview(segmentControll)
    }
    
    private func constraintsSetup() {
=======
        view.addSubview(launchSuccessTableView)
        view.addSubview(dismissButton)
    }
    
    private func tableViewSetup() {
        launchSuccessTableView.delegate = self
        launchSuccessTableView.dataSource = self
        
        launchSuccessTableView.register(RocketSuccessLaunchTableViewCell.self, forCellReuseIdentifier: RocketSuccessLaunchTableViewCell.identifier)
    }
    
    private func constraintsSetup() {
        NSLayoutConstraint.activate([
            launchSuccessTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            launchSuccessTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            launchSuccessTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            launchSuccessTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            dismissButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            dismissButton.bottomAnchor.constraint(equalTo: launchSuccessTableView.topAnchor, constant: -10),
            dismissButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func dismissButtonTapped() {
        dismiss(animated: true)
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return rocketLaunchData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RocketSuccessLaunchTableViewCell.identifier, for: indexPath) as? RocketSuccessLaunchTableViewCell else { return UITableViewCell() }
        
        guard let rocketLaunchData = rocketLaunchData else { return UITableViewCell() }
        
        cell.rocketLaunchConfigure(with: rocketLaunchData[indexPath.section])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
>>>>>>> Stashed changes
    }
}
