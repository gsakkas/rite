
let rec sumList xs =
  match sumList with | [] -> 0 | head::tail -> head + (sumList tail);;
