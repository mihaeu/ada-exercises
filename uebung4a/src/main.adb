with Ada.Text_IO; use Ada.Text_IO;
with Person;      use Person;
with Max_Person;  use Max_Person;

procedure Main is
    person1    : Person.Person := ("Hans      ", 1);
    person2    : Person.Person := ("Peter     ", 2);
    person3    : Person.Person := ("Heinz     ", 3);
    personTemp : Person.Person;
begin
    personTemp := max(person1, person2);
    Put("Should be Peter: ");
    Put(personTemp.Name);
    Put_Line("");

    personTemp := max(person3, person1);
    Put("Should be Heinz: ");
    Put(personTemp.Name);
    Put_Line("");

    personTemp := max(person3, person2);
    Put("Should be Heinz: ");
    Put(personTemp.Name);
    Put_Line("");

end Main;
