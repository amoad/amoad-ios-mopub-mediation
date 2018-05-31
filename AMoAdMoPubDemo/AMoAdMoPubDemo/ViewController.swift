//
//  ViewController.swift
//  AMoAdMoPubDemo
//

import UIKit

fileprivate struct Item {
    public let title: String
    public let storyboardName: String
    
    public init(title: String, storyboardName: String) {
        self.title = title
        self.storyboardName = storyboardName
    }
}

fileprivate struct Const {
    public static let items: [Item] = [
        Item(title: "バナー広告", storyboardName: "Banner"),
        Item(title: "インターステイシャル広告", storyboardName: "Interstitial"),
        Item(title: "インフィード AfiO 広告", storyboardName: "Afio"),
        Item(title: "インターステイシャル AfiO 広告", storyboardName: "InterstitialAfio")
    ]
}

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func pushViewController(withItem item: Item) {
        let vc = UIStoryboard(name: item.storyboardName, bundle: Bundle.main).instantiateInitialViewController()!
        vc.title = item.title
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        self.pushViewController(withItem: Const.items[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Const.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contentView", for: indexPath)
        (cell.viewWithTag(1) as! UILabel).text = Const.items[indexPath.row].title
        return cell
    }
}

