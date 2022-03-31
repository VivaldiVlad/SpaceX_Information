import UIKit

protocol RocketCharacteristicTableViewCellDelegate: AnyObject {
    func presentSettingViewController()
}

class RocketCharacteristicTableViewCell: UITableViewCell {
    //MARK: - properties
    static let identifier = "RocketCharacteristicTableViewCell"
    
    weak var delegate: RocketCharacteristicTableViewCellDelegate?
    
    private let characteristicCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private let rocketNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    private let presentSettingsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        let configuration = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
        button.setImage(UIImage(systemName: "gearshape", withConfiguration: configuration), for: .normal)
        button.addTarget(self, action: #selector(sendDelegate), for: .touchUpInside)
        button.alpha = 0.7
        return button
    }()
    
    //MARK: - override init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        addSubview()
        constraintsSetup()
        collectionViewSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func collectionViewSetup() {
        characteristicCollectionView.delegate = self
        characteristicCollectionView.dataSource = self
        self.backgroundColor = .clear
        
        characteristicCollectionView.register(RocketCharacteristicCollectionViewCell.self, forCellWithReuseIdentifier: RocketCharacteristicCollectionViewCell.identifier)
    }
    
    //MARK: - methods
    private func addSubview() {
        contentView.addSubview(rocketNameLabel)
        contentView.addSubview(presentSettingsButton)
        contentView.addSubview(characteristicCollectionView)
    }
    
    private func constraintsSetup() {
        NSLayoutConstraint.activate([
            
            rocketNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            rocketNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            rocketNameLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1 / 4),
            rocketNameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1 / 2)
        ])
        
        NSLayoutConstraint.activate([
            presentSettingsButton.topAnchor.constraint(equalTo: rocketNameLabel.topAnchor),
            presentSettingsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            presentSettingsButton.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1 / 4),
            presentSettingsButton.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            characteristicCollectionView.topAnchor.constraint(equalTo: rocketNameLabel.bottomAnchor, constant: 20),
            characteristicCollectionView.leadingAnchor.constraint(equalTo: rocketNameLabel.leadingAnchor, constant: 10),
            characteristicCollectionView.leadingAnchor.constraint(equalTo: rocketNameLabel.leadingAnchor),
            characteristicCollectionView.trailingAnchor.constraint(equalTo: presentSettingsButton.trailingAnchor, constant: -10),
            characteristicCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    @objc private func sendDelegate() {
        delegate?.presentSettingViewController()
    }
    
    func rocketNameConfigure(from rocketName: RocketData) {
        rocketNameLabel.text = rocketName.name
    }
}

extension RocketCharacteristicTableViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Characteristics.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let characteristicCell = collectionView.dequeueReusableCell(withReuseIdentifier: RocketCharacteristicCollectionViewCell.identifier, for: indexPath) as? RocketCharacteristicCollectionViewCell else { return UICollectionViewCell() }
        characteristicCell.configureParametersAndDescription(item: indexPath.item)
        return characteristicCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (characteristicCollectionView.frame.width / 3) - 5
        let height = characteristicCollectionView.frame.height
        
        return CGSize(width: width, height: height)
    }
}
