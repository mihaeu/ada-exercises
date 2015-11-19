with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Fixed;     use Ada.Strings.Fixed;

generic
    type any is private;
    with function "<" (x: any; y: any) return boolean is <>;
    with function To_String (Source : any) return String;

package Linked_List is

    type list_type is private;

    procedure insert (element : in any; list : in out list_type);
    function compress (list : list_type) return Unbounded_String;

private

    type node;
    type p_node is access node;
    type node is record
        element: any;
        next: p_node;
    end record;

    -- list type is used to provide more information (e.g. length)
    -- and to hide implementation details
    type list_type is record
        start: p_node := null;
        count: Natural := 0;
    end record;

end Linked_List;
