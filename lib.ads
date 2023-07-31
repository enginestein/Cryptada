with "adv/another_rot13.ads";
with "adv/Main.ads";
with "adv/theoretical_rot13.ads";
with "adv/transposition.ads";
with "adv/utils.ads";

package Cryptada is 
   function Another_Rot13(Text : String) return String;
   function Ask_Bool(Question : String; Default : Boolean) return Boolean;
   function Warn_If_File_Exists(Name : String) return Boolean;
   function Encrypt(Text : String; Key : Natural) return String;
   function Decrypt(Text : String; Key : Natural) return String;
   function Transposition(Decrypt_Mode: Boolean; Msg: String; Key: String) return String;
   function Encrypt(Msg: String; Key_Order: String) return String;
   function Decrypt(Msg: String; Key_Order: String) return String;
   function Theoretical_Rot13(Text : String) return String;
end Cryptada;