package body Person is

   ---------
   -- "<" --
   ---------

   function "<" (person_a: Person; person_b: Person) return Boolean is
   begin
        if person_a.Nr < person_b.Nr then
            return true;
        end if;
        return false;
   end "<";

end Person;
