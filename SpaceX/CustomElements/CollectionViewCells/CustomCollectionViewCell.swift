import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    //MARK: - properties
    static let identifier = "CustomCollectionViewCell"
    
    private let rocketImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        return imageView
    }()
    
    private let rocketInfoTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .black
        tableView.layer.cornerRadius = 20
        tableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return tableView
    }()
    
    //MARK: - override init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        addSubview()
        constraintsSetup()
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - methods
    private func addSubview() {
        contentView.addSubview(rocketImageView)
        contentView.addSubview(rocketInfoTableView)
    }
    
    private func constraintsSetup() {
        NSLayoutConstraint.activate([
            rocketImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            rocketImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            rocketImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            rocketImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            rocketInfoTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            rocketInfoTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            rocketInfoTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            rocketInfoTableView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 3 / 4)
        ])
    }
    
    private func setupTableView() {
        rocketInfoTableView.dataSource = self
        rocketInfoTableView.delegate = self
        
        rocketInfoTableView.register(RocketCharacteristicTableViewCell.self, forCellReuseIdentifier: RocketCharacteristicTableViewCell.identifier)
        rocketInfoTableView.register(RocketInfoTableViewCell.self, forCellReuseIdentifier: RocketInfoTableViewCell.identifier)
    }
}

extension CustomCollectionViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let rocketCharacteristicCell = tableView.dequeueReusableCell(withIdentifier: RocketCharacteristicTableViewCell.identifier, for: indexPath) as? RocketCharacteristicTableViewCell else { return UITableViewCell() }
            
            return rocketCharacteristicCell
            
        case 1:
            guard let rocketInfoCell = tableView.dequeueReusableCell(withIdentifier: RocketInfoTableViewCell.identifier, for: indexPath) as? RocketInfoTableViewCell else { return UITableViewCell() }
        
            return rocketInfoCell
            
        default:
            break
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 200
            
        default:
           return 150
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
}
