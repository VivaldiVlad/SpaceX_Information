import UIKit

class LoadDataViewController: UIViewController {
    //MARK: - properties
    private var rocketData: [RocketData]?
    private var rocketLaunchesData: [RocketLaunchData]?
    
    private let activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .large)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.startAnimating()
        return view
    }()
    
    private let startImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "startRocket")
        return imageView
    }()
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(startImageView)
        startImageView.addSubview(activityIndicator)
        setupConstraints()
        sendData()
    }
    
    //MARK: - methods
    private func sendData() {
        RocketsNetworkManager.shared.fetchRequestForRocketCharacteristicData { [weak self] rocket in
            guard let self = self else { return }
            self.rocketData = rocket
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                let mainVC = MainViewController(rocketData: self.rocketData ?? rocket)
                mainVC.modalPresentationStyle = .fullScreen
                self.present(mainVC, animated: true, completion: nil)
            }
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            startImageView.topAnchor.constraint(equalTo: view.topAnchor),
            startImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            startImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            startImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: startImageView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: startImageView.centerYAnchor)
        ])
    }
}
