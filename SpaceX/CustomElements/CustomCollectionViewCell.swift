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
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .black
        return tableView
    }()
    
    //MARK: - override init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        addSubview()
        constraintsSetup()
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
            rocketInfoTableView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1 / 2)
        ])
    }
}
