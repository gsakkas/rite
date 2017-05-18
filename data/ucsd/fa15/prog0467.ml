
let rec lastListElement n =
  match n with
  | [] -> failwith "ERROR: List must be of size 1 or greater"
  | x::[] -> x
  | x::y -> lastListElement y;;

let rec catLists x y =
  match x with | [] -> x :: y | h::t -> catLists t ((lastListElement x) :: y);;
