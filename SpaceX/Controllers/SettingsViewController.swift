import UIKit

class SettingsViewController: UIViewController {
    //MARK: - properties
    private var rocketLaunchData: [RocketLaunchData]?
    
    private let launchSuccessTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    init(rocketLaunchData: [RocketLaunchData]?) {
        self.rocketLaunchData = rocketLaunchData
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        constraintsSetup()
        view.backgroundColor = .black
        tableViewSetup()
    }
    
    //MARK: - methods
    private func addSubview() {
        view.addSubview(launchSuccessTableView)
    }
    
    private func tableViewSetup() {
        launchSuccessTableView.delegate = self
        launchSuccessTableView.dataSource = self
        
        launchSuccessTableView.register(RocketSuccessLaunchTableViewCell.self, forCellReuseIdentifier: RocketSuccessLaunchTableViewCell.identifier)
    }
    
    private func constraintsSetup() {
        NSLayoutConstraint.activate([
            launchSuccessTableView.topAnchor.constraint(equalTo: view.topAnchor),
            launchSuccessTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            launchSuccessTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            launchSuccessTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
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
    }
}
