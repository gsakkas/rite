
let rec filter l a =
  match l with
  | [] -> []
  | h::t -> if h = a then filter t a else h :: (filter t a);;

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = seen @ h in
        let rest' = filter (t, h) in helper (seen', rest') in
  List.rev (helper ([], l));;
