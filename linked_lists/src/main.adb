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

            -- current node is greater so we need to insert before
            if current_node.element > element then

               if current_node = list then

                  list := new node'(element, null);
                  list.next := current_node;
                  exit;

               end if;

               prev_node.next := new node'(element, null);
               prev_node.next.next := current_node;
               Put_Line("Inserting");
               exit;

            -- last element
            elsif current_node.next = null then

               current_node.next := new node'(element, null);
               exit;

            end if;

            count := count + 1;
            prev_node := current_node;
            current_node := current_node.next;

         end loop;
      end if;
      Put_Line("---");
      Put_Line("Checked " & Integer'Image(count) & " nodes.");
   end insert;

   procedure put (list: in p_node) is
      current_node : p_node := list;
   begin
      Put("List: ");
      loop
         Put(current_node.element);
         current_node := current_node.next;

         exit when current_node = null;
      end loop;
      Put_Line("");
   end;

begin

   Put_Line("====================================================");
   Put_Line("Insert order: 1 2 3 4 5");

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

   Put_Line("====================================================");
   Put_Line("Insert order: 3 4 1 5 1");

   list := null;
   insert(three, list);
   put(list);
   insert(four, list);
   put(list);
   insert(one, list);
   put(list);
   insert(five, list);
   put(list);
   insert(one, list);
   put(list);

   Put_Line("====================================================");
   Put_Line("Insert order: 5 4 3 2 1");

   list := null;
   insert(five, list);
   put(list);
   insert(four, list);
   put(list);
   insert(three, list);
   put(list);
   insert(two, list);
   put(list);
   insert(one, list);
   put(list);


end Main;
