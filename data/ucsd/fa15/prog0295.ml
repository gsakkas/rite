
let rec listReverse l =
  let newList = [] in
  match l with
  | [] -> newList
  | head::tail -> (listReverse tail) @ (newList :: head);;

let _ = listReverse ["a"; "b"; "c"; "d"];;
