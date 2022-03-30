import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    //MARK: - properties
    static let identifier = "CustomCollectionViewCell"
    
    private let rocketImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "mainRocket")
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
        rocketInfoTableView.register(FirstStepTableViewCell.self, forCellReuseIdentifier: FirstStepTableViewCell.identifier)
        rocketInfoTableView.register(SecondStepTableViewCell.self, forCellReuseIdentifier: SecondStepTableViewCell.identifier)
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
            
        case 2:
            guard let firstStepCell = tableView.dequeueReusableCell(withIdentifier: FirstStepTableViewCell.identifier, for: indexPath) as? FirstStepTableViewCell else { return UITableViewCell() }
            return firstStepCell
            
        case 3:
            guard let secondStepCell = tableView.dequeueReusableCell(withIdentifier: SecondStepTableViewCell.identifier, for: indexPath) as? SecondStepTableViewCell else { return UITableViewCell() }
            return secondStepCell
            
        default:
            break
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 150
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        let headLabel = UILabel(frame: CGRect(x: 10, y: 0, width: headerView.frame.width , height: headerView.frame.height))
        headLabel.textAlignment = .left
        headLabel.textColor = .white
        
        switch section {
        case 2:
            headLabel.font = UIFont.systemFont(ofSize: 20)
            headLabel.text = "Первая ступень"
            
        case 3:
            headLabel.font = UIFont.systemFont(ofSize: 20)
            headLabel.text = "Вторая ступень"
            
        default:
            break
        }
        
        headerView.addSubview(headLabel)
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}
