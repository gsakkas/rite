
let rec sumList xs = function | [] -> 0 | h::t -> h + (sumList t);;
