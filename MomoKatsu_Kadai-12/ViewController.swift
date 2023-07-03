///
//  ViewController.swift
//  MomoKatsu_Kadai-12//
//  Created by モモカツ on 2023/07/01.
//  Part12 税込金額を計算するアプリ 消費税率は保存される
//

import UIKit

class ViewController: UIViewController {

    // 税抜金額入力用テキストフィールド
    @IBOutlet weak var amountExcludingTax: UITextField!
    // 消費税率入力用テキストフィールド
    @IBOutlet weak var consumptionTaxRate: UITextField!
    // 税込金額結果用ラベル
    @IBOutlet weak var amountIncludingTax: UILabel!

    let keyTaxRate = "TaxrRate"

    override func viewDidLoad() {
        super.viewDidLoad()

        if let taxRateText = UserDefaults.standard.string(forKey: keyTaxRate) {
            consumptionTaxRate.text = taxRateText
        }

        //print("viewDidLoad実行時：", consumptionTaxRate.text!)
    }

    // 計算ボタン押下時の処理
    @IBAction func tapCalcButton(sender: AnyObject) {
        // 税抜金額入力用テキストフィールドへの入力値がある場合
        let excludingTax = Int(amountExcludingTax.text ?? "") ?? 0
        // 消費税率入力用テキストフィールドへの入力値がある場合
        let taxRate = Float(consumptionTaxRate.text ?? "") ?? 0.0

        // 消費税込みの金額を計算
        let includingTax = Int( Float(excludingTax) * (1.0 + taxRate / 100.0) )
        // 税込金額結果をラベルに表示
        amountIncludingTax.text = "\(includingTax) 円"
        //print(amountIncludingTax.text!)
    }

    // 消費税率入力用テキストフィールドをタップした際の処理
    @IBAction func tapConsumptionTaxRate(sender: AnyObject) {
        UserDefaults.standard.set(consumptionTaxRate.text, forKey: keyTaxRate)
        //print("消費税率入力用テキストフィールドをタップ時：", consumptionTaxRate.text!)
    }

}

