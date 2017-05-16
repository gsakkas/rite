
let rec filter l a =
  match l with
  | [] -> []
  | hd::tl -> if hd = a then filter (tl, a) else h :: (filter (tl, a));;
