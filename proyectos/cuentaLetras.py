import unicodedata

def quitar_acentos(texto):
    texto = unicodedata.normalize('NFD', texto)
    texto = texto.encode('ascii', 'ignore').decode('utf-8')
    return texto

def redondear_personalizado(numero):
    parte_entera = int(numero)
    decimal = int((numero - parte_entera) * 10)  # Obtiene el primer decimal
    if decimal >= 6:
        return parte_entera + 1  # Sube
    else:
        return parte_entera       # Baja

def calcular_suma_nombre(nombre):
    tabla = {
        'a': 1, 'b': 2, 'c': 3, 'd': 4, 'e': 5, 'f': 6, 'g': 7, 'h': 8,
        'i': 9, 'j': 10, 'k': 11, 'l': 12, 'm': 13, 'n': 14, 'ñ': 15, 'o': 16,
        'p': 17, 'q': 18, 'r': 19, 's': 20, 't': 21, 'u': 22, 'v': 23, 'w': 24,
        'x': 25, 'y': 26, 'z': 27
    }

    nombre = nombre.lower()
    nombre_sin_acentos = quitar_acentos(nombre)

    valores = []
    for letra in nombre_sin_acentos:
        if letra in tabla:
            valores.append(tabla[letra])
        elif letra not in ' \t\n\r':
            print(f"Advertencia: '{letra}' no es una letra válida y será ignorada.")

    return valores

# Entrada del usuario
nombre = input("Ingresa un nombre: ")

if not nombre.strip():
    print("❌ El nombre no puede estar vacío.")
else:
    valores = calcular_suma_nombre(nombre)

    if valores:
        print("Valores por letra:", " ".join(map(str, valores)))
        suma_total = sum(valores)
        num_letras = len(valores)
        promedio = suma_total / num_letras
        promedio_redondeado = redondear_personalizado(promedio)

        print(f"Suma total: {suma_total}")
        print(f"Número de letras válidas: {num_letras}")
        print(f"Promedio (sin redondear): {promedio:.2f}")
        print(f"Promedio redondeado (1-5 baja, 6-9 sube): {promedio_redondeado}")
    else:
        print("❌ No se encontraron letras válidas en el nombre ingresado.")