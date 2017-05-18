
let rec sumList xs =
  match xs with | [] -> [] | h1::h2::t -> h1 + (h2 sumList t);;
