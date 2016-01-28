package P_Person is

    type Person is
        record
            Number : Integer;
            Name   : String(1..4);
        end record;

    procedure Put(Element : in Person);

end P_Person;
