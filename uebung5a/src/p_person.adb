with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body P_Person is

    procedure Put (Element : in Person) is
    begin
        Put(Element.Number);
        Put(" " & Element.Name);
        Put_Line("");
    end Put;

end P_Person;
