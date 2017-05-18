
let append x l =
  let rec helper x acc =
    match x with | [] -> acc | h::t -> helper t (h :: acc) in
  helper x l;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append listReverse t [h];;
