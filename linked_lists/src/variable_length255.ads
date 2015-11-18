-------------------------------------------------------------------------------
-- Package VARIABLE_LENGTH (specification)                                   --
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
--                                                                           --
-- Modifications by Theodor Tempelmeier (TT), 5. Feb. 2000                   --
                                                                             --
--    1. constant max length of 255 bytes (similar to Strings1 in Delphi)    --
--    2. Unary "+" as alternate name for function To_Variable_String         --
--                                                                           --
-- Note: the original version is flexible with respect to the max length     --
-- of the variable length strings. However, this means that the chosen       --
-- length has to be explicitly provided in some cases. To avoid this,        --
-- the simpler (but less flexible) version has been made.                    --
-------------------------------------------------------------------------------
with Ada.Strings;
package Variable_Length255 is
   pragma Pure (Variable_Length255);
   pragma Elaborate_Body;


   max : constant := 255;                -- added by TT

   type Variable_String is private;      -- changed by TT

   function Length (Source : Variable_String) return Natural;

   procedure Move (Source : in  Variable_String;
                   Target : out Variable_String;
                   Drop   : in  Ada.Strings.Truncation := Ada.Strings.Error);

   function  To_String  (Source : Variable_String) return String;
   function  To_Variable_String (Source : String := "";          -- changed by TT
                                 Drop   : Ada.Strings.Truncation := Ada.Strings.Error)
             return Variable_String;
   function "+" (Source : String) return Variable_String;        -- added by TT

   procedure To_Variable_String (Source : in  String := "";
                                 Target : out Variable_String;
                                 Drop   : in  Ada.Strings.Truncation := Ada.Strings.Error);

   function "&" (Left : Variable_String; Right : String)          return Variable_String ;
   function "&" (Left : Variable_String; Right : Character)       return Variable_String ;
   function "&" (Left : Variable_String; Right : Variable_String) return Variable_String ;

   function "="  (Left : Variable_String; Right : Variable_String) return Boolean;
   function "="  (Left : Variable_String; Right : String         ) return Boolean;
   function "="  (Left : String;          Right : Variable_String) return Boolean;

   function "<"  (Left : Variable_String; Right : Variable_String) return Boolean;
   function "<"  (Left : Variable_String; Right : String         ) return Boolean;
   function "<"  (Left : String;          Right : Variable_String) return Boolean;

   function "<=" (Left : Variable_String; Right : Variable_String) return Boolean;
   function "<=" (Left : Variable_String; Right : String         ) return Boolean;
   function "<=" (Left : String;          Right : Variable_String) return Boolean;

   function ">"  (Left : Variable_String; Right : Variable_String) return Boolean;
   function ">"  (Left : Variable_String; Right : String         ) return Boolean;
   function ">"  (Left : String;          Right : Variable_String) return Boolean;

   function ">=" (Left : Variable_String; Right : Variable_String) return Boolean;
   function ">=" (Left : Variable_String; Right : String         ) return Boolean;
   function ">=" (Left : String;          Right : Variable_String) return Boolean;

   Length_Error : exception renames Ada.Strings.Length_Error;

private
   type Variable_String is                                    -- changed by TT
      record
         Length  : Natural := 0;
         Content : String (1 .. max);
      end record;
end Variable_Length255;

