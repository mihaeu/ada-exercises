package Person is

    type Person is record
        Name: String(1..10);
        Nr: Integer;
    end record;

    function "<" (person_a: Person; person_b: Person) return Boolean;

end Person;
