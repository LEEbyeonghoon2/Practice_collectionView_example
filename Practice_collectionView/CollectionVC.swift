//
//  ViewController.swift
//  Practice_collectionView
//
//  Created by 이병훈 on 2021/05/03.
//

import UIKit

class CollectionVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var playerData = [("박건우", UIImage(named: "ParkKun.png")!), ("호세", UIImage(named: "Fernandez.png")!), ("허경민", UIImage(named: "HeoKyung.png")!), ("정수빈", UIImage(named: "JungSoo.png")!), ("김인태", UIImage(named: "KimIn.png")),("김재호",UIImage(named: "KimJae.png")), ("김재환", UIImage(named: "KimJaehwan.png")),("오재원", UIImage(named: "OhJae.png")), ("박세혁", UIImage(named: "parksei.png"))]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        let flowlayout = UICollectionViewFlowLayout()

        flowlayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

        flowlayout.minimumLineSpacing = 5
        flowlayout.minimumInteritemSpacing = 5


        let threePicture: CGFloat = UIScreen.main.bounds.width / 3.0

        flowlayout.estimatedItemSize = CGSize(width: threePicture - 30, height: 100.0)

        flowlayout.itemSize = CGSize(width: threePicture - 30, height: 100.0)
        
        collectionView.collectionViewLayout = flowlayout
        self.collectionView.reloadData()
    }
    
    lazy var playerlist: [playerVO] = {
        var list = [playerVO]()
        
        for (name, image) in playerData {
            let pvo = playerVO()
            pvo.name = name
            pvo.image = image
            
            list.append(pvo)
        }
        
        return list
    }()
}

extension CollectionVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return playerData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "player", for: indexPath) as? CollcetionCell else { return UICollectionViewCell() }
        /*옵셔널값이 있을수 있었어가지고 iflet으로 오류처리를 해줬습니다!*/
        if let image = playerlist[indexPath.row].image {
            cell.playerimage.image = image
        } else {
            cell.playerimage.image = nil
        }
        cell.playerName.text! = playerlist[indexPath.row].name!
        
        return cell
    
    }
    
    }
extension CollectionVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath)번째 행입니다.")
    }
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
}
//extension CollectionVC: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        guard let flow = collectionViewLayout as? UICollectionViewFlowLayout else {
//            return CGSize()
//        }
//        flow.minimumInteritemSpacing = 5
//        let width = UIScreen.main.bounds.width / 3 - flow.minimumInteritemSpacing
//
//        return CGSize(width: width - 30, height: 100)
//    }
//}

