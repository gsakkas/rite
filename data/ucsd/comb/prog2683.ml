
let assoc (d,k,l) =
  let rec helper di ki li =
    match li with
    | h::t ->
        (match h with
         | hh::tt -> if hh = ki then di else helper di ki t
         | _ -> 0) in
  helper d k l;;

let _ = assoc ((-1), "bob", [("ranjit", 85); ("william", 23); ("moose", 44)]);;
