import UIKit

class MainViewController: UIViewController {
    //MARK: - properties
    private let contentScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .red
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    private lazy var pageControl: UIPageControl = {
        let page = UIPageControl()
        page.translatesAutoresizingMaskIntoConstraints = false
        page.backgroundColor = .black
        page.numberOfPages = rocketData?.count ?? 0
        return page
    }()
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        constraintsSetup()
        navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - methods
    private func addSubview() {
        view.addSubview(pageControl)
        view.addSubview(contentScrollView)
    }
    
    private func constraintsSetup() {
        NSLayoutConstraint.activate([
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            contentScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            contentScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentScrollView.bottomAnchor.constraint(equalTo: pageControl.topAnchor)
        ])
    }
<<<<<<< Updated upstream
=======
    
    private func collectionViewSetup() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rocketData?.count ?? 0
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
>>>>>>> Stashed changes
}
