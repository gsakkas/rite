
let rec assoc (d,k,l) =
  match l with
  | (k',v')::tl -> if k' = k then v' else assoc d k tl
  | [] -> d
  | _ -> failwith "This ain't your mom's hashmap";;
