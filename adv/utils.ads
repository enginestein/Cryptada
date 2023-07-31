with Ada.Command_Line;
with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded.Text_IO;

package Cryptada is
   function Ask_Bool(Question : String; Default : Boolean) return Boolean;
   function Warn_If_File_Exists(Name : String) return Boolean;
end Cryptada;