package predicates is

    type predicate is access function (l,r : integer) return boolean;

    function greater_op (l,r : integer) return boolean is (l>r);
    function equal_op   (l,r : integer) return boolean is (l=r);
    function less_op    (l,r : integer) return boolean is (l<r);

    greater : constant predicate := greater_op'access;  -- ">" 'access nicht erlaubt
    equal   : constant predicate := equal_op  'access;  -- deshalb dieser Umweg.
    less    : CONSTANT Predicate := Less_Op   'ACCESS;  -- Vgl. Diskussionsfrage!

end predicates;