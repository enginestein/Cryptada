package body Cryptada is
   Input : constant String := "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
   Output : constant String := "NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm";

   function Another_Rot13(Text : String) return String is
      Result : String (1 .. Text'Length);
   begin
      for I in Text'Range loop
         declare
            Index : constant Natural := Input'Find(Character'Pos(Text(I), Input));
         begin
            if Index /= Input'Length then
               Result(I) := Output(Index + 1);
            else
               Result(I) := Text(I);
            end if;
         end;
      end loop;
      return Result;
   end Another_Rot13;
end Cryptada;