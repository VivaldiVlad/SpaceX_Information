
import UIKit

class SecondStageTableViewCell: UITableViewCell {
    //MARK: - properties
    static let identifier = "SecondStageTableViewCell"
    
    private let enginesAmountDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .white
        label.text = "Количество двигателей"
        label.alpha = 0.5
        return label
    }()
    
    private let gasAmountDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Количество топлива"
        label.textColor = .white
        label.alpha = 0.5
        return label
    }()
    
    private let gasBurningTimeDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Время сгорания топлива"
        label.textColor = .white
        label.alpha = 0.5
        return label
    }()
    
    private let enginesAmountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.text = "28"
        label.textColor = .white
        return label
    }()
    
    private let gasAmountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.text = "123"
        label.textColor = .white
        return label
    }()
    
    private let gasBurningLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.text = "1488/ s"
        label.textColor = .white
        return label
    }()
    
    //MARK: - override init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        addSubview()
        constraintsSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - methods
    private func addSubview() {
        contentView.addSubview(gasAmountDescriptionLabel)
        contentView.addSubview(enginesAmountDescriptionLabel)
        contentView.addSubview(gasBurningTimeDescriptionLabel)
        
        contentView.addSubview(gasAmountLabel)
        contentView.addSubview(enginesAmountLabel)
        contentView.addSubview(gasBurningLabel)
    }
    
    private func constraintsSetup() {
        NSLayoutConstraint.activate([
            enginesAmountDescriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            enginesAmountDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            enginesAmountDescriptionLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 2 / 2.5),
            enginesAmountDescriptionLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1 / 3)
        ])
        
        NSLayoutConstraint.activate([
            gasAmountDescriptionLabel.topAnchor.constraint(equalTo: enginesAmountDescriptionLabel.bottomAnchor, constant: 5),
            gasAmountDescriptionLabel.leadingAnchor.constraint(equalTo: enginesAmountDescriptionLabel.leadingAnchor),
            gasAmountDescriptionLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1 / 2),
            gasAmountDescriptionLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1 / 3)
        ])
        
        NSLayoutConstraint.activate([
            gasBurningTimeDescriptionLabel.topAnchor.constraint(equalTo: gasAmountDescriptionLabel.bottomAnchor, constant: 5),
            gasBurningTimeDescriptionLabel.leadingAnchor.constraint(equalTo: gasAmountDescriptionLabel.leadingAnchor),
            gasBurningTimeDescriptionLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1 / 2),
            gasBurningTimeDescriptionLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1 / 3)
        ])
        
        NSLayoutConstraint.activate([
            enginesAmountLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            enginesAmountLabel.leadingAnchor.constraint(equalTo: enginesAmountDescriptionLabel.trailingAnchor),
            enginesAmountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            enginesAmountLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1 / 3)
        ])
        
        NSLayoutConstraint.activate([
            gasAmountLabel.topAnchor.constraint(equalTo: enginesAmountLabel.bottomAnchor, constant: 5),
            gasAmountLabel.leadingAnchor.constraint(equalTo: gasAmountDescriptionLabel.trailingAnchor),
            gasAmountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            gasAmountLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1 / 3)
        ])
        
        NSLayoutConstraint.activate([
            gasBurningLabel.topAnchor.constraint(equalTo: gasAmountLabel.bottomAnchor, constant: 5),
            gasBurningLabel.leadingAnchor.constraint(equalTo: gasBurningTimeDescriptionLabel.trailingAnchor),
            gasBurningLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            gasBurningLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1 / 3)
        ])
    }
    
    func secondStageConfigure(with stagesData: RocketStagesInfo) {
        guard let gasBurningTimeInSec = stagesData.burnTimeSec else { return }
        
        enginesAmountLabel.text = "\(stagesData.engines)"
        gasAmountLabel.text = "\(stagesData.fuelAmountTons) ton"
        gasBurningLabel.text = "\(gasBurningTimeInSec)"
    }
}
