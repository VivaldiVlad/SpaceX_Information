import UIKit

class RocketCharacteristicTableViewCell: UITableViewCell {
    //MARK: - properties
    static let identifier = "RocketCharacteristicTableViewCell"
    
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
        label.text = "Falcon Heavy"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    private let presentSettingsButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        let configuration = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
        button.setImage(UIImage(systemName: "gearshape", withConfiguration: configuration), for: .normal)
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
            rocketNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            rocketNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            rocketNameLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1 / 3),
            rocketNameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1 / 2)
        ])
        
        NSLayoutConstraint.activate([
            presentSettingsButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            presentSettingsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            presentSettingsButton.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1 / 3),
            presentSettingsButton.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            characteristicCollectionView.topAnchor.constraint(equalTo: rocketNameLabel.bottomAnchor, constant: 30),
            characteristicCollectionView.leadingAnchor.constraint(equalTo: rocketNameLabel.leadingAnchor, constant: 10),
            characteristicCollectionView.trailingAnchor.constraint(equalTo: presentSettingsButton.trailingAnchor, constant: -10),
            characteristicCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}

extension RocketCharacteristicTableViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let characteristicCell = collectionView.dequeueReusableCell(withReuseIdentifier: RocketCharacteristicCollectionViewCell.identifier, for: indexPath) as? RocketCharacteristicCollectionViewCell else { return UICollectionViewCell() }
        return characteristicCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (characteristicCollectionView.frame.width / 3) - 5
        let height = characteristicCollectionView.frame.height 
        
        return CGSize(width: width, height: height)
    }
}
