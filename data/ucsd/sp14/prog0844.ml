
let rec sumList xs =
  match xs with | [] -> 0 | x::[] -> x | (x::y)::[] -> x + (sumList y);;
