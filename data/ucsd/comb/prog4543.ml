
let rec sumList xs =
  match xs with | [] -> [] | head::tail -> head + (sumList tail);;
