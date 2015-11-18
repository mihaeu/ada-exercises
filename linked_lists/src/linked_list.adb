package body Linked_List is

    procedure insert (element : in Variable_String;
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
            Append(
                   output,
                   Ada.Strings.Fixed.Trim(To_String(current_node.element),
                     Ada.Strings.Left)
            );
         current_node := current_node.next;

         exit when current_node = null;

        end loop;
        return output;

    end compress;

end Linked_List;
