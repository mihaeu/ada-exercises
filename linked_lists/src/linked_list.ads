with Ada.Strings.Unbounded;          use Ada.Strings.Unbounded;
with Variable_Length255;             use Variable_Length255;
with Ada.Strings.Fixed;              use Ada.Strings.Fixed;

package Linked_List is

    type node;
    type p_node is access node;
    type node is record
        element: Variable_String;
        next: p_node;
    end record;

    procedure insert (element : in Variable_String; list : in out p_node);
    function compress (list : p_node) return Unbounded_String;

end Linked_List;
