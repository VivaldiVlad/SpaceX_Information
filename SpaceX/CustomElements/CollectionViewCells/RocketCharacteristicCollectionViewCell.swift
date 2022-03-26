import UIKit

class RocketCharacteristicCollectionViewCell: UICollectionViewCell {
    //MARK: - properties
    static let identifier = "RocketCharacteristicCollectionViewCell"
    
    private let dataLabel: UILabel = {
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
        contentView.addSubview(dataLabel)
        contentView.addSubview(descriptionLabel)
    }
    
    private func constraintsSetup() {
        NSLayoutConstraint.activate([
            dataLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            dataLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dataLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            dataLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1 / 2)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: dataLabel.bottomAnchor, constant: 3),
            descriptionLabel.leadingAnchor.constraint(equalTo: dataLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: dataLabel.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
    
    func descriptionConfigure(item: Int) {
        descriptionLabel.text = Characteristics.getTitle(item).rawValue
    }
}
