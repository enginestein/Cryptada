with Ada.Command_Line;
with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded.Text_IO;

package Cryptada is
   function Transposition(Decrypt_Mode: Boolean; Msg: String; Key: String) return String;
   function Encrypt(Msg: String; Key_Order: String) return String;
   function Decrypt(Msg: String; Key_Order: String) return String;
end Cryptada;
