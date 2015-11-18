with Ada.Integer_Text_IO;       use Ada.Integer_Text_IO;
with Ada.Text_IO.Unbounded_IO;  use Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded;     use Ada.Strings.Unbounded;
with Ada.Text_IO;               use Ada.Text_IO;

procedure Main is
    generic
        type any is private;
    procedure swap_any (x,y : in out any);

    procedure swap_any (x,y : in out any) is
        t : any := x;
    begin
        x := y;
        y := t;
    end swap_any;

    procedure swap_integer is new swap_any(any => Integer);
    procedure swap_unbounded_string is new swap_any(any => Unbounded_String);

    i_a: Integer := 1;
    i_b: Integer := 2;
    s_a: Unbounded_String := To_Unbounded_String("1");
    s_b: Unbounded_String := To_Unbounded_String("2");

begin
    swap_integer(i_a, i_b);
    Put(i_a);
    Put(i_b);
    Put_Line("");

    swap_unbounded_string(s_a, s_b);
    Put(s_a);
    Put(s_b);
   null;
end Main;
