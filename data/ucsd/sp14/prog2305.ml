
let rec assoc (d,k,l) =
  let temp = l in
  let rec helper acc (d,k,l) =
    match temp with
    | [] -> d
    | h::t ->
        (match h with | (s,v) -> if s = k then v else helper (d, k, l) t) in
  helper (d, k, l) acc;;
