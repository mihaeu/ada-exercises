with Ada.Text_IO;                    use Ada.Text_IO;
with Ada.Integer_Text_IO;            use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded;          use Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;       use Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Fixed;              use Ada.Strings.Fixed;

procedure Main is
    type node;
    type p_node is access node;
    type node is record
        element: integer;
        next: p_node;
    end record;

    list    : p_node := null;
    one     : Integer := Integer(1);
    two     : Integer := Integer(2);
    three   : Integer := Integer(3);
    four    : Integer := Integer(4);
    five    : Integer := Integer(5);

    procedure insert (element : in Integer;
                     list : in out p_node) is
        current_node, prev_node : p_node;
        count : Integer := 1;
    begin
        current_node := list;
        prev_node := list;

        -- list is empty
        if current_node = null then
         list := new node'(element, null);
        -- special case: first item is the right place for insertion
        elsif current_node = list and element < current_node.element then
            list := new node'(element, null);
            list.next := current_node;

    else
         -- iterate through the list until we reach the end
         -- or we find the right spot for insertion
         while current_node /= null loop

            -- current node is greater so we need to insert before
            if current_node.element > element then

                prev_node.next := new node'(element, null);
                prev_node.next.next := current_node;
                exit;

            -- insert as last element
            elsif current_node.next = null then
                current_node.next := new node'(element, null);
                exit;
            end if;

            count := count + 1;
            prev_node := current_node;
            current_node := current_node.next;

         end loop;
        end if;

    end insert;

    function compress (list : p_node) return Unbounded_String is
        output : Unbounded_String;
        current_node : p_node := list;
    begin

        loop
         Append(output, Ada.Strings.Fixed.Trim(Integer'Image(current_node.element), Ada.Strings.Left));
         current_node := current_node.next;

         exit when current_node = null;

        end loop;
        return output;

    end compress;

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
