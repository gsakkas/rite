
let stringOfList f l =
  ("[" (fun x  -> fun acc  -> x ^ ("; " ^ acc)) List.fold_left (^) ""
     (List.map f l))
    ^ "]";;
