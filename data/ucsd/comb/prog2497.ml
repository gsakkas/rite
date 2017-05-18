
let rec listReverse l =
  let l' = [] in
  match l with | [] -> l' | h::t -> (List.hd l) :: (listReverse (List.tl l));;

let listReverse l =
  let rec lr l' = function | [] -> l' | h::t -> lr (h :: l') t in
  lr [] listReverse;;
