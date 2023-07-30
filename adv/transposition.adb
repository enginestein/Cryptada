package body Cryptada is
   function Transposition(Decrypt_Mode: Boolean; Msg: String; Key: String) return String is
      Key_Uppercase : String := Ada.Strings.Fixed.ToUpper(Key);
      Cipher_Msg : String := Msg;
      Keys : Ada.Containers.Vectors.Vector(String, Positive);
   begin
      Keys.Clear;

      if Decrypt_Mode then
         for I in reverse range Key_Uppercase'First .. Key_Uppercase'Last loop
            Keys.Append(Key_Uppercase(I));
         end loop;
      else
         for I in range Key_Uppercase'First .. Key_Uppercase'Last loop
            Keys.Append(Key_Uppercase(I));
         end loop;
      end if;

      for Cipher_Key of Keys loop
         Cipher_Msg := Ada.Strings.Fixed.ToUpper(Ada.Strings.Fixed.Filter(Msg, Ada.Characters.Is_Letter));

         Cipher_Msg := case Decrypt_Mode is
            when False => Encrypt(Cipher_Msg, Cipher_Key);
            when True  => Decrypt(Cipher_Msg, Cipher_Key);
         end case;
      end loop;

      return Cipher_Msg;
   end Transposition;

   function Encrypt(Msg: String; Key_Order: String) return String is
      Encrypted_Msg : String := "";
      Encrypted_Vec : array(Positive range <>) of String(1 .. Msg'Length);
      Key_Len : Positive := Key_Order'Length;
      Msg_Index : Positive := Msg'Length;
      Key_Index : Positive := Key_Len;

      procedure Append_To_Msg(Chars : String) is
      begin
         Encrypted_Vec(Msg_Index) := Chars;
         Msg_Index := Msg_Index - 1;
      end Append_To_Msg;

   begin
      while Msg /= "" loop
         declare
            Chars : String := "";
            Index : Natural := 0;
         begin
            Key_Index := Key_Index - 1;
            while Index < Msg_Index loop
               Chars := Chars & Msg(Index+1);
               Index := Index + Key_Index;
               Msg_Index := Msg_Index - 1;
            end loop;

            Append_To_Msg(Chars);
         end;
      end loop;

      for J in 1 .. Key_Len loop
         for I in 1 .. Key_Order'Length loop
            if Key_Order(I) = J then
               Encrypted_Msg := Encrypted_Msg & Encrypted_Vec(I);
            end if;
         end loop;
      end loop;

      return Encrypted_Msg;
   end Encrypt;

   function Decrypt(Msg: String; Key_Order: String) return String is
      Decrypted_Msg : String := "";
      Decrypted_Vec : array(Positive range <>) of String(1 .. Msg'Length);
      Indexed_Vec : array(Positive range <>) of String(1 .. Msg'Length);
      Key_Len : Positive := Key_Order'Length;
      Split_Size : Positive := Msg'Length / Key_Len;
      Msg_Mod : Positive := Msg'Length mod Key_Len;
      Counter : Natural := Msg_Mod;
      Key_Split : Ada.Containers.Vectors.Vector(Positive) := Key_Order.all;
   begin
      declare
         (Split_Large, Split_Small) : aliased Key_Split;
      begin
         Split_Large.Sort;
         Split_Small.Sort;

         for Key_Index in reverse range Split_Large'First .. Split_Large'Last loop
            Counter := Counter - 1;
            for Index in ((Key_Index * Split_Size) + Counter) .. (((Key_Index + 1) * Split_Size) + Counter) loop
               Indexed_Vec(Key_Index) := Indexed_Vec(Key_Index) & Msg(Index);
            end loop;
         end loop;

         for Key_Index in Split_Small'Range loop
            declare
               Slice : String;
               Rest_Of_Msg : String;
            begin
               Slice := Msg(Msg'First .. (Split_Size - 1));
               Indexed_Vec(Key_Index) := Slice;
               Rest_Of_Msg := Msg(Split_Size .. Msg'Last);
               Msg := Rest_Of_Msg;
            end;
         end loop;
      end;

      for Key_Index of Key_Order loop
         for Column_Index in Indexed_Vec'Range loop
            if Key_Index = Integer(Indexed_Vec(Column_Index)(1)) then
               Decrypted_Vec(Decrypted_Vec'Last + 1) := Indexed_Vec(Column_Index);
            end if;
         end loop;
      end loop;

      for '_' in 1 .. Split_Size loop
         for Column_Index in Decrypted_Vec'Range loop
            Decrypted_Msg := Decrypted_Msg & Decrypted_Vec(Column_Index)(1);
            Decrypted_Vec(Column_Index) := Decrypted_Vec(Column_Index)(2..Decrypted_Vec(Column_Index)'Last);
         end loop;
      end loop;

      return Decrypted_Msg;
   end Decrypt;
end Cryptada;