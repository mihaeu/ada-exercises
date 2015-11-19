with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

package body Person is

    function "<" (person1: Person; person2: Person) return Boolean is
    begin
        return person1.age < person2.age;
    end "<";

    function To_String (source: Person) return String is
    begin
        return
          To_String(source.last_name) & ", "
          & To_String(source.first_name) & " ("
          & Trim(Integer'Image(source.age), Both) & ")";
    end To_String;

end Person;
