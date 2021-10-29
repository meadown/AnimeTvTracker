//
//  HeaderView.swift
//  AnimeTvTracker
//
//  Created by Danyal on 18/07/2021.
//


import UIKit
import AVKit

class HeaderView: UIView {
   
    @IBOutlet weak var animeImg: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var indicator: UIActivityIndicatorView!

    /*
     // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    /// A callback closure when the layout of the heading view has changed
    var onNeededLayout: (() -> Void)?
    private weak var imageMaskLayer: CAGradientLayer?
    private var topImageOriginalFrame: CGRect?
    
    /// A negative value indicating how much the user had scrolled passed
    /// the boundary
    var headingScrollExpansion: CGFloat = 0
    {
        didSet {
            guard let oFrame = topImageOriginalFrame else { return }
            animeImg.frame = CGRect(
                x: oFrame.origin.x,
                y: oFrame.origin.y + headingScrollExpansion,
                width: oFrame.size.width,
                height: oFrame.size.height - headingScrollExpansion
            )
            imageMaskLayer?.frame = animeImg.bounds
            imageMaskLayer?.speed = 10 // Make the image mask layer speed faster
        }
    }
    
    var imgUrlStr : String? = nil {
        didSet{
            self.indicator.startAnimating()
            if let imgurl = imgUrlStr{
                let urlStr = Constants.baseImgUrl + Constants.width500Img + imgurl
                ApiManager.shared.loadImages(urlStr: urlStr) { (data, err) in
                    DispatchQueue.main.async {
                        self.indicator.stopAnimating()
                        if let error = err{
                        }else{
                            self.animeImg.image = UIImage(data: data!)
                        }
                    }
                }
            }else{
                self.animeImg.image = nil
            }
            
        }
    }
    
    var videos : [VideoResult] = [] {
        didSet{
            if videos.count == 0 {
                btnPlay.isHidden = true
            }else{
                btnPlay.isHidden = false
            }
        }
    }
    
    var parentVC : UIViewController!
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        systemLayoutSizeFitting(size)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Add gradient layer to the image view
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = animeImg.bounds
        gradientLayer.locations = [0.6, 1.2]
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.clear.cgColor]
        animeImg.layer.mask = gradientLayer
        imageMaskLayer = gradientLayer
        
        
    }
    
    override func layoutSubviews() {
        // Restore top image original frame if there is one
        if let topImageOriginalFrame = topImageOriginalFrame,
            let topImageView = animeImg {
            topImageView.frame = topImageOriginalFrame
        }
        
        super.layoutSubviews()
        
        if let topImageView = animeImg {
            // Make sure the original frame is correctly updated
            topImageOriginalFrame = topImageView.frame
            imageMaskLayer?.frame = topImageView.bounds
            
            // Then update the expansion again
            let expansion = headingScrollExpansion
            headingScrollExpansion = expansion
        }

    }
    
    @IBAction func btnPlayTrailer(_ sender: UIButton) {
//        let urlStr = "\(Constants.youtubeBaseUrl)\(videos.first?.key ?? "")"
        let urlStr = "https://www.youtube.com/embed/\(videos.first?.key ?? "")"
        let vc = VideoVC()
        vc.urlStr = urlStr
        vc.modalPresentationStyle = .fullScreen
        parentVC.present(vc, animated: true, completion: nil)
//        if let url =  URL(string : urlStr){
//            playVideo(url : url)
//       }else{
//        }
    }
    
    func playVideo(url: URL) {
        let player = AVPlayer(url: url)
        
        let vc = AVPlayerViewController()
        vc.player = player
        vc.player?.play()
        
        parentVC.present(vc, animated: true) { vc.player?.play() }
    }


}
