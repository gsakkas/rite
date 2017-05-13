
let assoc (d,k,l) =
  let rec helper di ki li =
    match li with
    | h::t ->
        (match h with
         | hh::tt -> if hh = ki then di else helper di ki tt
         | _ -> 0) in
  helper d k l;;
