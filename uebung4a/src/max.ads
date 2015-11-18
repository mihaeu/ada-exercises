generic
    type any is private;
    with function "<" (x: any; y: any) return boolean is <>;

package Max is
    function max (a: any; b: any) return any;
end Max;
