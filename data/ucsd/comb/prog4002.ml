
let rec listReverse l =
  match l with
  | _ -> []
  | x -> [x]
  | head::tail -> (listReverse tail) :: head;;
