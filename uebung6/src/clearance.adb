with Ada.Text_IO;            use Ada.Text_IO;
with Ada.Integer_Text_IO;    use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;      use Ada.Float_Text_IO;

-- Nehmen Sie an, Sie haben bei der Bank Schulden in Höhe von 17761.72 EUR. Der
-- Zinssatz beträgt 7% jährlich, mit monatlicher Verrechnung. Ihre konstante Tilgungsrate
-- sei 196.00 EUR monatlich.
--
-- Gewünscht ist die Ausgabe eines Tilgungsplans.
-- Implementieren Sie eine Lösung mit dezimalen Festpunktzahlen.
procedure Clearance is

    type Money is delta 0.01 digits 18;
    package My_FP_EA is new Ada.Text_IO.Decimal_IO(Money);
    use my_fp_ea;

    debt                 : Money   := 17761.72;
    clearance_rate       : Money   := 196.00;
    interest_rate        : Float   := 1.0 - 0.005833;
    months_until_cleared : Integer := 0;

begin

    loop
        debt := debt * interest_rate;
        debt := debt - clearance_rate;
        months_until_cleared := months_until_cleared + 1;
        exit when debt < 0.0;

    end loop;

    Put_Line("Months until cleared " & Integer'Image(months_until_cleared));

end Clearance;
