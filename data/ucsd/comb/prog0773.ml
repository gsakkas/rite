
let append x l =
  let rec helper x acc =
    match x with | [] -> acc | h::t -> helper t (acc :: h) in
  helper x l;;
