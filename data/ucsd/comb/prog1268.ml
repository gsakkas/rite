
let rec additivePersistence n =
  match n with | [] -> [] | h::t -> h + (additivePersistence t);;
