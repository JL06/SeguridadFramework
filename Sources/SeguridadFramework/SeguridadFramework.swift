import Foundation
import CryptoKit

public class SeguridadFramework {
    private var clave: SymmetricKey

    public init(llave: SymmetricKey) {
        self.clave = llave
    }
    
    public func cambiarLlave (llave: SymmetricKey) {
        self.clave = llave
    }
    
    
    public func cifrar (cadena: String) -> ChaChaPoly.SealedBox? {
        var cifrado: ChaChaPoly.SealedBox?
        let dataCadena = Data(cadena.utf8)
        
        do {
            let box = try ChaChaPoly.seal(dataCadena, using: self.clave, nonce: ChaChaPoly.Nonce())
            cifrado = try ChaChaPoly.SealedBox(combined: box.combined)
        } catch {
            print("Error en el cifrado \(error)")
        }
        return cifrado
    }
    
    public func descifrar (cadena: ChaChaPoly.SealedBox) -> String {
        var cadenaDecodificada: String = ""
        do {
            let combinedData = cadena.combined
            _ = try ChaChaPoly.SealedBox(combined: combinedData)
            let decryptedData = try ChaChaPoly.open(cadena, using: self.clave)
            cadenaDecodificada = String(data: decryptedData, encoding: .utf8) ?? ""
            
        } catch {
            print("Error en decodificado \(error)")
        }
        return cadenaDecodificada
    }
    
}
