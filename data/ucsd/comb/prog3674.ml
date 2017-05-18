
let rec sumList xs = let x::t = xs in if t != [] then x + (sumList t);;
