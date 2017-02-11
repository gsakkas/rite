
let extract1 (p1,p2) = match (p1, p2) with | _ -> p1;;

let extract2 (p1,p2) = match (p1, p2) with | _ -> p2;;

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> if (extract1 h) = k then extract2 else assoc (d, k, t);;

let _ =
  assoc ((-1), "william", [("ranjit", 85); ("william", 23); ("moose", 44)]);;
