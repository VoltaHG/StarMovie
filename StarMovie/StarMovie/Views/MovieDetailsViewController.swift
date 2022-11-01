//
//  MovieDetailsViewController.swift
//  StarMovie
//
//  Created by Dmytro on 20.09.2022.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    var movie: Movie?
    
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var movieDutation: UILabel!
    
    @IBOutlet weak var movieImage: UIImageView!
    
    
    @IBOutlet weak var movieImageBlured: UIImageView!
    
    
    @IBOutlet weak var starStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //movieTitle.text = movie?.name
        movieDutation.text = movie?.duration
        movieImage.downloaded(from: URL(string: movie?.imgPath! ?? "")!)
//        icon.downloaded(from: URL(string: movieOnline.imgPath!)!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
