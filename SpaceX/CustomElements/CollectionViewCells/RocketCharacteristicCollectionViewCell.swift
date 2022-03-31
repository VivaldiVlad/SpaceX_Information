import UIKit

class RocketCharacteristicCollectionViewCell: UICollectionViewCell {
    //MARK: - properties
    static let identifier = "RocketCharacteristicCollectionViewCell"
    
    private var rocketData: RocketData?
    
    private let parametersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.text = "39"
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.alpha = 0.5
        return label
    }()
    
    //MARK: - override init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        constraintsSetup()
        self.layer.cornerRadius = 30
        self.backgroundColor = .darkGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - methods
    private func addSubview() {
        contentView.addSubview(parametersLabel)
        contentView.addSubview(descriptionLabel)
    }
    
    private func constraintsSetup() {
        NSLayoutConstraint.activate([
            parametersLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            parametersLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            parametersLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            parametersLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1 / 2)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: parametersLabel.bottomAnchor, constant: 3),
            descriptionLabel.leadingAnchor.constraint(equalTo: parametersLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: parametersLabel.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
    
    func configureParametersAndDescription(item: Int) {
        descriptionLabel.text = Characteristics.getTitle(item).rawValue
    }
}
