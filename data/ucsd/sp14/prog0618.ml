
let rec sumList xs = let x::t = xs in x + (if t != [] then sumList t);;
