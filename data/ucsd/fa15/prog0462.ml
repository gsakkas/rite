
let rec lastListElement n =
  match n with
  | [] -> [[]]
  | x::[] -> x :: (lastListElement [])
  | x::y -> lastListElement y;;

let _ = lastListElement ["1"; "2"; "3"];;
