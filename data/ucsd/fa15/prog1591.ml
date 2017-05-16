
let rec sumList xs =
  match xs with | [] -> [] | h::t -> let h::t = xs in h + (sumList t);;
