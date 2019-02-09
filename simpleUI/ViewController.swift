//
//  ViewController.swift
//  simpleUI
//
//  Created by Fumio Sumi on 2019/01/29.
//  Copyright © 2019年 Fumio Sumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //outputLabel.text = "Hello world?"
        //lestTime.text = "MM:YY"
        update()
    }
    func update(){
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "ydMMMEEEhm", options: 0, locale: Locale(identifier: "ja_JP"))
        todayYMD.text = formatter.string(from: Date())
        
        //todayYMD.text = "2019/2/2 02:24"
        lestTime.text = "4y12m"
        lestMonthLabel.text = "123m"
        lestDayLabel.text = "12345days"
        lestHourLabel.text = "2342323H"
        todaysAdvice.text = "健康の秘訣：よく寝て食８分目"
        calcLestDate()
        showMessage()
    }
    func showMessage()
    {
        let week = Calendar(identifier: Calendar.Identifier.gregorian).dateComponents([.weekday],from:Date()).weekday
        todaysAdvice.text = getWeekMsg(week: week!)
    }
    func getWeekMsg(week: Int)-> String
    {
        var msg = ""
        let msgOfWeek = [
            1: ["日曜日いかがお過ごしですか",
                "掃除とか片付けすると気持ちもリフレッシュしますよ",
                "休みの日には、何か趣味に打ち込んでみるのもいいかもしれませんね",
                "明日からの一週間に備えて今日は十分リフレッシュしましょう。仕事の事をあれこれ考えすぎないようにしましょう。体を動かすのもいいですね。"],
            2: ["月曜日になりましたが、ゆっくり調子を戻しましょう。月曜日は会社に来ただけで十分！。。等と言ってられませんか",
                "月曜日は気が重いですか？考えすぎないのが一番ですよ。案ずるよりなんとやら"],
            3: ["火曜日になりましたが、調子は戻ってきましたか？金田だと「やっとエンジンが暖まってきたぜ」と言いそうですね",
                "火曜日になりましたが調子はいかがですか。無理せず一週間をこなしましょう"],
            4: ["今日は水曜、一週間の、なか日ですね。ちょっと一息しましょうか",
                "水曜日はたまに早く帰ってみるのもいいかも"],
            5: ["一週間の後半、木曜日になりましたね。今日は調子いかがですか？",
                "木曜日ですが調子はいかがですか"],
            6: ["やっと金曜日まできましたね！！　今日1日頑張りましょう。明日からお休みですね！",
                "今日は金曜日！お疲れ様です！"],
            7: ["やっと休みになりましたね。一週間お疲れ様でした。今日はちょっと夜更かしですか？",
                "一週間お疲れ様でした。土曜日だからといって、あまり生活リズムを変えない方が体調管理のためにはいいそうですよ",
                "今日はどこかにお出かけですか？",
                "とりあえず、ゆっくりしましょう"
            ]]
        msg = msgOfWeek[week]!.randomElement()!
        return msg
    }
    func calcLestDate()
    {
        let complete = "2023/7/31 17:30:00"   //  （例）勤務最終日
    
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat =  "yyyy/MM/dd HH:mm:ss"
        let cmplDate = dateFormatter.date(from: complete)
    
        let calendar = Calendar(identifier: .gregorian)
        let today:Date = Date()
    
        var components = calendar.dateComponents([.year, .month], from: today , to: cmplDate!)
            lestTime.text = String(components.year!) + "年と" + String(components.month!) + "ヶ月"
    
        components = calendar.dateComponents([ .month], from: today , to: cmplDate!)
        //let month = components.month!
        //print(month*7/10)

        lestMonthLabel.text = String(components.month!) + "ヶ月"
        components = calendar.dateComponents([ .day], from: today , to: cmplDate!)
        lestDayLabel.text = String(components.day!*68/100) + "日"
    
        components = calendar.dateComponents([ .hour], from: today , to: cmplDate!)
        lestHourLabel.text = String(components.hour!*68*8/100/24) + "時間"
    }
    
    @IBAction func checkBtn(_ sender: Any) {
        update()
    }
    @IBAction func showNextWord(_ sender: Any) {
        todaysAdvice.text = "考えすぎずゆっくり進もう"
    }
    @IBOutlet weak var lestTime: UILabel!
    @IBOutlet weak var todayYMD: UILabel!
    @IBOutlet weak var todaysAdvice: UITextView!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var lestMonthLabel: UILabel!
    @IBOutlet weak var lestDayLabel: UILabel!
    @IBOutlet weak var lestHourLabel: UILabel!
}

