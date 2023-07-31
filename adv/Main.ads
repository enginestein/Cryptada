with Ada.Command_Line;
with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded.Text_IO;

package Cryptada is
   function Encrypt(Text : String; Key : Natural) return String;
   function Decrypt(Text : String; Key : Natural) return String;
end Cryptada;
