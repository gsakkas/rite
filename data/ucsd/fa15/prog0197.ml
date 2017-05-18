
let rec sumList xs = match xs with | [] -> [] | h::t -> h + (sumList t);;
