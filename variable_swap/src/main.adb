with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   L, R : Integer;

   procedure Swap (L : in out Integer; R : in out Integer) is
   X : Integer;
   begin
      X := L;
      L := R;
      R := X;
   end Swap;

begin
   Put_Line("Please enter the first variable: ");
   L := Integer'Value(Get_Line);
   Put_Line("Please enter the second variable: ");
   R := Integer'Value(Get_Line);

   Swap (L, R);
   Put_Line("First variable is now " & Integer'Image (L) & " and second variable is now " & Integer'Image (R));
   null;
end Main;
