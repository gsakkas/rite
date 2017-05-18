
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | (x,y)::ly -> if k = x then ly else assoc (d, k, ly);;

let _ =
  assoc ((-1), "william", [("ranjit", 85); ("william", 23); ("moose", 44)]);;
