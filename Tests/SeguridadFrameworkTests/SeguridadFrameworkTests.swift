import XCTest
@testable import SeguridadFramework
import CryptoKit

final class SeguridadFrameworkTests: XCTestCase {
    func testCifradoDecodificado () {
        let llaveAleatorio = SymmetricKey(size: .bits256)
        let cifrador = SeguridadFramework(llave: llaveAleatorio)
        
        let mensaje = "Mensaje cifrado"
        let msjCif = cifrador.cifrar(cadena: mensaje)
        XCTAssertNotNil(msjCif)
        
        let decod = cifrador.descifrar(cadena: msjCif!)
        XCTAssertEqual(mensaje, decod)
    }
}
