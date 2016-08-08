//
//  ViewController.swift
//  starvingArtistTest
//
//  Created by GirlsWhoCode on 8/3/16.
//  Copyright © 2016 GirlsWhoCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var drawButton: UIButton!
    @IBOutlet weak var Artist: UIImageView!
    @IBOutlet weak var Achievement: UIImageView!
    @IBOutlet weak var Level: UILabel!
    @IBOutlet weak var clockTime: UILabel!
    
    //preparation variables
    var timer = NSTimer()
    var draws:Int=0
    var counter:Int=0
    var artistList:[String]=["starvingartistartist1","starvingartistartist2","starvingartistartist3","artistlevel4crop","starvingartistartist5"]
    var levelList:[String]=["1","2","3","4","5"]
 //*/
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1.0,
            target: self,
            selector: Selector("tick"),
            userInfo: nil,
            repeats: true)
        
        //starting artist
        Artist.image=UIImage(named:"starvingartistartist1")
            self.Level.text="Level "+levelList[0]
        Achievement.image=UIImage(named:"starvingartistbarstarter")
    }
    @objc func tick() {
        clockTime.text = NSDateFormatter.localizedStringFromDate(NSDate(),
                                                                        dateStyle: .MediumStyle,
                                                                        timeStyle: .MediumStyle)
    }
    @IBAction func drawClicked(sender: UIButton){
        draws+=1
        //Popup 1
        if draws>0 && draws<10
        {
        let popup=UIAlertController(title:"Yay!",message:"You have drawn! Keep up the good work! >.<",preferredStyle:UIAlertControllerStyle.Alert)
        
        popup.addAction(UIAlertAction(title:"Ok!",style:UIAlertActionStyle.Default,handler:nil))
        
        self.presentViewController(popup, animated: true, completion: nil)
        }
        //popup 2
        /*let popupcongrats=UIAlertController(title:"Congradulations!",message:" You have finished all the levels. Keep up the good work!",preferredStyle:UIAlertControllerStyle.Alert)
        popupcongrats.addAction(UIAlertAction(title:"Ok!",style:UIAlertActionStyle.Default,handler:nil))
 */
        //end popup
        
        
        
        //Achievement bar changes
        
                if draws>=2 && draws<4{
            Achievement.image=UIImage(named:"starvingartistbar2")
        }
        if draws>=4 && draws<6{
            Achievement.image=UIImage(named:"starvingartistbar3")
        }
        if draws>=6 && draws<8{
            Achievement.image=UIImage(named:"starvingartistbar4")
        }
        if draws>=8 && draws<9{
            Achievement.image=UIImage(named:"starvingartistbar5")
        }
        //End of Achievement bar changes
        
        //artist changes
                //first level ends
        if draws==9 && Artist.image != UIImage(named:"starvingartistartist5")
        {
            counter+=1
            draws=1
            //return
        Achievement.image=UIImage(named:"starvingartistbar1")
        }
        //start over at beginning
        if draws==10 && Artist.image==UIImage(named:"starvingartistartist5")
        {
            let popupcongrats=UIAlertController(title:"Congradulations!",message:" You have finished all the levels. Keep up the good work!",preferredStyle:UIAlertControllerStyle.Alert)
            popupcongrats.addAction(UIAlertAction(title:"Ok!",style:UIAlertActionStyle.Default,handler:nil))
            self.presentViewController(popupcongrats, animated: true, completion: nil)
            draws=0
            counter=0
            Artist.image=UIImage(named:"starvingartistartist1")
            Achievement.image=UIImage(named:"starvingartistbar1")
        }


        if Achievement.image==UIImage(named:"starvingartistbar1"){
            Artist.image=UIImage(named:artistList[counter])
            
            self.Level.text="Level "+levelList[counter]
            
        }
        
    
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      //  Dispose of any resources that can be recreated.
 
    }


    

}