import UIKit

class RocketSuccessLaunchTableViewCell: UITableViewCell {
    //MARK: - properties
    static let identifier = "RocketSuccessLaunchTableViewCell"
    
    private let successLaunchImageViewDescription: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let launchNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .left
        label.alpha = 0.5
        return label
    }()
    
    //MARK: - override init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .darkGray
        addSubview()
        constraintsSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - methods
    private func addSubview() {
        contentView.addSubview(successLaunchImageViewDescription)
        contentView.addSubview(launchNameLabel)
        contentView.addSubview(dateLabel)
    }
    
    private func constraintsSetup() {
        NSLayoutConstraint.activate([
            successLaunchImageViewDescription.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            successLaunchImageViewDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            successLaunchImageViewDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            successLaunchImageViewDescription.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1 / 3)
        ])
        
        NSLayoutConstraint.activate([
            launchNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            launchNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            launchNameLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1 / 2),
            launchNameLabel.trailingAnchor.constraint(equalTo: successLaunchImageViewDescription.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: launchNameLabel.bottomAnchor, constant: 3),
            dateLabel.leadingAnchor.constraint(equalTo: launchNameLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: successLaunchImageViewDescription.leadingAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
    
    func rocketLaunchConfigure(with rocketLaunchData: RocketLaunchData) {
        launchNameLabel.text = rocketLaunchData.name
        let flightDate = Date.getCorrectDay(unixTime: rocketLaunchData.date_unix)
        dateLabel.text = flightDate
        
        switch rocketLaunchData.success {
        case true:
            successLaunchImageViewDescription.image = UIImage(named: "success")
            
        case false:
            successLaunchImageViewDescription.image = UIImage(named: "cancel")
        
        default:
            successLaunchImageViewDescription.image = UIImage(named: "cancel")
        }
    }
}
