
let rec myListReverse origList newList =
  match origList with | [] -> [] | h::t -> (myListReverse t h) :: newList;;
