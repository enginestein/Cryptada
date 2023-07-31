with Ada.Command_Line;
with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded.Text_IO;

package Cryptada is
   function another_rot13.Another_Rot13(Text : String) return String;
   function utils.Ask_Bool(Question : String; Default : Boolean) return Boolean;
   function utils.Warn_If_File_Exists(Name : String) return Boolean;
   function Main.Encrypt(Text : String; Key : Natural) return String;
   function Main.Decrypt(Text : String; Key : Natural) return String;
   function transposition.Transposition(Decrypt_Mode: Boolean; Msg: String; Key: String) return String;
   function transposition.Encrypt(Msg: String; Key_Order: String) return String;
   function transposition.Decrypt(Msg: String; Key_Order: String) return String;
   function theoretical_rot13.Theoretical_Rot13(Text : String) return String;
end Cryptada;
