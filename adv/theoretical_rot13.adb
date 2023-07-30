package body Cryptada is
   function Theoretical_Rot13(Text : String) return String is
      Pos : Character;
      NPos : Character;
      Encrypted_Msg : String := "";
   begin
      for C in Text'Range loop
         Pos := Text(C);
         if Character'Pos('a') <= Character'Pos(Pos) and Character'Pos(Pos) <= Character'Pos('z') then
            Pos := Character'Val(Character'Pos(Pos) - Character'Pos('a'));
            NPos := Character'Val((Character'Pos(Pos) + 13) mod 26 + Character'Pos('a'));
            Encrypted_Msg := Encrypted_Msg & NPos;
         else
            Encrypted_Msg := Encrypted_Msg & Pos;
         end if;
      end loop;

      return Encrypted_Msg;
   end Theoretical_Rot13;
end Cryptada;