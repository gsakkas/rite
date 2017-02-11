
let append x l =
  let rec helper x acc =
    match x with | [] -> acc | h::t -> helper t l (h :: acc) in
  helper x l;;
