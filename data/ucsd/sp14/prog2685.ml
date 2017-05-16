
let assoc (d,k,l) =
  match l with
  | h::t ->
      let rec helper di ki li = match li with | h::t -> h in helper d k h;;

let _ =
  let assoc (d,k,l) =
    match l with
    | h::t -> let (name,age) = h in if name = k then d else assoc (d, k, t)
    | _ -> d in
  helper d k h;;
