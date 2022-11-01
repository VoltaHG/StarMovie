//
//  ViewController.swift
//  StarMovie
//
//  Created by Dmytro on 19.09.2022.
//

import UIKit

class ViewController: UIViewController {

    private let movieCellId = "MovieCell"
    
    var movieOnlineList: [Movie] = []
    
    @IBOutlet weak var MovieCollectionView: UICollectionView? {
        didSet {
            MovieCollectionView?.dataSource = self
            MovieCollectionView?.delegate = self
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //setupData()
        setupDataOnline()
        
        registerCollectionCells()
        
//        let layout = MovieCollectionView!.collectionViewLayout
//            if let flowLayout = layout as? UICollectionViewFlowLayout {
//                flowLayout.estimatedItemSize = CGSize(
//                    width: (MovieCollectionView!.frame.size.width / 2) ?? 0,
//                    // Make the height a reasonable estimate to
//                    // ensure the scroll bar remains smooth
//                    height: 200
//                )
//            }
    }

    private func registerCollectionCells() {
        MovieCollectionView?.register(CollectionViewCell.self, forCellWithReuseIdentifier: movieCellId)
        MovieCollectionView?.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: movieCellId)
    }
    
    private func setupDataOnline() {
        NetworkManager.shared.loadAllMoviesData() { response in
            switch response {
            case .succes(let moviesOnline):
                self.movieOnlineList = moviesOnline
                DispatchQueue.main.async {
                    self.MovieCollectionView?.reloadData()
                }
            case .error(let error):
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Error", message: error.description, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default))
                    self.present(alert, animated: true)
                }
            }
        }
    }
}


//extension ViewController: UICollectionViewDelegate {
////    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//////        guard let size = collectionView.frame.size else {
//////            return CGSize.zero
//////        }
////        return CGSize(width: (view.frame.width / 2) - 0, height: collectionView.frame.height - 0)
////    }
//}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return(CGSize(width: 191, height: 450))
        //return CGSize(width: (view.frame.width / 2) - 0, height: collectionView.frame.height - 0)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieOnlineList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: movieCellId, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        
//        cell.icon.contentMode = UIView.ContentMode.scaleAspectFill;
//        cell.icon.layer.masksToBounds = true;
        
        let movie = movieOnlineList[indexPath.row]
        cell.addData(movieOnline: movie)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movieOnlineList[indexPath.row]
        
        if let dvc = storyboard?.instantiateViewController(withIdentifier: "MovieDetailsView") as? MovieDetailsViewController {
            dvc.movie = movie
            show(dvc, sender: nil)
        }
        
    }
    
}
