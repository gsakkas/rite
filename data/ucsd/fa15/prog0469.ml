
let rec lastListElement n =
  match n with
  | [] -> failwith "ERROR: List must be of size 1 or greater"
  | x::[] -> x
  | x::y -> lastListElement y;;

let rec catLists x y =
  if not (x = [])
  then
    match x with
    | x::[] -> x :: y
    | h::t -> catLists t ((lastListElement x) :: y)
  else if x = [] then y else if y = [] then x;;
