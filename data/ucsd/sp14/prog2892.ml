
let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n = if n > 9 then digitalRoot (sumList n) else n;;
