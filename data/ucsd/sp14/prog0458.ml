
let rec listReverse l =
  let rec lr l' =
    match l with | [] -> l' | h::t -> (lr (List.hd l)) :: (l' (List.tl l)) in
  lr [] listReverse;;
