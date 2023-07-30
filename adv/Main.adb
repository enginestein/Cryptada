package body Cryptada is
   function Encrypt(Text : String; Key : Natural) return String is
      Result : String (1 .. Text'Length);
   begin
      for I in Text'Range loop
         Result(I) := Character'Val(Character'Pos(Text(I)) + Key);
      end loop;
      return Result;
   end Encrypt;

   function Decrypt(Text : String; Key : Natural) return String is
      Result : String (1 .. Text'Length);
   begin
      for I in Text'Range loop
         Result(I) := Character'Val(Character'Pos(Text(I)) - Key);
      end loop;
      return Result;
   end Decrypt;
end Cryptada;