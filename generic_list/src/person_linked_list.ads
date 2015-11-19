with Linked_List;
with Person; use Person;

package Person_Linked_List is new Linked_List (any => Person.Person, To_String => To_String);
