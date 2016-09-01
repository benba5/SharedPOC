//
//  ViewController.swift
//  SurveyMonkey
//
//  Created by appsynth on 8/25/16.
//  Copyright © 2016 ben. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var feedbackController: SMFeedbackViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedbackController =   SMFeedbackViewController(survey: surveyMonkeyHashKey)
        feedbackController.delegate = self
        
        feedbackController.scheduleInterceptFromViewController(self, alertTitle: "7-eleven title", alertBody: "Please take a survey to get M-Stampt", positiveActionTitle: "OK, I will take it", cancelTitle: "Later", afterInstallInterval: 3, afterAcceptInterval: 5, afterDeclineInterval: 10)
    }
}


//MARK: IBAction
extension ViewController {
    
    @IBAction func presentSurveyTapped(sender: AnyObject) {
        feedbackController.presentFromViewController(self, animated: true) {
            print("Did present")
        }
    }
}


extension ViewController: SMFeedbackDelegate {
    // For Gold or Platinum
    func respondentDidEndSurvey(respondent: SMRespondent!, error: NSError!) {
        print("Did end survey RESPONDENT \(respondent)")
        print("did end survey ERROR \(error)")
    }
}

