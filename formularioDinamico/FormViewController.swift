//
//  FormViewController.swift
//  formularioDinamico
//
//  Created by Hazel Alain on 12/10/24.
//

import UIKit

class FormViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    
    
    // Ejemplo de datos para los campos, agregamos más elementos
    let fieldsData = ["Nombre", "Correo Electrónico", "Teléfono", "Dirección", "Ciudad", "Código Postal", "País", "Número de Identificación", "Fecha de Nacimiento", "Ocupación"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configuración del StackView para un buen espaciado
        stackView.spacing = 20
        stackView.alignment = .fill
        
        // Llamamos a la función para agregar los campos dinámicamente
        createFormFields()
    }

    // Función para agregar etiquetas y campos de texto dinámicamente al stackView
    func createFormFields() {
        // Ejecutar en el hilo principal
        DispatchQueue.main.async {
            for field in self.fieldsData {
                // Crear un UILabel con estilo
                let label = UILabel()
                label.text = field
                label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
                label.textColor = .darkGray
                label.textAlignment = .left
                
                // Crear un UITextField con estilo
                let textField = UITextField()
                textField.borderStyle = .none
                textField.layer.borderColor = UIColor.lightGray.cgColor
                textField.layer.borderWidth = 1
                textField.layer.cornerRadius = 8
                textField.placeholder = "Introduce \(field.lowercased())"
                textField.setPadding(left: 10) // Custom padding method
                textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
                
                // Agregar el label y el textfield al UIStackView
                self.stackView.addArrangedSubview(label)
                self.stackView.addArrangedSubview(textField)
            }
            
            // Agregar un botón "Enviar" con estilo
            let submitButton = UIButton(type: .system)
            submitButton.setTitle("Enviar", for: .normal)
            submitButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            submitButton.backgroundColor = UIColor.systemBlue
            submitButton.setTitleColor(.white, for: .normal)
            submitButton.layer.cornerRadius = 10
            submitButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
            submitButton.addTarget(self, action: #selector(self.submitForm), for: .touchUpInside)
            self.stackView.addArrangedSubview(submitButton)
        }
    }

    // Acción del botón de enviar
    @objc func submitForm() {
        print("Formulario enviado")
    }
}

// Método de extensión para agregar padding a los UITextFields
extension UITextField {
    func setPadding(left: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
