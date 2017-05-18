
let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let _ = sumList [(33, 6)];;
