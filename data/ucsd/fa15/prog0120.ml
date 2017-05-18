
let rec sumList xs =
  match xs with | [] -> 0 | h -> h | h::t -> h + (sumList t);;
