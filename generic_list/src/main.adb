with Ada.Text_IO;                    use Ada.Text_IO;
with Ada.Integer_Text_IO;            use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded;          use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;       use Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Fixed;              use Ada.Strings.Fixed;
with Person;                         use Person;
with Person_Linked_List;             use Person_Linked_List;

procedure Main is

    list    : list_type;
    list2    : list_type;
    list3    : list_type;
    one     : Person.Person := (To_Unbounded_String("Hans"),   To_Unbounded_String("Peter"),   21);
    two     : Person.Person := (To_Unbounded_String("Heinz"),  To_Unbounded_String("Kunz"),    77);
    three   : Person.Person := (To_Unbounded_String("Max"),    To_Unbounded_String("Muster"),  43);
    four    : Person.Person := (To_Unbounded_String("Peter"),  To_Unbounded_String("Meier"),   14);
    five    : Person.Person := (To_Unbounded_String("Franz"),  To_Unbounded_String("Josef"),   33);

    procedure test (expected : String; list : list_type; test_message : String) is
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

    test("Meier, Peter (14)"
         & "Peter, Hans (21)"
         & "Josef, Franz (33)"
         & "Muster, Max (43)"
         & "Kunz, Heinz (77)",
         list, "Inserts already ordered nodes");

    -- Trying to insert 3 4 1 5 1

    insert(three,  list2);
    insert(four,   list2);
    insert(one,    list2);
    insert(five,   list2);
    insert(one,    list2);

    test("Meier, Peter (14)"
         & "Peter, Hans (21)"
         & "Peter, Hans (21)"
         & "Josef, Franz (33)"
         & "Muster, Max (43)",
         list2, "Accepts duplicate nodes");

    -- Trying to insert 5 4 3 2 1

    insert(five,  list3);
    insert(four,  list3);
    insert(three, list3);
    insert(two,   list3);
    insert(one,   list3);

    test("Meier, Peter (14)"
         & "Peter, Hans (21)"
         & "Josef, Franz (33)"
         & "Muster, Max (43)"
         & "Kunz, Heinz (77)",
         list3, "Inserts nodes in opposite order");

end Main;
