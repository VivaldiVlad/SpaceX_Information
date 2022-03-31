import UIKit

class MainViewController: UIViewController {
    private var rocketData: [RocketData]?
    private var rocketLaunchData: [RocketLaunchData]?
    
    //MARK: - properties
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    private let pageControl: UIPageControl = {
        let page = UIPageControl()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.backgroundColor = .black
        page.numberOfPages = 3
        return page
    }()
    
    init(rocketData: [RocketData], rocketLaunchData: [RocketLaunchData]) {
        self.rocketData = rocketData
        self.rocketLaunchData = rocketLaunchData
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        constraintsSetup()
        collectionViewSetup()
    }
    
    //MARK: - methods
    private func addSubview() {
        view.addSubview(pageControl)
        view.addSubview(collectionView)
    }
    
    private func constraintsSetup() {
        NSLayoutConstraint.activate([
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: pageControl.topAnchor)
        ])
    }
    
    private func collectionViewSetup() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pageControl.numberOfPages
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell() }
        
        guard let rocketData = rocketData?[indexPath.item] else { return UICollectionViewCell() }
        cell.rocketDataInit(with: rocketData)
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        
        return CGSize(width: width, height: height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let count = scrollView.contentOffset.x / UIScreen.main.bounds.size.width
        pageControl.currentPage = Int(count)
    }
}

extension MainViewController: RocketCharacteristicTableViewCellDelegate {
    func presentSettingViewController() {
        let settingsViewController = SettingsViewController(rocketLaunchData: rocketLaunchData)
        settingsViewController.modalPresentationStyle = .fullScreen
        
        present(settingsViewController, animated: true, completion: nil)
    }
}
