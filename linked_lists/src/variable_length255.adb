-------------------------------------------------------------------------------
-- Package VARIABLE_LENGTH (body)                                            --
-- (C) Copyright 1997 ADALOG                                                 --
-- Author: J-P. Rosen                                                        --
--                                                                           --
-- Rights to use, distribute or modify this package in any way is hereby     --
-- granted, provided this header is kept unchanged in all versions and the   --
-- associated documentation file is distributed unchanged.                   --
-- Additionnal headers may be added. If you make a valuable addition,        --
-- please keep us informed by sending a message to rosen.adalog@wanadoo.fr   --
--                                                                           --
-- ADALOG is providing training, consultancy and expertise in Ada and        --
-- related software engineering techniques. For more info about our services:--
-- ADALOG                   Tel: +33 1 46 45 51 12                           --
-- 27, avenue de Verdun     Fax: +33 1 46 45 52 49                           --
-- 92170 VANVES             E-m: rosen.adalog@wanadoo.fr                     --
--                          URL: http://perso.wanadoo.fr/adalog              --
--                                                                           --
-- This package is distributed in the hope that it will be useful, but WITH- --
-- OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY  --
-- or FITNESS FOR A PARTICULAR PURPOSE.                                      --
-------------------------------------------------------------------------------
package body Variable_Length255 is
   function Length (Source : Variable_String) return Natural is
   begin
      return Source.Length;
   end Length;

   procedure Move (Source : in  Variable_String;
                   Target : out Variable_String;
                   Drop   : in  Ada.Strings.Truncation := Ada.Strings.Error) is
   begin
      To_Variable_String (To_String(Source), Target, Drop);
   end Move;

   function To_String (Source : Variable_String) return String is
   begin
      return Source.Content (1..Source.Length);
   end To_String;

   function  To_Variable_String (Source : String := "";
                                 Drop   : Ada.Strings.Truncation := Ada.Strings.Error)
      return Variable_String
   is
      Local_Object : Variable_String;
   begin
      To_Variable_String (Source, Local_Object, Drop);
      return Local_Object;
   end To_Variable_String;



   function "+" (Source : String) return Variable_String is
   begin
      return To_Variable_String (Source);
   end "+";




   procedure To_Variable_String (Source : in  String := "";
                                 Target : out Variable_String;
                                 Drop   : in  Ada.Strings.Truncation := Ada.Strings.Error)
   is
      use Ada.Strings;
   begin
      if Max >= Source'Length then
         Target.Length := Source'Length;
         Target.Content (1..Target.Length) := Source;
      else
         case Drop is
         when Left  =>
            Target.Length  := Source'Length;
            Target.Content := Source(Source'Last-Max+1 .. Source'Last);
         when Right =>
            Target.Length  := Source'Length;
            Target.Content := Source(Source'First .. Source'First+Max-1);
         when Error =>
            raise Length_Error;
         end case;
      end if;
   end To_Variable_String;






   function "&" (Left : Variable_String; Right : String) return Variable_String is
      Result : Variable_String := Left;
   begin
      if Result.Length + Right'Length > Max then
         raise Length_Error;
      else
         Result.Content(Result.Length+1 .. Result.Length+Right'Length) := Right;
         Result.Length := Result.Length + Right'Length;
      end if;
      return Result;
   end "&";

   function "&" (Left : Variable_String; Right : Character) return Variable_String is
      Result : Variable_String := Left;
   begin
      if Result.Length = Max then
         raise Length_Error;
      else
         Result.Length := Result.Length + 1;
         Result.Content(Result.Length) := Right;
      end if;
      return Result;
   end "&";

   function "&" (Left : Variable_String; Right : Variable_String) return Variable_String is
   begin
      return Left & To_String(Right);
   end "&";

   function "=" (Left : Variable_String; Right : Variable_String) return Boolean is
   begin
      return To_String(Left) = To_String(Right);
   end "=";

   function "=" (Left : Variable_String; Right : String) return Boolean is
   begin
      return To_String(Left) = Right;
   end "=";

   function "=" (Left : String; Right : Variable_String) return Boolean is
   begin
      return Left = To_String(Right);
   end "=";

   function "<" (Left : Variable_String; Right : Variable_String) return Boolean is
   begin
      return To_String(Left) < To_String(Right);
   end "<";

   function "<" (Left : Variable_String; Right : String) return Boolean is
   begin
      return To_String(Left) < Right;
   end "<";

   function "<" (Left : String; Right : Variable_String) return Boolean is
   begin
      return Left < To_String(Right);
   end "<";

   function "<=" (Left : Variable_String; Right : Variable_String) return Boolean is
   begin
      return To_String(Left) <= To_String(Right);
   end "<=";

   function "<=" (Left : Variable_String; Right : String) return Boolean is
   begin
      return To_String(Left) <= Right;
   end "<=";

   function "<=" (Left : String; Right : Variable_String) return Boolean is
   begin
      return Left <= To_String(Right);
   end "<=";

   function ">" (Left : Variable_String; Right : Variable_String) return Boolean is
   begin
      return To_String(Left) > To_String(Right);
   end ">";

   function ">" (Left : Variable_String; Right : String) return Boolean is
   begin
      return To_String(Left) > Right;
   end ">";

   function ">" (Left : String; Right : Variable_String) return Boolean is
   begin
      return Left > To_String(Right);
   end ">";

   function ">=" (Left : Variable_String; Right : Variable_String) return Boolean is
   begin
      return To_String(Left) >= To_String(Right);
   end ">=";

   function ">=" (Left : Variable_String; Right : String) return Boolean is
   begin
      return To_String(Left) >= Right;
   end ">=";

   function ">=" (Left : String; Right : Variable_String) return Boolean is
   begin
      return Left >= To_String(Right);
   end ">=";

end Variable_Length255;

