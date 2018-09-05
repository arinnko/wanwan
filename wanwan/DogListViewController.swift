import UIKit

class DogListViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var doglistTableView: UITableView!
    var DogListArray = [String]()
    
    override func viewWillAppear(_ animated: Bool) {
        doglistTableView.dataSource = self
        
        //userDefaultを呼び出し
        let userDefault =  UserDefaults.standard
        // いま保存されているscheduleの配列
        let Dogname = userDefault.array(forKey: "dogname") as? [String] ?? []
        DogListArray = Dogname
    doglistTableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection numberOfRowsInSectionsection: Int) -> Int {
        return DogListArray.count
    }
    
    func tableView(_ _tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = doglistTableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = DogListArray[indexPath.row]
        
        
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.DogListArray.remove(at: indexPath.row)
            let userDefault =  UserDefaults.standard
            userDefault.set(self.DogListArray, forKey: "dogname")
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "削除"
    }
    
}


