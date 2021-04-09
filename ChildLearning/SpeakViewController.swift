//
//  SpeakViewController.swift
//  ChildLearning
//
//

import UIKit
import AVFoundation

class SpeakViewController: UIViewController {

    var strWord = String()
    var synthesizer = AVSpeechSynthesizer()
    
    var utterance = AVSpeechUtterance()
    override func viewDidLoad() {
        super.viewDidLoad()
        synthesizer = AVSpeechSynthesizer()
        textToSpeech()
       // synthesizer.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textToSpeech(){
            utterance = AVSpeechUtterance(string: strWord)
    //        var strLang = Singleton.sharedInstance.getStringFromDefaults(key: Constant.User_Default.KBibleLangauge)
    //        if self.currentLanguage == "eng"{
    //            strLang = "en-US"
    //        }
    //        else if self.currentLanguage == "pol"{
    //            strLang = "pl-PL"
    //
    //        }
    //        else if self.currentLanguage == "nld"{
    //            strLang = "nl-NL"
    //        }
    //        else if self.currentLanguage == "hin"{
    //            strLang = "hi-IN"
    //        }
    //        else if self.currentLanguage == "ita"{
    //            strLang = "pa-IN"
    //        }
    //        else if self.currentLanguage == "esa"{
    //            strLang = "es-ES"
    //        }
            
            utterance.voice = AVSpeechSynthesisVoice(language:  "en-US") //BCP-47
            
            if (synthesizer.isPaused) {
                print("continueSpeaking ---------")
            //    updateNowPlaying(isPause: false)
                synthesizer.continueSpeaking();
            }
                // The pause functionality
            else if (synthesizer.isSpeaking) {
                print("pausedddddddd")
                synthesizer.pauseSpeaking(at: AVSpeechBoundary.immediate)
            }
                // The start functionality
            else if (!synthesizer.isSpeaking) {
                // Getting text to read from the UITextView (textView).
                utterance = AVSpeechUtterance(string: strWord)
                utterance.voice = AVSpeechSynthesisVoice(language: lang)
                synthesizer.speak(utterance)
            }
        }
}
