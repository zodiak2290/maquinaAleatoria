//
//  ViewController.swift
//  maquinaAleatoria
//
//  Created by Desarrollo Uxi on 05/01/17.
//  Copyright © 2017 Alberto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textNumero: UITextField!
    @IBOutlet weak var labelNumAleatorio: UILabel!
    @IBOutlet weak var labelResultado: UILabel!
    
    var tm = Timer()
    var iniciado:Bool = false
    var timeInterval : Double = 0.01
    var numMin : Int = 1
    var numMax : Int = 10
    override func viewDidLoad() {
        super.viewDidLoad()
        labelResultado.text = ""
        labelNumAleatorio.text = String(Int( (numMin + numMax) / 2 ))
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnStopStart(_ sender: Any) {
        let buton = sender as! UIButton
        var labelBtn : String = ""
        if(!iniciado){
            self.iniciarTiempo()
            iniciado = true
            labelBtn = "Parar"
        }else{
            tm.invalidate()
            iniciado = false
        
            labelBtn = "Iniciar"
            comprobarNum()
        }
        buton.setTitle(labelBtn, for: .normal)
    }
    
    private func comprobarNum(){
        let miNum = textNumero.text
        
        if(labelNumAleatorio.text ==  miNum){
            labelResultado.textColor = UIColor.blue
            labelResultado.text = "Eres un ganador!!"
        }else{
            labelResultado.textColor = UIColor.red
            labelResultado.text = "Perdiste =("
        }
    }
    
    private func iniciarTiempo(){
        tm = Timer.scheduledTimer(timeInterval: timeInterval , target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
    }
    
    func crearNumAleatorio(min : Int, max:Int) -> Int {
        let  n = Int(arc4random_uniform(UInt32((max - min) + min ))) +  min
        return n
    }
    
    func  updateTimer() {
        let nRan = crearNumAleatorio(min: numMin, max: numMax)
        labelNumAleatorio.text = String(nRan)
    }
}
