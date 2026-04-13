import unicodedata

# 1. Quitar acentos de las letras
def quitar_acentos(texto):
    texto = unicodedata.normalize('NFD', texto)
    texto = texto.encode('ascii', 'ignore').decode('utf-8')
    return texto

# 2. Asignar valor a cada letra (a=1, b=2, ..., z=27, incluye ñ=15)
def valor_letra(letra):
    tabla = {
        'a': 1, 'b': 2, 'c': 3, 'd': 4, 'e': 5, 'f': 6, 'g': 7, 'h': 8,
        'i': 9, 'j': 10, 'k': 11, 'l': 12, 'm': 13, 'n': 14, 'ñ': 15, 'o': 16,
        'p': 17, 'q': 18, 'r': 19, 's': 20, 't': 21, 'u': 22, 'v': 23, 'w': 24,
        'x': 25, 'y': 26, 'z': 27
    }
    return tabla.get(letra.lower(), 0)

# 3. Redondeo personalizado: 1-5 baja, 6-9 sube
def redondear_personalizado(numero):
    parte_entera = int(numero)
    decimal = int((numero - parte_entera) * 10)  # Primer decimal
    if decimal >= 6:
        return parte_entera + 1
    else:
        return parte_entera

# 4. Reducir número a un solo dígito (1-9), excepto 11, 22, 33 (números maestros)
def reducir_a_digito(n):
    if n in [11, 22, 33]:
        return n  # Son números maestros
    while n >= 10:
        n = sum(int(d) for d in str(n))
    return n

# 5. Interpretación del número (como un "horóscopo del nombre")
def interpretar_numero(numero):
    significados = {
        1: "Líder natural, independiente y pionero. Tienes fuerza para iniciar proyectos y tomar el control.",
        2: "Diplomático, sensible y equilibrado. Excelente en relaciones y trabajo en equipo.",
        3: "Creativo, expresivo y comunicador. Tu energía atrae alegría y originalidad.",
        4: "Práctico, estable y trabajador. Eres la base sobre la que otros pueden construir.",
        5: "Libre, adaptable y aventurero. Buscas cambio, experiencia y libertad.",
        6: "Responsable, protector y familiar. Tu misión es cuidar y armonizar.",
        7: "Analítico, espiritual e introspectivo. Buscas la verdad y el conocimiento profundo.",
        8: "Ambicioso, poderoso y orientado al éxito. Tienes capacidad para alcanzar grandes metas materiales.",
        9: "Humanitario, compasivo y sabio. Tu propósito es servir a los demás y cerrar ciclos.",
        11: "Intuitivo, inspirado e iluminado (número maestro). Tienes una misión espiritual elevada.",
        22: "Constructor, visionario y transformador (número maestro). Puedes convertir sueños en realidad.",
        33: "Maestro espiritual, servicio universal (número maestro). Tu energía es rara y poderosa."
    }
    return significados.get(numero, "Tu número tiene una energía única y aún por descubrir.")

# 6. Calcular el "Número de Camino de Vida" (a partir de la fecha de nacimiento)
def numero_camino_de_vida(fecha):
    # Formato esperado: "DD/MM/AAAA"
    fecha = fecha.strip()
    digitos = [int(c) for c in fecha if c.isdigit()]
    total = sum(digitos)
    return reducir_a_digito(total)

# --- PROGRAMA PRINCIPAL ---
print("🔮 BIENVENIDO A TU ANÁLISIS DE NUMEROLOGÍA PERSONAL")

# Paso 1: Nombre
nombre = input("\n📌 Ingresa tu nombre completo: ")

if not nombre.strip():
    print("❌ El nombre no puede estar vacío.")
else:
    # Calcular valores del nombre
    nombre_sin_acentos = quitar_acentos(nombre).lower()
    valores = [valor_letra(letra) for letra in nombre_sin_acentos if letra.isalpha()]
    
    if not valores:
        print("❌ No se encontraron letras válidas.")
    else:
        suma = sum(valores)
        num_letras = len(valores)
        promedio = suma / num_letras
        promedio_redondeado = redondear_personalizado(promedio)
        numero_expresion = reducir_a_digito(promedio_redondeado)

        print(f"\n📊 Análisis del nombre: '{nombre}'")
        print(f"Valores por letra: {' '.join(map(str, valores))}")
        print(f"Suma total: {suma}")
        print(f"Número de letras: {num_letras}")
        print(f"Promedio: {promedio:.2f}")
        print(f"Promedio redondeado (1-5 baja, 6-9 sube): {promedio_redondeado}")
        print(f"Número de Expresión (reducido): {numero_expresion}")
        print(f"✨ Interpretación: {interpretar_numero(numero_expresion)}")

        # Paso 2: Fecha de nacimiento
        print("\n📅 Ahora, ingresa tu fecha de nacimiento (formato: DD/MM/AAAA)")
        fecha_nac = input("Fecha: ")

        try:
            camino_de_vida = numero_camino_de_vida(fecha_nac)
            print(f"\n🌟 Número de Camino de Vida: {camino_de_vida}")
            print(f"✨ Significado: {interpretar_numero(camino_de_vida)}")
            print("\n💬 Tu Número de Expresión revela quién eres. Tu Camino de Vida muestra tu destino.")
            print("Gracias por usar el sistema de numerología personal. 🌟")
        except:
            print("❌ Fecha inválida. Usa el formato DD/MM/AAAA.")