//
//  ViewController.swift
//  iQuiz Part1
//
//  Created by Bruce Ng on 11/3/15.
//  Copyright © 2015 Bruce Ng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    let cellTableIdentifier = "subjectCell"
    let subjects = [
        ["Name" : "Mathematics", "Description" : "Get quizzed about math", "Photo" : "photo1.png"],
        ["Name" : "Marvel Super Heroes", "Description" : "Get quizzed about Marvel", "Photo" : "photo2.png"],
        ["Name" : "Science", "Description" : "Get quizzed about science stuff", "Photo" : "photo3.png"],
    ];
    var questionsArray : [Dictionary<String, String>] = []
    var quizName : String = " "
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backView = UIView(frame: CGRectZero)
        self.tableView.tableFooterView = backView
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects.count
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier(cellTableIdentifier, forIndexPath: indexPath)
                as! subjectCell
        let rowData = subjects[indexPath.row]
        cell.title = rowData["Name"]!
        cell.descript = rowData["Description"]!
        cell.imageLabel?.image = UIImage(named: rowData["Photo"]!)
        cell.subject = "Subject:"
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell \(indexPath.row)!")
    }

    @IBAction func showSettings(sender: AnyObject) {
        let alert = UIAlertController(title: "Alert", message: "Settings go here", preferredStyle: UIAlertControllerStyle.Alert)
        let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(ok);
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var indexPath : NSIndexPath? = self.tableView.indexPathForSelectedRow
        if (indexPath!.row == 0) {
            questionsArray = [
                ["Question" : "What is the sum of 4 and 9?", "Answer1" : "10", "Answer2" : "13", "Answer3" : "15", "Answer4" : "17", "Correct Answer" : "13"],
                ["Question" : "What is the answer of 1 * 1?", "Answer1" : "0", "Answer2" : "1", "Answer3" : "2", "Answer4" : "3", "Correct Answer" : "1"],
                ["Question" : "What is the difference between 10 and 5?", "Answer1" : "2", "Answer2" : "5", "Answer3" : "7", "Answer4" : "10", "Correct Answer" : "5"],
                ["Question" : "What is the answer of 12 / 2?", "Answer1" : "3", "Answer2" : "6", "Answer3" : "7", "Answer4" : "12", "Correct Answer" : "6"]
            ];
            quizName = "Mathematics"
        } else if (indexPath!.row == 1) {
           questionsArray = [
                ["Question" : "Who is a superhero?", "Answer1" : "Me", "Answer2" : "Iron Man", "Answer3" : "Everyone", "Answer4" : "Nobody", "Correct Answer" : "Iron Man"],
                ["Question" : "Who is not a superhero?", "Answer1" : "Iron Man", "Answer2" : "Spider Man", "Answer3" : "Captain America", "Answer4" : "UW Student", "Correct Answer" : "UW Student"],
                ["Question" : "Who owns Marvel?", "Answer1" : "UW", "Answer2" : "Disney", "Answer3" : "iSchool", "Answer4" : "Nobody", "Correct Answer" : "Disney"],
                ["Question" : "Do you want to a superhero?", "Answer1" : "Yes", "Answer2" : "No", "Answer3" : "No", "Answer4" : "No", "Correct Answer" : "Yes"]
            ];
            quizName = "Marvel Super Heroes"
        } else if (indexPath!.row == 2) {
            questionsArray = [
                ["Question" : "What is the symbol for Water", "Answer1" : "NaCl", "Answer2" : "H2O", "Answer3" : "C", "Answer4" : "CaO", "Correct Answer" : "H2O"],
                ["Question" : "What is the symbol for Carbon", "Answer1" : "C", "Answer2" : "H2", "Answer3" : "Co", "Answer4" : "Cu", "Correct Answer" : "C"],
                ["Question" : "What is the symbol for Hydrogen?", "Answer1" : "H", "Answer2" : "He", "Answer3" : "Si", "Answer4" : "O", "Correct Answer" : "H"],
                ["Question" : "What is the symbol for Oxygen?", "Answer1" : "O", "Answer2" : "H", "Answer3" : "C", "Answer4" : "Si", "Correct Answer" : "O"]
            ];
            quizName = "Science"
        }
        var DestViewController : questions = segue.destinationViewController as! questions
        DestViewController.quizT = quizName
        DestViewController.questionsAnswerArray = questionsArray
        DestViewController.count = 0
        DestViewController.correct = 0
        DestViewController.total = questionsArray.count
        
    }

}

