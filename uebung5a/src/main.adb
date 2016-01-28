with Person_Fifo;  use Person_Fifo;
with P_Person;     use P_Person;
with Ada.Text_IO;  use Ada.Text_IO;

procedure Main is
    Fifo : Person_Fifo.Storage;
    Last_Element : Person;
begin
    Put_Line(ASCII.LF & "-----------------------------------------------------"
             & ASCII.LF & "1st example, writing and then reading:"
             & ASCII.LF & "-----------------------------------------------------");
    Put("Writing Otto");
    Write((1, "Otto"), Fifo);

    Put(ASCII.LF & "Reading Otto");
    Read(Last_Element, Fifo);
    Put(Last_Element);

    Put_Line(ASCII.LF & "-----------------------------------------------------"
             & ASCII.LF & "2nd example, 2x writing and then reading:"
             & ASCII.LF & "-----------------------------------------------------");
    Put(ASCII.LF & "Writing Anna");
    Write((2, "Anna"), Fifo);

    Put(ASCII.LF & "Writing Otto");
    Write((1, "Otto"), Fifo);

    Read(Last_Element, Fifo);
    Put(ASCII.LF & "Reading first element, should be Anna:");
    Put(Last_Element);

    Put_Line(ASCII.LF & "-----------------------------------------------------"
             & ASCII.LF & "3rd example, 2x  more writing and then 3x reading:"
             & ASCII.LF & "-----------------------------------------------------");

    Put(ASCII.LF & "Writing Anna");
    Write((2, "Anna"), Fifo);

    Put(ASCII.LF & "Writing Karl");
    Write((3, "Karl"), Fifo);

    Read(Last_Element, Fifo);
    Put(ASCII.LF & "Reading element, should be Anna:");
    Put(Last_Element);

    Read(Last_Element, Fifo);
    Put(ASCII.LF & "Reading  element, should be Otto:");
    Put(Last_Element);

    Read(Last_Element, Fifo);
    Put(ASCII.LF & "Reading  element, should be Karl:");
    Put(Last_Element);

end Main;
