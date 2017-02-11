
let rec helper acc l1 l2 =
  match l1 with
  | [] -> []
  | h::t -> helper ((h, l2) :: acc) (List.map (fun x  -> x * 10) t) l2;;

let _ = helper [] [4.3; 3; 1] [1; 2; 3; 4];;
