//
//  ViewController.swift
//  calculadora_Xande
//
//  Created by alumno on 12/09/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CalculadoraTrabajo: UILabel!
    @IBOutlet weak var CalculadoraResultado: UILabel!
    
    var problema: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        LimpiarTodo()
        // Do any additional setup after loading the view.
    }
    
    func LimpiarTodo(){
        problema = ""
        CalculadoraTrabajo.text = ""
        CalculadoraResultado.text = ""
        
    }
    
    

    @IBAction func BorrarTodo(_ sender: Any) {
        LimpiarTodo()
    }
    
    @IBAction func Borrar(_ sender: Any) {
        if(!problema.isEmpty){
            problema.removeLast()
            CalculadoraTrabajo.text = problema
        }
    }
    
    func agregarAlTrabajo(value: String){
        problema = problema + value
        CalculadoraTrabajo.text = problema
    }
    
    @IBAction func Porcentaje(_ sender: Any) {
        agregarAlTrabajo(value: "%")
    }
    @IBAction func Dividir(_ sender: Any) {
        agregarAlTrabajo(value: "/")
    }
    
    @IBAction func Restar(_ sender: Any) {
        agregarAlTrabajo(value: "-")
    }
    @IBAction func Multiplicar(_ sender: Any) {
        agregarAlTrabajo(value: "*")
    }
    @IBAction func Sumar(_ sender: Any) {
        agregarAlTrabajo(value: "+")
    }
    
    
    @IBAction func Igual(_ sender: Any) {
        
        if(EntradaValida()){
            //aqui voy a checar lo de como sacar los porcentajes, con esto batalle un buen rato y mejor lo quite jaja
            let checarResultadoDePorcentaje = problema.replacingOccurrences(of: "%", with: "*0.01")
            let expresion = NSExpression(format: problema)
            let result = expresion.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatoDeResultado(result: result)
            CalculadoraResultado.text = resultString
        }
        else
        {
            let alert = UIAlertController(
                title: "Entrada incorrecta",
                message: "Esta calculadora no puede hacer esto", preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func EntradaValida() -> Bool{
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in problema
        {
            if (caracteresEspeciales(char: char)){
                funcCharIndexes.append(count)
            }
            count += 1
        }
        var anterior: Int = -1
        for index in funcCharIndexes{
            if(index == 0){
                return false
            }
            if(index == problema.count - 1){
                return false
            }
            if(anterior != -1){
                if(index - anterior == 1){
                    return false
                }
            }
            anterior = index
        }
        return true
    }
    
    func caracteresEspeciales(char: Character) -> Bool {
        if(char == "*"){
            return true
        }
        if(char == "/"){
            return true
        }
     
        if(char == "+"){
            return true
        }
        
        return false
        
    }
    func formatoDeResultado(result: Double) -> String{
        
        if(result.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)
        }
    }
    
    
    @IBAction func decimal(_ sender: Any) {
        agregarAlTrabajo(value: ".")
    }
    
    //numeros
    
    @IBAction func botUno(_ sender: Any) {
        agregarAlTrabajo(value: "1")
    }
    
    @IBAction func botDos(_ sender: Any) {
        agregarAlTrabajo(value: "2")
    }
    
    @IBAction func botTres(_ sender: Any) {
        agregarAlTrabajo(value: "3")
    }
    
    @IBAction func botCuatro(_ sender: Any) {
        agregarAlTrabajo(value: "4")
    }
    
    @IBAction func botCinco(_ sender: Any) {
        agregarAlTrabajo(value: "5")
    }
    
    @IBAction func botSeis(_ sender: Any) {
        agregarAlTrabajo(value: "6")
    }
    
    @IBAction func botSiete(_ sender: Any) {
        agregarAlTrabajo(value: "7")
    }
    
    @IBAction func botOcho(_ sender: Any) {
        agregarAlTrabajo(value: "8")
    }
    
    @IBAction func botNueve(_ sender: Any) {
        agregarAlTrabajo(value: "9")
    }
    
    @IBAction func botCero(_ sender: Any) {
        agregarAlTrabajo(value: "0")
    }
}


