with Ada.Text_IO;                    use Ada.Text_IO;
with Ada.Integer_Text_IO;            use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded;          use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;       use Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Fixed;              use Ada.Strings.Fixed;
with Linked_List;                    use Linked_List;
with Variable_Length255;             use Variable_Length255;

procedure Main is

    list    : p_node := null;
    one     : Variable_String := To_Variable_String("1");
    two     : Variable_String := To_Variable_String("2");
    three   : Variable_String := To_Variable_String("3");
    four    : Variable_String := To_Variable_String("4");
    five    : Variable_String := To_Variable_String("5");

    procedure test (expected : String; list : p_node; test_message : String) is
        actual : Unbounded_String;
        state : String(1..1) := " ";
    begin
        actual := compress(list);

        if To_Unbounded_String(expected) = actual then
         state := "x";
        end if;

        Put_Line("[" & state & "]" & test_message);

--        pragma Assert(To_Unbounded_String(expected) = actual,
--                        "Failed asserting that " & expected & " is equal to " & To_String(actual) & ".");
    end;

begin

    -- Trying to insert 1 2 3 4 5
    insert(one, list);
    insert(two, list);
    insert(three, list);
    insert(four, list);
    insert(five, list);

    test("12345", list, "Inserts already ordered nodes");

    -- Trying to insert 3 4 1 5 1
    list := null;
    insert(three, list);
    insert(four, list);
    insert(one, list);
    insert(five, list);
    insert(one, list);

    test("11345", list, "Accepts duplicate nodes");

    -- Trying to insert 5 4 3 2 1
    list := null;
    insert(five, list);
    insert(four, list);
    insert(three, list);
    insert(two, list);
    insert(one, list);

    test("12345", list, "Inserts nodes in opposite order");

end Main;
