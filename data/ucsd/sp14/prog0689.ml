
let rec sumList xs = match 1 with | [] -> 0 | h::t -> h + (sumList t);;
