with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings; use Ada.Strings;

package body Cryptada is
   function Ask_Bool(Question : String; Default : Boolean) return Boolean is
      Input : String(1 .. 4);
   begin
      Put(Question & " ");
      if Default then
         Put("[Y/n] ");
      else
         Put("[y/N] ");
      end if;

      Get_Line(Input);

      case To_Upper(Input) is
         when "Y" | "YES" | "TRUE" =>
            return True;
         when "N" | "NO" | "FALSE" =>
            return False;
         when others =>
            Put_Line("Invalid choice: '" & Input & "'");
            return Ask_Bool(Question, Default);
      end case;
   end Ask_Bool;

   function Warn_If_File_Exists(Name : String) return Boolean is
      use Ada.Text_IO;

      function Read_Line return String is
         Buffer : String(1 .. 4096);
         Last : Natural;
      begin
         Get_Line(Buffer, Last);
         return Buffer(1 .. Last);
      end Read_Line;

      File_Exists : Boolean := False;
      Input : String(1 .. 4);
   begin
      if Ada.Text_IO.File_Type.Exists(Name) then
         File_Exists := True;
         Put_Line("File " & Name & " already exists! Overwrite? ");
         Get_Line(Input);

         case To_Upper(Input) is
            when "Y" | "YES" | "TRUE" =>
               return True;
            when "N" | "NO" | "FALSE" =>
               return False;
            when others =>
               Put_Line("Invalid choice: '" & Input & "'");
               return Warn_If_File_Exists(Name);
         end case;
      end if;
      return File_Exists;
   end Warn_If_File_Exists;
end Cryptada;
