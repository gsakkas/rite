
type 'a set =
  | Set of 'a list;;

let del x s =
  match s with
  | Set l -> let meh = Set (List.filter (fun z  -> z = x) l) in Set meh;;
