ALPHABET = "abcdefghijklmnopqrstuvwxyz"

def encode(text: str, n: int) -> str:
    x = n % 26
    rotalpha = ALPHABET[-x:] + ALPHABET[:-x]
    decoded = ""
    for alpha in text:
        if alpha == " ":
            decoded += " "
        else:
            decoded += ALPHABET[rotalpha.index(alpha)]
    return decoded

def decode(text: str, n: int) -> str:
    x = n % 26
    rotalpha = ALPHABET[-x:] + ALPHABET[:-x]
    encoded = ""
    for alpha in text:
        if alpha == " ":
            encoded += " "
        else:
            encoded += rotalpha[ALPHABET.index(alpha)]
    return encoded

text = input("Enter text: ")
n = int(input("Enter the value for rotate: "))
encrypted = encode(text.lower(), n)
print("Encoded Text: " + encrypted.upper())
decrypted = decode(encrypted.lower(), n)
print("Decoded Text: " + decrypted.upper())
