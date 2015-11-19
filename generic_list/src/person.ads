with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package Person is

    type Person is record
        first_name: Unbounded_String;
        last_name: Unbounded_String;
        age: Integer;
    end record;

    function "<" (person1: Person; person2: Person) return Boolean;

    function To_String (source : Person) return String;

end Person;
