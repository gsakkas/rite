
let rec sumList xs = let x::t = xs in if x != [] then x + (sumList t);;
