with predicates;          use predicates;
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Numerics.Discrete_Random;

procedure Main is
   -- Indexbereich 0 bist Natural'Last
    type ArrayInt is array (Natural range <>) of Integer;
    subtype myint10000 is Integer range -10_000 .. 10_000;

    package myrand is new Ada.Numerics.Discrete_Random(myint10000);

    g10000 : myrand.Generator;
    test_data : constant ArrayInt (0..200) := (others => myrand.Random(g10000));

    result : ArrayInt(test_data'Range);
    -- result_sorted : ArrayInt(test_data'Range);

   function filter
     (v : ArrayInt;
      x : Integer;
      p : predicate) return ArrayInt
   is
      temp : ArrayInt (v'Range);
      j    : Integer := 0;

   begin
      for i in v'Range loop
         if p (x, v (i)) then
            temp (j) := v (i);
            j        := j + 1;
         end if;
      end loop;
      -- funktioniert nicht wenn keine Elemente gefunden werden
      -- aber in Ada gibt es dafür ein Null-Array, das keine
      -- Fehler wirft
      return (temp (0 .. j - 1));
    end filter;

    function sort (input: ArrayInt) return ArrayInt is
        pivot : Integer;
    begin
        if input'Length <= 1 then
            return input;
        else
            pivot := input(input'Length / 2);
            return sort(filter(input, pivot, greater))
              & filter(input, pivot, equal)
              & sort(filter(input, pivot, less));
        end if;
    end sort;

begin
    result := sort(test_data);
    for i in result'range loop
        Put(result(i));
        Put_Line("");
    end loop;

   null;
end Main;
