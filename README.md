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

## Another_Rot13 (Rot13)

```ada
procedure Main is
   use Ada.Text_IO;
   use Cryptada;

   Input_Text : String := "Hello, World!";
   Encrypted_Text : String(1 .. Input_Text'Length);

   Decrypted_Text : String(1 .. Input_Text'Length);
begin
   -- Encrypt the input text using Another_Rot13 function
   Encrypted_Text := Another_Rot13(Input_Text);
   
   -- Display the encrypted text
   Put_Line("Encrypted Text: " & Encrypted_Text);

   -- Decrypt the encrypted text (reversing the ROT13 process)
   Decrypted_Text := Another_Rot13(Encrypted_Text);
   
   -- Display the decrypted text
   Put_Line("Decrypted Text: " & Decrypted_Text);
end Main;
```

## Main (Base-Advanced encryption and decryption)

```ada
procedure Main is
   Input_Text : String := "Hello, World!";
   Key : Natural := 3;
   Encrypted_Text : String(1 .. Input_Text'Length);
   Decrypted_Text : String(1 .. Input_Text'Length);
begin
   -- Encrypt the input text using the Encrypt function
   Encrypted_Text := Encrypt(Input_Text, Key);
   
   -- Display the encrypted text
   Put_Line("Encrypted Text: " & Encrypted_Text);

   -- Decrypt the encrypted text using the Decrypt function
   Decrypted_Text := Decrypt(Encrypted_Text, Key);
   
   -- Display the decrypted text
   Put_Line("Decrypted Text: " & Decrypted_Text);
end Main;
```

## Theoretical_Rot13 (Rot 13 second version)

```ada
procedure Main is
   Input_Text : String := "Hello, World!";
   Encrypted_Text : String(1 .. Input_Text'Length);
begin
   -- Encrypt the input text using the Theoretical_Rot13 function
   Encrypted_Text := Theoretical_Rot13(Input_Text);
   
   -- Display the encrypted text
   Put_Line("Encrypted Text: " & Encrypted_Text);
end Main;

```

## transposition (Transposition encryption and decryption)

```ada
procedure Main is
   Input_Text : String := "Hello, World!";
   Key : String := "CRYPTO"; -- Replace with your own key
   Encrypted_Text : String(1 .. Input_Text'Length);
   Decrypted_Text : String(1 .. Input_Text'Length);
begin
   -- Encrypt the input text using the Transposition function
   Encrypted_Text := Transposition(False, Input_Text, Key);
   
   -- Display the encrypted text
   Put_Line("Encrypted Text: " & Encrypted_Text);

   -- Decrypt the encrypted text using the Transposition function
   Decrypted_Text := Transposition(True, Encrypted_Text, Key);
   
   -- Display the decrypted text
   Put_Line("Decrypted Text: " & Decrypted_Text);
end Main;
```

## utils (Utility functions)

```ada
procedure Main is
   File_Name : String := "example.txt";
   Overwrite : Boolean;
begin
   -- Check if the file exists and ask if the user wants to overwrite it
   if Warn_If_File_Exists(File_Name) then
      Put_Line("Overwriting the file " & File_Name);
      -- Code to handle file overwrite goes here
   else
      Put_Line("Not overwriting the file " & File_Name);
      -- Code to handle when the user chooses not to overwrite goes here
   end if;
end Main;
```
