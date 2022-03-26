import UIKit

class RocketInfoTableViewCell: UITableViewCell {
    //MARK: - properties
    static let identifier = "RocketInfoTableViewCell"
    
    private let firstStartDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.alpha = 0.5
        label.textColor = .white
        label.text = "Первый запуск"
        return label
    }()
    
    private let firstStartDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.textColor = .white
        label.text = "7 феврался 2011"
        return label
    }()
    
    private let rocketCountryDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.alpha = 0.5
        label.textColor = .white
        label.text = "Страна"
        return label
    }()
    
    private let rocketCountryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.textColor = .white
        label.text = "США"
        return label
    }()
    
    private let launchCostDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .white
        label.alpha = 0.5
        label.text = "Стоимость запуска"
        return label
    }()
    
    private let launchCostLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.textColor = .white
        label.text = "$90 млн"
        return label
    }()
    
    //MARK: - override init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        constraintsSetup()
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - methods
    private func addSubview() {
        contentView.addSubview(firstStartDescriptionLabel)
        contentView.addSubview(firstStartDateLabel)
        contentView.addSubview(rocketCountryDescriptionLabel)
        contentView.addSubview(rocketCountryLabel)
        contentView.addSubview(launchCostDescriptionLabel)
        contentView.addSubview(launchCostLabel)
    }
    
    private func constraintsSetup() {
        NSLayoutConstraint.activate([
            firstStartDescriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            firstStartDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            firstStartDescriptionLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1 / 2),
            firstStartDescriptionLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1 / 3)
        ])
        
        NSLayoutConstraint.activate([
            firstStartDateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            firstStartDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            firstStartDateLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1 / 2),
            firstStartDateLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1 / 3)
        ])
        
        NSLayoutConstraint.activate([
            rocketCountryDescriptionLabel.topAnchor.constraint(equalTo: firstStartDescriptionLabel.bottomAnchor, constant: 5),
            rocketCountryDescriptionLabel.leadingAnchor.constraint(equalTo: firstStartDescriptionLabel.leadingAnchor),
            rocketCountryDescriptionLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1 / 2),
            rocketCountryDescriptionLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1 / 3)
        ])
        
        NSLayoutConstraint.activate([
            rocketCountryLabel.topAnchor.constraint(equalTo: firstStartDateLabel.bottomAnchor, constant: 5),
            rocketCountryLabel.trailingAnchor.constraint(equalTo: firstStartDateLabel.trailingAnchor),
            rocketCountryLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1 / 2),
            rocketCountryLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1 / 3)
        ])
        
        NSLayoutConstraint.activate([
            launchCostDescriptionLabel.topAnchor.constraint(equalTo: rocketCountryDescriptionLabel.bottomAnchor, constant: 5),
            launchCostDescriptionLabel.leadingAnchor.constraint(equalTo: rocketCountryDescriptionLabel.leadingAnchor),
            launchCostDescriptionLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1 / 2),
            launchCostDescriptionLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1 / 3)
        ])
        
        NSLayoutConstraint.activate([
            launchCostLabel.topAnchor.constraint(equalTo: rocketCountryLabel.bottomAnchor, constant: 5),
            launchCostLabel.trailingAnchor.constraint(equalTo: rocketCountryLabel.trailingAnchor),
            launchCostLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1 / 2),
            launchCostLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1 / 3)
        ])
        
    }
}
