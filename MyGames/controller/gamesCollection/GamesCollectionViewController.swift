//
//  OnBoardingCollectionViewController.swift
//  MyGames
//
//  Created by Thiago Matheus on 14/07/20.
//  Copyright © 2020 Douglas Frari. All rights reserved.
//

import UIKit
import CoreData

class GamesCollectionViewController: UICollectionViewController {
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 0
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addPageControlToView()
        loadGames()
        
        NotificationCenter.default.addObserver(self, selector: #selector(refreshTable(notification:)), name: NSNotification.Name("refresh"), object: nil)
        
        
    }
    
    @objc func refreshTable(notification: NSNotification) {
        self.collectionView.reloadData()
    }
    
    private func addPageControlToView() {
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    var fetchedResultController:NSFetchedResultsController<Game>!
    
    func loadGames(filtering: String = "") {
        
        let fetchRequest: NSFetchRequest<Game> = Game.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if filtering.isEmpty == false {
            // COMO SE FOSSE WHERE do SQL
            // usando predicate: conjunto de regras para pesquisas
            // contains [c] = search insensitive (nao considera letras identicas)
            let predicate = NSPredicate(format: "title contains [c] %@", filtering)
            fetchRequest.predicate = predicate
        }
        
        // possui
        fetchedResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultController.delegate = self
        
        do {
            try fetchedResultController.performFetch()
        } catch  {
            print(error.localizedDescription)
        }
    }
    
    
    
}



extension GamesCollectionViewController: NSFetchedResultsControllerDelegate {
    
    // sempre que algum objeto for modificado esse metodo sera notificado
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        //        switch type {
        //        case .delete:
        //            if let indexPath = indexPath {
        //                // Delete the row from the data source
        //                tableView.deleteRows(at: [indexPath], with: .fade)
        //            }
        //            break
        //        default:
        //            tableView.reloadData()
        //        }
    }
}




extension GamesCollectionViewController {
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchedResultController?.fetchedObjects?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GamesCollectionViewCell.reuseIdentifier, for: indexPath)
            as? GamesCollectionViewCell else { fatalError("Could not cast dequeued cell") }
        cell.fill(with: (fetchedResultController.fetchedObjects?[indexPath.row])!)
        return cell
    }
    
}

extension GamesCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let height = collectionView.bounds.height
        return CGSize(width: width, height: height)
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        pageControl.currentPage = pageNumber
    }
    
}
