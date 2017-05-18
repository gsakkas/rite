
let rec lastListElement n =
  match n with
  | [] -> []
  | x::[] -> x :: (lastListElement [])
  | x::y -> lastListElement y;;

let rec catLists x y =
  match x with | [] -> [] | h::t -> (catLists t [lastListElement x]) :: y;;
