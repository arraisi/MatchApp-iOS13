//
//  ViewController.swift
//  MatchApp
//
//  Created by Abdul R. Arraisi on 24/09/20.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    let model = CardModel()
    var cardArray = [Card]()
    var firstFlippedCardIndex: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        
        cardArray = model.getCards()
        
    }
    
    //    MARK: - Collection View Delegate Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardArray.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        // configuring cell
        cell.configuringCell(card: cardArray[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as? CardCollectionViewCell
        
        if cell?.card?.isFlipped == false {
            
            cell?.flipUp()
            
            if firstFlippedCardIndex == nil {
                firstFlippedCardIndex = indexPath
            } else {
                checkForMatch(indexPath)
            }
        }
        
    }
    
    //    MARK: - Game logics
    func checkForMatch(_ secondFlippedCardIndex: IndexPath) {
        let cardOne = cardArray[firstFlippedCardIndex!.row]
        let cardTwo = cardArray[secondFlippedCardIndex.row]
        
        let cardOneCell = imageCollectionView.cellForItem(at: firstFlippedCardIndex!) as? CardCollectionViewCell
        let cardTwoCell = imageCollectionView.cellForItem(at: secondFlippedCardIndex) as? CardCollectionViewCell
        
        if cardOne.cardName == cardTwo.cardName {
            
            cardOne.isMatched = true
            cardTwo.isMatched = true
            
            cardOneCell?.remove()
            cardTwoCell?.remove()
            
        } else {
            
            cardOneCell?.flipDown()
            cardTwoCell?.flipDown()
            
        }
        
        //        reset
        firstFlippedCardIndex = nil
    }
}

