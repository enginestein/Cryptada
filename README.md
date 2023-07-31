# Cryptada

Cryptada is a work in progress project which is basically a rewrite of [Cryptode](https://www.github.com/enginestein/Cryptode) which is a cryptography library for Rust.

For now there is only one section in Cryptada which is **adv** or **advanced algorithms** in full form. `adv` contains following features:

- Rot 13
- Base-Advanced encryption and decryption
- Transposition
- Utility functions
- Rot 13 - second version

# Usage

You can include the `lib.ads` file in your project which has following functions:

```ada
   function Another_Rot13(Text : String) return String; -- Rot 13 
   function Ask_Bool(Question : String; Default : Boolean) return Boolean; -- Utility 
   function Warn_If_File_Exists(Name : String) return Boolean; -- Utility 
   function Encrypt(Text : String; Key : Natural) return String; -- Base-Advanced encryption 
   function Decrypt(Text : String; Key : Natural) return String; -- Base-Advanced decryption 
   function Transposition(Decrypt_Mode: Boolean; Msg: String; Key: String) return String; -- Transposition
   function Encrypt(Msg: String; Key_Order: String) return String; -- Transposition encryption
   function Decrypt(Msg: String; Key_Order: String) return String; -- Transposition decryption
   function Theoretical_Rot13(Text : String) return String; -- Rot 13 second version
```
