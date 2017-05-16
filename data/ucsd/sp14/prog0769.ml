
let append x l =
  let rec helper x l acc =
    match x with | [] -> l | h::t -> helper t l (acc :: h) in
  helper x l [];;
