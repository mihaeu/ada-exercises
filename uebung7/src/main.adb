with Duration_IO;   use Duration_IO;
with Text_IO;       use Text_IO;
with Ada.Real_Time; use Ada.Real_Time;

procedure Main is

    start_time : Time := Clock;

    task t1 is
        entry start;
    end t1;

    task body t1 is
        i : Integer := 0;
        next_time : Time := Clock;
    begin
        accept start;
        loop
            next_time := next_time + To_Time_Span(1.0);
            if i mod 10 /= 0 then
                Put("Task 1: .");
                Put(To_Duration(Clock - start_time));
                Put_Line("");
            end if;
            delay until next_time;
            i := i + 1;
        end loop;
    end t1;

    task t2 is
        entry start;
    end t2;

    task body t2 is
    begin
        accept start;
        loop
            delay until Clock + To_Time_Span(10.0);
            Put("Task 2: x");
            Put(To_Duration(Clock - start_time));
            Put_Line("");
        end loop;
    end t2;


begin
    t1.start;
    t2.start;
end Main;
