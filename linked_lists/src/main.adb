with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

procedure Main is
   type node;
   type p_node is access node;
   type node is record
      element: integer;
      next: p_node;
   end record;

   list : p_node := null;
   one : Integer := Integer(1);
   two : Integer := Integer(2);
   three : Integer := Integer(3);
   four : Integer := Integer(4);
   five : Integer := Integer(5);

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

      else

         -- iterate through the list until we reach the end
         -- or we find the right spot for insertion
         while current_node /= null loop

            count := count + 1;

            -- last element
            if current_node.next = null then

               current_node.next := new node'(element, null);
               exit;

            end if;

            prev_node := current_node;
            current_node := current_node.next;

         end loop;
      end if;
      Put("Ran through list " & Integer'Image(count) & " times.");
   end insert;

   procedure put (list: in p_node) is
      current_node : p_node := list;
   begin
      loop
         Put(current_node.element);
         current_node := current_node.next;

         exit when current_node = null;
      end loop;
      Put_Line("");
   end;

begin
   insert(one, list);
   put(list);
   insert(two, list);
   put(list);
   insert(three, list);
   put(list);
   insert(four, list);
   put(list);
   insert(five, list);
   put(list);
end Main;
