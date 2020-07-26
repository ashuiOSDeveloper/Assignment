//
//  ViewController.swift
//  Assignment
//
//  Created by Ashutosh Shukla on 24/07/20.
//  Copyright © 2020 Ashutosh Shukla. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    var mainDataArray = [DisplayData]()
    
    //Create a UICollectionView to display photos received from web in a grid structure
    fileprivate var photoCollection : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: "photoCell")
        return collectionView
    }()
            
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "Lorem Picsum"
        view.addSubview(photoCollection)
        photoCollection.backgroundColor = .clear
        photoCollection.dataSource = self
        photoCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        photoCollection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        photoCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        photoCollection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        getData()
    }
    
    private func getData()
    {
        guard let url = URL(string: "https://picsum.photos/list")
            else {
                print("URL cannot be created from given string")
                return
        }
        
        let urlRequest = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: TimeInterval.infinity)
        let urlSession = URLSession(configuration: .default)
        
        //We must check internet connection before this operation but due to time constraint I am leaving that part for now.
        let indicator = MyIndicator(frame: .zero)
        self.view.addSubview(indicator)
        self.view.bringSubviewToFront(indicator)
        indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        indicator.heightAnchor.constraint(equalToConstant: 50).isActive = true
        indicator.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        let getDataTask = urlSession.dataTask(with: urlRequest) { (receivedData, receivedResponse, occuredError) in
            guard occuredError == nil
                else {
                    DispatchQueue.main.async {
                        self.createAlert(withTitle: "Error", andMessage: occuredError?.localizedDescription)
                    }
                    return
            }
            do
            {
                guard let serializedData = try JSONSerialization.jsonObject(with: receivedData!, options: []) as? [[String : Any]]
                    else {
                        DispatchQueue.main.async {
                            self.createAlert(withTitle: "Error", andMessage: "An Internal error occured")
                        }
                        return
                }
                for i in 0 ..< serializedData.count
                {
                    let temp = serializedData[i]
                    let imageSourceString = "https://picsum.photos/200/200?image=\(temp["id"] as? Int ?? 0)"
                    let image = self.displaImageFrom(this: imageSourceString)
                    
                    self.mainDataArray.append(DisplayData(imageAuthorName: temp["author"] as? String, imageURL: imageSourceString, image: image))
                    
                }
                DispatchQueue.main.async {
                    if(self.mainDataArray.count > 0)
                    {
                        indicator.removeFromSuperview()
                        self.photoCollection.dataSource = self
                        self.photoCollection.delegate = self
                        self.photoCollection.reloadData()
                    }else {
                        self.createAlert(withTitle: "Alert", andMessage: "No data available to display")
                    }
                    
                }
            }catch let error as NSError
            {
                self.createAlert(withTitle: "Error", andMessage:error.localizedFailureReason )
            }
        }
        getDataTask.resume()
    }
    
    func displaImageFrom(this urlString : String) -> UIImage?
    {
        //Image cache could be done by other approaches as well.
        if let cachedImage = UIImage(data: UserDefaults.standard.value(forKey: urlString) as? Data ?? Data())
        {
            return cachedImage
        }else {
            let url = URL(string: urlString)!
            guard let data = try? Data(contentsOf: url)
                else {
                    return UIImage(named: "placeholder")!                    
            }
            UserDefaults.standard.set(data, forKey: urlString)
            let downloadedImage = UIImage(data: data)
            return downloadedImage ?? UIImage(named: "placeholder")
        }
    }

}

